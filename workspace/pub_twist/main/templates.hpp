/* 
 * This file was automatically generated by generate_templates.py 
 * as one of mros2 features. You do not need to modify this. 
 */
#include "geometry_msgs/msg/twist.hpp"


template mros2::Publisher mros2::Node::create_publisher<geometry_msgs::msg::Twist>(std::string topic_name, int qos);
template void mros2::Publisher::publish(geometry_msgs::msg::Twist &msg);

