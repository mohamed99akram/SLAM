#!/usr/bin/env python3
import rospy

from sensor_msgs.msg import LaserScan
import message_filters
# import HeaderAndReading

from std_msgs.msg import String
from req_b_pkg.msg import HeaderAndReading

from nav_msgs.msg import Odometry
from rospy.rostime import Time
import numpy as np

def hub_callback(front, rear, odom):
    # print min and max of front and rear laser in deg
    # print('front: ', np.rad2deg(front.angle_min), np.rad2deg(front.angle_max))
    # print('rear: ', np.rad2deg(rear.angle_min), np.rad2deg(rear.angle_max))
    # print('front: ', (front.angle_min), (front.angle_max))
    # print('rear: ', (rear.angle_min), (rear.angle_max))

    msggg = HeaderAndReading()
    msggg.pose = odom.pose
    msggg.twist = odom.twist
    
    # Front
    front_angles_readings = list(zip(np.arange(front.angle_min, front.angle_max+front.angle_increment, front.angle_increment), front.ranges))
    # print("front1: ", [(np.rad2deg(a),b) for (a,b) in front_angles_readings])
    # take -90 to 90
    front_angles_readings = list(filter(lambda x: np.rad2deg(x[0]) >= -90 and np.rad2deg(x[0]) < 90, front_angles_readings))
    # print("front2: ", [(np.rad2deg(a),b) for (a,b) in front_angles_readings])
    # Rear
    rear_angles_readings = list(zip(np.arange(rear.angle_min, rear.angle_max+rear.angle_increment, rear.angle_increment), rear.ranges))
    # print('rear1: ', [(np.rad2deg(a), b) for (a,b) in rear_angles_readings])
    # take -90 to 90
    rear_angles_readings = list(filter(lambda x: np.rad2deg(x[0]) >= -90 and np.rad2deg(x[0])< 90, rear_angles_readings))
    # print('rear2: ', [(np.rad2deg(a), b) for (a,b) in rear_angles_readings])
    # [-135:135] -> [-45:45]
    rear_angles_readings = list(map(lambda x: (x[0] + (np.deg2rad(180) if x[0] < np.deg2rad(0) else np.deg2rad(-180)), x[1]), rear_angles_readings))
    # print('rear3: ', [(np.rad2deg(a), b) for (a,b) in rear_angles_readings])
    all_readings = sorted(front_angles_readings + rear_angles_readings)

    angles2, ranges2 = zip(*all_readings)
    msggg.angles = angles2
    msggg.sensors_data = ranges2
    print(msggg.pose)
    msggg.header.stamp = Time.now()
    # print('PRODUCED: ', list(zip(np.rad2deg(angles2), ranges2)))
    # print(len(all_readings))
    # publish msggg to sensor_topic
    pub = rospy.Publisher('/sensor_topic', HeaderAndReading, queue_size=10)
    pub.publish(msggg)

    print('position: ', odom.pose.pose.position)
    print(f'/sensor_topic written')


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