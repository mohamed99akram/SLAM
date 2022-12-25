#!/usr/bin/env python3
import rospy

from sensor_msgs.msg import LaserScan
import message_filters
# import HeaderAndReading

from req_b_pkg.msg import HeaderAndReading

from nav_msgs.msg import Odometry
from rospy.rostime import Time

def rear_laser_callback(msg):
    print('rear: ', len(msg.ranges), type(msg.ranges))
    print('rear: ', msg.angle_increment)


def front_laser_callback(msg):
    print('front: ', len(msg.ranges), type(msg.ranges))
    print('front: ', msg.angle_increment)

def odom_callback(msg):
    print('odom: ', msg.pose.pose.position.x, msg.pose.pose.position.y)

def hub_callback(front, rear, odom):
    print('hub: ', front, rear, odom)


def main():
    # Initialize Node with node name
    rospy.init_node('sensor_reading')
    # Assign node as a subscriber to front_laser topic
    sub1 = message_filters.Subscriber('/robot/front_laser/scan', LaserScan)

    # Assign node as a subscriber to rear_laser topic
    sub2 = message_filters.Subscriber('/robot/rear_laser/scan', LaserScan)
    
    
    # Assign node as a subscriber to odom topic
    sub3 = message_filters.Subscriber('/robot/robotnik_base_control/odom', Odometry)

    ts = message_filters.ApproximateTimeSynchronizer(
        [sub1, sub2, sub3], 
        10,
        0.2,
        allow_headerless=False)
    
    ts.registerCallback(hub_callback)

    # Wait for messages
    rospy.spin()

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass