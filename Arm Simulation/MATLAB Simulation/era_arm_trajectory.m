clc, clear,clf;

a1 = .246; a2 =.250;
timeStart = 0;
timeEnd = 1;

n = 150;
pXArray = zeros(n,1);
pYArray = zeros(n,1);
aXArray = zeros(n,1);
aYArray = zeros(n,1);

theta1Array = zeros(n,1); theta2Array = zeros(n,1);
timeArray = linspace(timeStart,timeEnd);

p1 = [.246;.250]; %Home pos of arm
p2 = [0.45;0.1]; %Some arbitrary pose within workspace

deltaP = p2 - p1;
tArray = linspace(0,1,n);

for i=1:n
    t = tArray(i);
    p = p1+t*deltaP;
    pXArray(i) = p(1);
    pYArray(i) = p(2);
end

[theta1_1,theta2_1,theta1_2,theta2_2] = era_arm_ikf(a1,a2,pXArray(1),pYArray(1));

theta1Prev = theta1_1; theta2Prev = theta2_1;

for i=1:n
    px = pXArray(i);
    py = pYArray(i);
    [theta1_1,theta2_1,theta1_2,theta2_2] = era_arm_ikf(a1,a2,px,py);
    if(((theta1_1-theta1Prev)^2-(theta2_1-theta2Prev)^2)<((theta1_2-theta1Prev)^2-(theta2_2-theta2Prev)^2))
        theta1 = theta1_1; theta2 = theta2_1;
    else
        theta1 = theta1_2; theta2 = theta2_2;
    end
    aXArray(i) = a1*cos(theta1); aYArray(i) = a1*sin(theta1);
    theta1Array(i) = theta1; theta2Array(i) = theta2;
end
xAxisArrayXCoords = [-0.5 0.5];
xAxisArrayYCoords = [0 0];

yAxisArrayXCoords = [0 0];
yAxisArrayYCoords = [-0.5 0.5];

for i=1:n
    ax = aXArray(i); ay = aYArray(i);
    bx = pXArray(i); by = pYArray(i);
    traceXArray(i) = bx ; traceYArray(i) = by;
    link1XCoords = [0,ax]; link1YCoords = [0,ay];
    link2XCoords = [ax,bx]; link2YCoords = [ay,by];

    plot(xAxisArrayXCoords,xAxisArrayYCoords,'r',yAxisArrayXCoords,yAxisArrayYCoords,'g');
    axis equal
    hold on;
    plot(link1XCoords,link1YCoords,'b',link2XCoords,link2YCoords,'c','LineWidth',5);
    hold on;
    plot(traceXArray,traceYArray,'k','LineWidth',2);
    hold off;
    pause(0.05);
end



