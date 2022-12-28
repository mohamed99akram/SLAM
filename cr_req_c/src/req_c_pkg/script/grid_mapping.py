#!/usr/bin/env python3
import rospy

from req_c_pkg.msg import HeaderAndReading

from rospy.rostime import Time
from nav_msgs.msg import OccupancyGrid
import numpy as np
from std_msgs.msg import String

class GridMapper():
    def __init__(self):
        self.map_width = 4992
        self.map_height = 4992

        self.grid_map = np.ones((self.map_height, self.map_width))
        # Initialize Node with node name
        rospy.init_node('grid_mapping')
        
        self.prevTime = Time.now().to_sec()
        # Assign node as a subscriber to sensor topic
        # sub = rospy.Subscriber('/sensor_topic', HeaderAndReading,grid_mapping_callback)
        sub = rospy.Subscriber('/sensor_topic', HeaderAndReading,self.grid_mapping_callback)
        # Wait for messages
        rospy.spin()

    # grid_map = list(np.array(grid_map*-1).astype(int).flatten())
    def update_map(self, grid_map, angles, sensors_data):
        pass

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
        pose = msg.pose
        twist = msg.twist
        print('position: ', msg.pose.pose.position)
        # sensors
        angles = msg.angles
        sensors_data = msg.sensors_data
        # sensors readings
        # print('I received: {}'.format(msg.sensors_data[-1]))
        map_msg = OccupancyGrid()

        map_msg.header.frame_id = 'map'
        map_msg.info.resolution = 0.02
        map_msg.info.width = self.map_width
        map_msg.info.height = self.map_height
        map_msg.info.origin.position.x = -50
        map_msg.info.origin.position.y = -50


        if Time.now().to_sec() - self.prevTime > 2.5:
            map_msg.data = list(np.array(self.grid_map*50).astype(int).flatten())
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