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
from geometry_msgs.msg import Vector3

def normalize_angle(angle):

    # while angle > np.pi:
    #     angle = angle - 2. * np.pi

    # while angle < -np.pi:
    #     angle = angle + 2. * np.pi

    return angle


class Localizer():
    def __init__(self):
        # Initialize Node with node name
        rospy.init_node('localizer')
        # Assign node as a subscriber to sensor topic
        # sub = rospy.Subscriber('/sensor_topic', HeaderAndReading,grid_mapping_callback)
        sub = rospy.Subscriber(
            '/sensor_topic', HeaderAndReading, self.grid_mapping_callback)
        # Wait for messages
        self.cur_time = Time.now().to_sec()
        self.num_particles = 1
        self.poses = np.zeros((self.num_particles, 3))
        rospy.spin()

    def quaternion_to_yaw(self, pose):
        w = pose.orientation.w
        x = pose.orientation.x
        y = pose.orientation.y
        z = pose.orientation.z
        yaw = np.arctan2(2*(w*z + x*y), 1 - 2*(y**2 + z**2))
        return yaw

    def prediction_step(self,idx, u, dt):
        pose = self.poses[idx]

        a = 0.1
        print('particle got dt: ', dt)
        
        vel_noise_std = a * (u[0]**2) + a * (u[1]**2)
        
        v = u[0] + np.random.normal(0, vel_noise_std)
        print('v = ', v)
        w = u[1] + np.random.normal(0, vel_noise_std)
        theta0 = pose[2]
        # account for linear velocity only
        if w == 0:
            pose[0] += v * dt * np.cos(theta0)
            pose[1] += v * dt * np.sin(theta0)
            # pose[2] = normalize_angle(w * dt + theta0)
        else:
            pose[0] += v/w * (np.sin(theta0 + w*dt) - np.sin(theta0))
            pose[1] += v/w * (-np.cos(theta0 + w*dt) + np.cos(theta0))
        pose[2] += (w + np.random.normal(0, vel_noise_std))* dt #% (2 * np.pi)

        self.poses[idx] = pose
        # pose[0] += v * dt * np.cos(theta0)
        # pose[1] += v * dt * np.sin(theta0)
        # pose[2] = normalize_angle(w * dt + theta0)
        # else:
        #     pose[0] += v/w * (np.sin(theta0 + w*dt) - np.sin(theta0))
        #     pose[1] += v/w * (-np.cos(theta0 + w*dt) + np.cos(theta0))
        # pose[2] += (w + np.random.normal(0, vel_noise_std))* dt #% (2 * np.pi)

    def grid_mapping_callback(self, msg):
        pub = rospy.Publisher('/new_poses', HeaderAndReadings, queue_size=10)
        # odometry
        # ! WILL NOT USE THESE!
        # pose = msg.pose.pose
        # yaw = quaternion_to_yaw(pose)

        twist = msg.twist.twist
        angles = msg.angles
        sensors_data = msg.sensors_data

        dt = Time.now().to_sec() - self.cur_time
        u = (twist.linear.x, twist.angular.z)

        for i in range(self.num_particles):
            self.prediction_step(i, u, dt)

        new_msg = HeaderAndReadings()
        new_msg.angles = angles
        new_msg.sensors_data = sensors_data
        
        new_msg.poses = []
        for i in range(self.num_particles):
            vec = Vector3()
            vec.x = self.poses[i][0]
            vec.y = self.poses[i][1]
            vec.z = self.poses[i][2]
            new_msg.poses.append(vec)
            
        self.cur_time = Time.now().to_sec()
        print('Estimated pose of first particle: ', self.poses[0])
        pub.publish(new_msg)


if __name__ == '__main__':
    try:
        obj = Localizer()
    except rospy.ROSInterruptException:
        pass
