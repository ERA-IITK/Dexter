# Dexter-2.0
Files related to Arm of Dexter 2.0

## How to Run
Make a catkin workspace, add test_description to src, build and launch gazebo.launch for Simulation and controller.launch for Controller (ros_control). Then one can run lower_servo_control.cpp and upper_servo_control from the controller package to control the respective motions of the Arm.

## Dependencies
ros_control, effort_controllers, joint_state_controller, and robot_state_publisher as global packages and obviously ROS and Gazebo

## Current Issues
Arm_Triangle, Back_Support, Component_48_1 and associated joints (The mechanism to keep the gripper holder stable) not being properly exported to the URDF, so they are excluded from the Simulation package. Need to correctly export them as URDF


On controlling the joint Rev_14 (Responsible for controlling the rack and pinion mechanism), the simulation goes haywire

-To replicate: Uncomment Rev_14 part in Simulation/test_description/launch/controller.yaml and add Rev_14 in args of the controller.launch file next to Rev_16. Save and launch

-Possible cause: Slider joint has lower and upper limits set to 0. It Might be needed to change the joints of the rack and pinion or play with friction

