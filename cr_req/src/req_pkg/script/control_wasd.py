#!/usr/bin/env python3
import rospy

from rospy.rostime import Time
from geometry_msgs.msg import TwistStamped
from geometry_msgs.msg import Twist

import sys
from select import select
import termios
import tty
def main():
    # Initialize Node with node name
    rospy.init_node('control_wasd')
    # Assign node as a publisher to this topic
    pub = rospy.Publisher('/robot/robotnik_base_control/cmd_vel', Twist, queue_size=10)
    # Get the current time in seconds
    start = Time.now().to_sec()
    acceleration = 1.0
    angle = 0.0
    max_speed = 20
    while not rospy.is_shutdown():
        # If 5 seconds are passed
        if Time.now().to_sec() - start >= 0:
            tty.setraw(sys.stdin.fileno())
            rlist, _, _ = select([sys.stdin], [], [], 0.5)
            key = None
            
            if rlist:
                key = sys.stdin.read(1)
            else:
                key = ''

            msg = Twist()
            if key != '' and key != None:
                # print('Entered: ', key)
                pass
            else:
                msg.linear.x=acceleration
                acceleration-=10
                acceleration = max(0, acceleration)

            if key == '\x03':
                break
            
            if key == 'w':
                msg.linear.x =  acceleration
                msg.angular.z = 0
                acceleration+=0.1
                acceleration = min(acceleration, max_speed)

            elif key == 's':
                msg.linear.x =  acceleration
                msg.angular.z = 0
                acceleration-=0.1
                acceleration = max(acceleration, -max_speed)

            elif key == 'a':
                msg.linear.x =  acceleration
                # acceleration+=0.1
                acceleration = min(acceleration, max_speed)
                msg.angular.z = angle
                angle+=0.1
                angle = min(angle, 1)
            
            elif key == 'd':
                msg.linear.x =  acceleration
                # acceleration+=0.1
                acceleration = min(acceleration, max_speed)
                msg.angular.z = angle
                angle-=0.1
                angle = max(angle, -1)
            else:
                msg.linear.x = 0
                msg.angular.z = 0
                acceleration = 0
                angle = 0


            settings = termios.tcgetattr(sys.stdin)
            termios.tcsetattr(sys.stdin, termios.TCSADRAIN, settings)

            # Broadcast the message to the topic cmd_vel
            pub.publish(msg)
            # print('msg sent')

if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        pass