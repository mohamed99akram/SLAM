#!/usr/bin/env python3
import rospy

from req_c_pkg.msg import HeaderAndReading
from req_c_pkg.msg import HeaderAndReadings

from rospy.rostime import Time
from nav_msgs.msg import OccupancyGrid
import numpy as np
from std_msgs.msg import String
from skimage.draw import line
from scipy.stats import multivariate_normal

import copy
import random
# log odds to probability


def l2p(log_odds):
    return 1 / (1 + np.exp(-log_odds))


# probability to log odds
def p2l(prob):
    return np.log(prob / (1 - prob))

def normalize_angle(angle):

    # while angle > np.pi:
    #     angle = angle - 2. * np.pi

    # while angle < -np.pi:
    #     angle = angle + 2. * np.pi

    return angle

class Particle():
    def __init__(self, num_particles, noise=0.1):

        self.noise = noise  # dummy?

        # initialize robot pose at origin
        self.pose = np.vstack([0., 0., 0.])

        # initialize weights uniformly
        self.weight = 1.0 / float(num_particles)

        self.hit_thresh = p2l(0.75)

        # initialize the map
        self.map_width = 4992
        self.map_height = 4992
        self.inv_sensor_model_free = p2l(0.25)
        self.inv_sensor_model_occ = p2l(0.75)
        self.prior = p2l(0.5)
        self.resolution = 0.02
        self.map_center_x = -50
        self.map_center_y = -50
        # self.max_range = self.map_width * self.resolution
        self.max_range = 30

        self.grid_map = np.ones((self.map_height, self.map_width)) * self.prior

    def scan_matching(self, angles, sensors_data):
        # get matched scans (z_expected) to compare with actual sensor data (z_actual)
        x0 = self.pose[0]
        y0 = self.pose[1]
        yaw = self.pose[2]
        particle_distances = []
        for idx in range(len(angles)):
            angle = angles[idx]+np.deg2rad(45)
            sensor_data = sensors_data[idx]
            if sensor_data <= 0 or sensor_data > self.max_range:
                particle_distances.append(sensor_data)
                # print('--------- 1 --------')
                continue
            x = x0 + self.max_range * np.cos(yaw - angle)
            y = y0 + self.max_range * np.sin(yaw - angle)
            # x = x0 + sensor_data * np.cos(angle + yaw)
            # y = y0 + sensor_data * np.sin(angle + yaw)
            # target cell
            jt = int((x - self.map_center_x) / self.resolution)
            it = int((y - self.map_center_y) / self.resolution)
            # origin cell
            j0 = int((x0 - self.map_center_x) / self.resolution)
            i0 = int((y0 - self.map_center_y) / self.resolution)
            # ray tracing
            rr, cc = line(i0, j0, it, jt)
            
            for i, j in zip(rr, cc):
                if 0 <= i < self.map_height and 0 <= j < self.map_width:
                    if self.grid_map[i, j] >= self.prior:
                        # print('hi there!')
                        particle_distances.append(self.max_range - np.linalg.norm([i-it, j-jt])*self.resolution)
                        break
                    # else:
                    #     print(self.grid_map[i, j])
                        
            else:
                # print('--------- 2 --------')
                particle_distances.append(sensor_data)
        
        return np.array(particle_distances)

    def update_map(self, angles, sensors_data):
        # update map using sensor data like in grid_mapping_callback
        x0 = self.pose[0]
        y0 = self.pose[1]
        yaw = self.pose[2]
        for idx in range(len(angles)):
            angle = angles[idx]+np.deg2rad(45)
            sensor_data = sensors_data[idx]
            if sensor_data <= 0 or sensor_data > self.max_range:
                # print(sensor_data)
                continue
            x = x0 + sensor_data * np.cos(yaw - angle)
            y = y0 + sensor_data * np.sin(yaw - angle)
            # x = x0 + sensor_data * np.cos(angle + yaw)
            # y = y0 + sensor_data * np.sin(angle + yaw)
            # target cell
            jt = int((x - self.map_center_x) / self.resolution)
            it = int((y - self.map_center_y) / self.resolution)
            # origin cell
            j0 = int((x0 - self.map_center_x) / self.resolution)
            i0 = int((y0 - self.map_center_y) / self.resolution)
            # ray tracing
            prev_i = -1
            prev_j = -1
            rr, cc = line(i0, j0, it, jt)
            for i, j in zip(rr, cc):
                if 0 <= i < self.map_height and 0 <= j < self.map_width:
                    if i == it and j == jt:
                        self.grid_map[i, j] += 0.5 * self.inv_sensor_model_occ - self.prior
                    # connect previous cell to current cell to fill in the gap
                        if prev_i != -1:
                            rr2, cc2 = line(prev_i, prev_j, i, j)
                            for i2, j2 in zip(rr2, cc2):
                                if 0 <= i2 < self.map_height and 0 <= j2 < self.map_width:
                                    self.grid_map[i2, j2] += 0.5* self.inv_sensor_model_occ - self.prior
                        prev_i = i
                        prev_j = j
                        

                    else:
                        self.grid_map[i, j] += self.inv_sensor_model_free - self.prior
            

    def correction_step(self,angles, sensor_data):

        # update map
        self.update_map(angles, sensor_data)


        # update weights (scan_matching) (z_expected - z_actual) -> gaussain? inverse?
        particle_distances = self.scan_matching(angles, sensor_data)
        # # penalize weight by distance from sensor data
        query_dist = particle_distances.T
        mean = np.array(sensor_data).T
        # # cov = 1
        # print(query_dist)
        # print(mean)
        # temp = multivariate_normal.pdf(query_dist, mean=mean, cov=10*np.identity(len(sensor_data)))
        temp = np.exp(-np.linalg.norm(query_dist-mean)**2/(2*100**2))
        
        print('temp: ', temp)
        if(temp!=0 and not np.isnan(temp)):
            self.weight *= temp
        # resample??


