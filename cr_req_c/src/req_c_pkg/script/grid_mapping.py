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
    
class GridMapper():
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
            map_msg.data = list(np.array(l2p(self.grid_map)*100).astype(int).flatten())
            self.prevTime = Time.now().to_sec()
            print('map sent')
        map_msg.header.stamp = Time.now()
        pub.publish(map_msg)
        print('grid mapping msg sent')


if __name__ == '__main__':
    try:
        obj = GridMapper()
    except rospy.ROSInterruptException:
        pass