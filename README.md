# What is this?

This is a project for cognitive robotics course. It is implemented using ROS and simulation of summit-xl robot navigating in the willow garage environment. The project implemets grid mapping and SLAM (Simultaneous Localization and Mapping) for the robot.

the scripts are for ubuntu, and it is adviced to use ubuntu20.04  
You can use [this](https://www.theconstructsim.com/) but it is slow.

# Implemented:
- Robot controls with keys W, A, S, and D. (CR_req)  
- Sensors incorporation. (CR_req_b)  
- Mapping with known poses using Occupancy Grid mapping. (CR_req_c)
- FastSLAM using particle filter. (CR_req_c)

# Demo



https://user-images.githubusercontent.com/69890013/211123378-448ec2d5-8c6b-4c10-8747-e998ecdd6818.mp4


# Getting Started:


1- Download ROS
Full version: [link](http://wiki.ros.org/noetic/Installation/Ubuntu)

2- Clone this Repo

3- Delete build folders

4- in each directory cr_req..: run `catkin_make`  

in multiple terminals, do the following: 
# Launch Gazebo & rViz
`cd cr_project`  
`roslaunch summit_xl_sim_bringup summit_xls_complete.launch`  

# launch keyboard control
`rosrun teleop_twist_keyboard teleop_twist_keyboard.py /cmd_vel:=/robot/robotnik_base_control/cmd_vel`

or 
`cd cr_req`  
`source ./devel/setup.bash`  
`chmod +x src/req_pkg/script/control_wasd.py`  -> only once   
`rosrun req_pkg control_wasd.py`  

# launch sensors reader node

`cd cr_req_b`  
`chmod +x src/req_b_pkg/script/sensor_reading.py`    -> only once   
`source ./devel/setup.bash`  
`roslaunch req_b_pkg multi.launch`


# To run grid mapping:
`cd cr_req_c`  
`source ./devel/setup.bash`  
`chmod +x src/req_c_pkg/script/grid_mapping.py`    -> only once   
`rosrun req_c_pkg grid_mapping.py`


# To run SLAM: (v2)
`cd cr_req_c`  
`source ./devel/setup.bash`  
### localization
`chmod +x src/req_c_pkg/script/localizer.py`    -> only once   
`rosrun req_c_pkg localizer.py`

### mapping
`chmod +x src/req_c_pkg/script/slam2.py`    -> only once   
`rosrun req_c_pkg slam2.py`