class SLAM():
    def __init__(self):
        self.map_width = 4992
        self.map_height = 4992
        self.resolution = 0.02
        self.map_center_x = -50
        self.map_center_y = -50
        
        rospy.init_node('grid_mapping')
        self.currentParticle = -1
        # particle filter
        self.num_particles = 5
        self.particles = [Particle(self.num_particles) for _ in range(self.num_particles)]
        self.cur_time = Time.now().to_sec()
        self.index_of_best_particle = 0
        self.prevTime = Time.now().to_sec()
        # Assign node as a subscriber to new_poses topic
        sub = rospy.Subscriber('/new_poses', HeaderAndReadings,self.grid_mapping_callback, queue_size=1, buff_size=2**24)
        # Wait for messages
        rospy.spin()

    def quaternion_to_yaw(self, pose):
        w = pose.orientation.w
        x = pose.orientation.x
        y = pose.orientation.y
        z = pose.orientation.z
        yaw = np.arctan2(2*(w*z + x*y), 1 - 2*(y**2 + z**2))
        return yaw

#TODO subscribe only to the lasersensor topic
    def grid_mapping_callback(self, msg):
        print(np.array([p.weight for p in self.particles]))
        pub = rospy.Publisher('/map_topic', OccupancyGrid, queue_size=10)

        poses = msg.poses
        print('received new poses: ', poses[0].x, poses[0].y, poses[0].z)
        angles = msg.angles
        sensors_data = msg.sensors_data

        for i in range(self.num_particles):
            self.particles[i].pose[0] = poses[i].x
            self.particles[i].pose[1] = poses[i].y
            self.particles[i].pose[2] = poses[i].z

        # print('received new poses: ', poses[0].x, poses[0].y, poses[0].z)
        # normailze weights
        weights = np.array([p.weight for p in self.particles])
        weights_sum = weights.sum()

        for i in range(self.num_particles):
            self.particles[i].weight/= weights_sum


        map_msg = OccupancyGrid()

        map_msg.header.frame_id = 'robot_map'
        map_msg.info.resolution = self.resolution
        map_msg.info.width = self.map_width
        map_msg.info.height = self.map_height
        map_msg.info.origin.position.x = self.map_center_x
        map_msg.info.origin.position.y = self.map_center_y


        # if Time.now().to_sec() - self.prevTime > 1:

        for i in range(self.num_particles):
            self.particles[i].correction_step(angles, sensors_data)

        all_weights = np.array([p.weight for p in self.particles])
        
        self.index_of_best_particle = all_weights.argmax()
        if(self.currentParticle != self.index_of_best_particle):
            print('best particle changed', self.index_of_best_particle)
            self.currentParticle = self.index_of_best_particle
        # print(self.index_of_best_particle)

        grid_map = self.particles[self.index_of_best_particle].grid_map
        map_msg.data = np.array(l2p(grid_map)*100).astype(int).flatten().tolist()
        self.prevTime = Time.now().to_sec()
        # print('map sent')
        s = sum([particle.weight for particle in self.particles])
        neff = 1. / sum([(particle.weight/s) ** 2 for particle in self.particles])
        if neff < len(self.particles) / 2.:
            self.particles = self.resample(self.particles)
            print('resampled')

        bp = self.particles[self.index_of_best_particle]
        # print('best particle pose: ', bp.pose[0], bp.pose[1], bp.pose[2])

        self.cur_time = Time.now().to_sec()
        map_msg.header.stamp = Time.now()
        pub.publish(map_msg)
        # print('grid mapping msg sent')
    
    def resample(self, particles):
        num_particles = len(particles)
        new_particles = []
        weights = [particle.weight for particle in particles]

        # normalize the weight
        sum_weights = sum(weights)
        weights = [weight / sum_weights for weight in weights]

        # the cumulative sum
        cumulative_weights = np.cumsum(weights)
        normalized_weights_sum = cumulative_weights[len(cumulative_weights) - 1]

        # check: the normalized weights sum should be 1 now (up to float representation errors)
        assert abs(normalized_weights_sum - 1.0) < 1e-5

        # initialize the step and the current position on the roulette wheel
        step = normalized_weights_sum / num_particles
        position = random.uniform(0, normalized_weights_sum)
        idx = 1

        # walk along the wheel to select the particles
        for i in range(1, num_particles + 1):
            position += step
            if position > normalized_weights_sum:
                position -= normalized_weights_sum
                idx = 1
            while position > cumulative_weights[idx - 1]:
                idx = idx + 1

            new_particles.append(copy.deepcopy(particles[idx - 1]))
            new_particles[i - 1].weight = 1 / num_particles

        return new_particles



if __name__ == '__main__':
    try:
        obj = SLAM()
    except rospy.ROSInterruptException:
        pass
