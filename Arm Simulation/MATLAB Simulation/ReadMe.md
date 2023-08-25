### **Files for simulating a basic 2D arm in MATLAB Simulation**
##### Files given here will allow you to run a 2D simulation of an arm in a MATLAB simulation. You can change the initial and end position of the **end-effector** and the simulation will generate angles for the trajectory.
##### You can change the lengths of links as per your requirements. This allows for determining the workspace of the arm.

### **Files Breakdown:**
#### era_arm_ikf.m:
##### This file contains a function that takes in the initial and end position of the end-effector and outputs **angles** for different affectors in radians.

#### era_arm_trajectory.m:
##### This file contains the driver code where you can modify the link lengths, simulation speed, and starting and ending points for the end-effector and plots a **live graph** to showcase the link's movements.
