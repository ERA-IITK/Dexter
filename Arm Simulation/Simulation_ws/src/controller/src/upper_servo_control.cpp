#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include "bits/stdc++.h"

int main(int argc, char **argv)
{
	ros::init(argc,argv,"upper_servo_control");
	ros::NodeHandle n;
	ros::Publisher angle_pub=n.advertise<std_msgs::Float64>("/test/Rev14_position_controller/command",1000);
	ros::Rate loop_rate(10);

	int count=0;
	float x;
	std::cout<<"Enter position value\n";
	std::cin>>x;
	while(ros::ok())
	{
		std_msgs::Float64 msg;
		msg.data=x;

		ROS_INFO("Message data = %f, Message count = %d",msg.data,count);
		angle_pub.publish(msg);

		ros::spinOnce();
		loop_rate.sleep();
		++count;
	}
	return 0;
}