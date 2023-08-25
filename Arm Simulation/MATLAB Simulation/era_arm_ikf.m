function [theta1_1,theta2_1,theta1_2,theta2_2] = era_arm_ikf(a1,a2,px,py)

c2 = (px*px+ py*py -a1*a1-a2*a2)/(2*a1*a2);
if c2<=1
    s2_1 = sqrt(1-c2*c2);
    s2_2 = -sqrt(1-c2*c2);
    theta2_1 = atan2(s2_1,c2);
    theta2_2 = atan2(s2_2,c2);
    denom_1 = a1*a1+a2*a2+2*a1*a2*cos(theta2_1);
    denom_2 = a1*a1+a2*a2+2*a1*a2*cos(theta2_2);
    s1_1 = (py*(a1+a2*cos(theta2_1)) - px*a2*sin(theta2_1))/denom_1;
    s1_2 = (py*(a1+a2*cos(theta2_2)) - px*a2*sin(theta2_2))/denom_2;
    c1_1 = (px*(a1+a2*cos(theta2_1))+py*a2*sin(theta2_1))/denom_1;
    c1_2 = (px*(a1+a2*cos(theta2_2))+py*a2*sin(theta2_2))/denom_2;

    theta1_1 = atan2(s1_1,c1_1);
    theta1_2 = atan2(s1_2,c1_2);

%     ax_1 = a1*cos(theta1_1);
%     ay_1 = a1*sin(theta1_1);
%     ax_2 = a1*cos(theta1_2);
%     ay_2 = a1*sin(theta1_2);
% 
%     bx = px;
%     by = py;
% 
%     xAxisArrayXCoords = [-2 2];
%     xAxisArrayYCoords = [0 0];
% 
%     yAxisArrayXCoords = [0 0];
%     yAxisArrayYCoords = [-2 2];
% 
%     link1XCoords_1 = [0 ax_1];
%     link1YCoords_1 = [0 ay_1];
% 
%     link1XCoords_2 = [0 ax_2];
%     link1YCoords_2 = [0 ay_2];
% 
%     link2XCoords_1 = [ax_1 bx];
%     link2YCoords_1 = [ay_1 by];
% 
%     link2XCoords_2 = [ax_2 bx];
%     link2YCoords_2 = [ay_2 by];
% 
%     plot(xAxisArrayXCoords,xAxisArrayYCoords,'r',yAxisArrayXCoords,yAxisArrayYCoords,'g',link1XCoords_1,link1YCoords_1,'b',link2XCoords_1,link2YCoords_1,'c');
%     hold on;
%     plot(xAxisArrayXCoords,xAxisArrayYCoords,'r',yAxisArrayXCoords,yAxisArrayYCoords,'-.g',link1XCoords_2,link1YCoords_2,'-.b',link2XCoords_2,link2YCoords_2,'-.c');

 end
end