#!/usr/bin/env python3
import rospy

from req_c_pkg.msg import HeaderAndReading

from rospy.rostime import Time
from nav_msgs.msg import OccupancyGrid
import numpy as np
from std_msgs.msg import String
from skimage.draw import line

# log odds to probability
def l2p(log_odds):
    return 1 / (1 + np.exp(-log_odds))


# probability to log odds
def p2l(prob):
    return np.log(prob / (1 - prob))
    

class Particle():
    def __init__(self, num_particles, noise):

        self.noise = noise

        # initialize robot pose at origin
        self.pose = np.vstack([0., 0., 0.])

        # initialize weights uniformly
        self.weight = 1.0 / float(num_particles)

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


    def prediction_step(self, u, dt):
        # TODO check if this is correct from lecture
        # u: speed, angular velocity
        # dt: time interval
        a = 0.01
        # TODO maybe will put this equal to zero????
        vel_noise_std = a * (u[0]**2) + a * (u[1]**2)
        # add sample noise to the control input
        v = u[0] + np.random.normal(0, vel_noise_std)
        w = u[1] + np.random.normal(0, vel_noise_std)
        theta0 = self.pose[2]
        # account for linear velocity only
        if w == 0:
            self.pose[0] += v * dt * np.cos(theta0)
            self.pose[1] += v * dt * np.sin(theta0)
        else:
            self.pose[0] += v/w * (np.sin(theta0 + w*dt) - np.sin(theta0))
            self.pose[1] += v/w * (-np.cos(theta0 + w*dt) + np.cos(theta0))
        self.pose[2] += (w + np.random.normal(0, vel_noise_std))* dt % (2 * np.pi)

    def update_map(self, angles, sensor_data, yaw):
        # update map using sensor data like in grid_mapping_callback
        pass
    def get_distance_to_wall(self, angles, sensor_data):
        # get distance to wall using max range (z_expected)
        pass
    def correction_step(self,angles, sensor_data):
        # update particle map, weights
        # TODO merge update_map and get_distance_to_wall into one function
        yaw = self.pose[2]
        x0 = self.pose[0]
        y0 = self.pose[1]

        # update weights (z_expected - z_actual) -> gaussain? inverse?

        # update map

        # resample??

        pass

class SLAM():
    def __init__(self):
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
        # Initialize Node with node name
        rospy.init_node('grid_mapping')
        
        self.prevTime = Time.now().to_sec()
        # Assign node as a subscriber to sensor topic
        # sub = rospy.Subscriber('/sensor_topic', HeaderAndReading,grid_mapping_callback)
        sub = rospy.Subscriber('/sensor_topic', HeaderAndReading,self.grid_mapping_callback)
        # Wait for messages
        rospy.spin()

    # grid_map = list(np.array(grid_map*-1).astype(int).flatten())
    def update_map(self, angles, sensors_data, pose, yaw):
        x0 = pose.position.x
        y0 = pose.position.y
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

    
        # odometry
        pose = msg.pose.pose
        yaw = self.quaternion_to_yaw(pose)
        twist = msg.twist
        print('position: ', pose.position)
        print('orientation: ', pose.orientation)
        # sensors
        angles = msg.angles
        sensors_data = msg.sensors_data
        # sensors readings
        # print('I received: {}'.format(msg.sensors_data[-1]))
        map_msg = OccupancyGrid()

        map_msg.header.frame_id = 'robot_map'
        map_msg.info.resolution = self.resolution
        map_msg.info.width = self.map_width
        map_msg.info.height = self.map_height
        map_msg.info.origin.position.x = self.map_center_x
        map_msg.info.origin.position.y = self.map_center_y


        if Time.now().to_sec() - self.prevTime > 1:
            self.update_map(angles, sensors_data, pose, yaw)
            # map_msg.data = list(np.array(l2p(self.grid_map)*100).astype(int).flatten())
            map_msg.data = np.array(l2p(self.grid_map)*100).astype(int).flatten().tolist()
            self.prevTime = Time.now().to_sec()
            print('map sent')
        map_msg.header.stamp = Time.now()
        pub.publish(map_msg)
        print('grid mapping msg sent')

    def update_weights(self):
        pass
    
    def resample(self):
        pass



if __name__ == '__main__':
    try:
        obj = SLAM()
    except rospy.ROSInterruptException:
        pass