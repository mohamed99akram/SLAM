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
        self.max_range = self.map_width * self.resolution

        self.grid_map = np.ones((self.map_height, self.map_width)) * self.prior

    # def prediction_step(self, u, dt):
    # 	# TODO check if this is correct from lecture
    # 	# u: speed, angular velocity
    # 	# dt: time interval
    # 	# a = 0.01
    #     a = 0
    #     print('particle got dt: ', dt)
    #     # TODO maybe will put this equal to zero????
    #     vel_noise_std = a * (u[0]**2) + a * (u[1]**2)
    #     # add sample noise to the control input
    #     v = u[0] + np.random.normal(0, vel_noise_std)
    #     print('v = ', v)
    #     w = u[1] + np.random.normal(0, vel_noise_std)
    #     theta0 = self.pose[2]
    #     # account for linear velocity only
    #     # if w == 0:
    #     self.pose[0] += v * dt * np.cos(theta0)
    #     self.pose[1] += v * dt * np.sin(theta0)
    #     self.pose[2] = normalize_angle(w * dt + theta0)
        # else:
        #     self.pose[0] += v/w * (np.sin(theta0 + w*dt) - np.sin(theta0))
        #     self.pose[1] += v/w * (-np.cos(theta0 + w*dt) + np.cos(theta0))
        # self.pose[2] += (w + np.random.normal(0, vel_noise_std))* dt #% (2 * np.pi)
    
    # def prediction_step(self, u, dt, pose, yaw):
    #     v = u[0]
    #     w = u[1]
    #     self.pose[0] = pose.position.x + np.random.normal(0, 1) * v
    #     self.pose[1] = pose.position.y + np.random.normal(0, 1) * v
    #     self.pose[2] = yaw + np.random.normal(0, 0.1) * w


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
                    if self.grid_map[i, j] > self.hit_thresh:
                        particle_distances.append(np.linalg.norm([i-it, j-jt])*self.resolution)
                        break
                        
            else:
                particle_distances.append(self.max_range)
        
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
            rr, cc = line(i0, j0, it, jt)
            for i, j in zip(rr, cc):
                if 0 <= i < self.map_height and 0 <= j < self.map_width:
                    if i == it and j == jt:
                        self.grid_map[i, j] += self.inv_sensor_model_occ - self.prior
                    else:
                        self.grid_map[i, j] += self.inv_sensor_model_free - self.prior
            

    def correction_step(self,angles, sensor_data):
        # update particle map, weights
        # TODO merge update_map and scan_matching into one function
        # alpha = 0.75
        # self.pose[0] += alpha * (pose.position.x - self.pose[0])
        # self.pose[1] += alpha * (pose.position.y - self.pose[1])
        # self.pose[2] += alpha * (yaw - self.pose[2])

        # update weights (scan_matching) (z_expected - z_actual) -> gaussain? inverse?
        particle_distances = self.scan_matching(angles, sensor_data)
        # Q_t = 0.1 * np.identity(2)
        # # penalize weight by distance from sensor data
        # # TODO what penality function to use?
        # query_dist = np.linalg.norm(particle_distances - sensor_data)
        query_dist = particle_distances.T
        mean = np.array(sensor_data).T
        # cov = Q_t # won't work, would it?
        # # cov = 1
        self.weight *= multivariate_normal.pdf(query_dist, mean=mean)
        # update map
        self.update_map(angles, sensor_data)
        # resample??


class SLAM():
    def __init__(self):
        self.map_width = 4992
        self.map_height = 4992
        # self.inv_sensor_model_free = p2l(0.25)
        # self.inv_sensor_model_occ = p2l(0.75)
        # self.prior = p2l(0.5)
        self.resolution = 0.02
        self.map_center_x = -50
        self.map_center_y = -50
        # self.max_range = self.map_width * self.resolution

        # self.grid_map = np.ones((self.map_height, self.map_width)) * self.prior
        # Initialize Node with node name
        rospy.init_node('grid_mapping')
        
        # particle filter
        self.num_particles = 1
        self.particles = [Particle(self.num_particles) for _ in range(self.num_particles)]
        self.cur_time = Time.now().to_sec()
        self.index_of_best_particle = 0
        self.prevTime = Time.now().to_sec()
        # Assign node as a subscriber to sensor topic
        # sub = rospy.Subscriber('/sensor_topic', HeaderAndReading,grid_mapping_callback)
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
        
        pub = rospy.Publisher('/map_topic', OccupancyGrid, queue_size=10)

        poses = msg.poses

        angles = msg.angles
        sensors_data = msg.sensors_data

        for i in range(self.num_particles):
            self.particles[i].pose[0] = poses[i].x
            self.particles[i].pose[1] = poses[i].y
            self.particles[i].pose[2] = poses[i].z

        print('received new poses: ', poses[0].x, poses[0].y, poses[0].z)
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
        print(self.index_of_best_particle)

        grid_map = self.particles[self.index_of_best_particle].grid_map
        map_msg.data = np.array(l2p(grid_map)*100).astype(int).flatten().tolist()
        self.prevTime = Time.now().to_sec()
        print('map sent')
        self.resample()

        bp = self.particles[self.index_of_best_particle]
        # print('best particle pose: ', bp.pose[0], bp.pose[1], bp.pose[2])

        self.cur_time = Time.now().to_sec()
        map_msg.header.stamp = Time.now()
        pub.publish(map_msg)
        # print('grid mapping msg sent')
    
    def resample(self):
        pass



if __name__ == '__main__':
    try:
        obj = SLAM()
    except rospy.ROSInterruptException:
        pass
