#!/usr/bin/env python3
import rospy

from req_c_pkg.msg import HeaderAndReading

from rospy.rostime import Time
from nav_msgs.msg import OccupancyGrid
import numpy as np
from std_msgs.msg import String
map_width = 1500
map_height = 1500

grid_map = np.ones((map_height, map_width))
# grid_map = list(np.array(grid_map*-1).astype(int).flatten())
def update_map(grid_map, angles, sensors_data):
    pass

def quaternion_to_yaw(pose):
    w = pose.orientation.w
    x = pose.orientation.x
    y = pose.orientation.y
    z = pose.orientation.z
    yaw = np.arctan2(2*(w*z + x*y), 1 - 2*(y**2 + z**2))
    return yaw


def grid_mapping_callback(msg):
    
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

    map_msg.info.resolution = 0.02
    map_msg.info.width = map_width
    map_msg.info.height = map_height
    map_msg.info.origin.position.x = -50
    map_msg.info.origin.position.y = -50

    map_msg.data = list(np.array(grid_map*50).astype(int).flatten())

    map_msg.header.stamp = Time.now()
    pub.publish(map_msg)
    print('grid mapping msg sent')

def main():
    # Initialize Node with node name
    rospy.init_node('grid_mapping')
    # Assign node as a subscriber to sensor topic
    # sub = rospy.Subscriber('/sensor_topic', HeaderAndReading,grid_mapping_callback)
    sub = rospy.Subscriber('/sensor_topic', HeaderAndReading,grid_mapping_callback)
    # Wait for messages
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass