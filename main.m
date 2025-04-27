clear all;
close all;
% In this code the global frame would be called R0,while 
% the anatomical frame I built would be called R1

%%
load StaticPhase.mat
% use Ac to compute an Anatomical frame for the Thorax
AcLeft = StaticPhase.AcLeft;
AcRight = StaticPhase.AcRight;
ZGravity1 = StaticPhase.ZGravity1;
ZGravity2 = StaticPhase.ZGravity2;

%% Question 1: establish the anatomical frame for thorax in static phase. 
[origin, x_axis, y_axis, z_axis] = frame4AC(AcLeft, AcRight,ZGravity1,ZGravity2);
plotAnatomicalThorax(x_axis, y_axis, z_axis, origin, AcLeft, AcRight,ZGravity1,ZGravity2)

%% Question 2: Computing the mouvement of the head in the Anatomical Frame of the Thorax
load DynamicPhase.mat
%% points needed in dynamic phase

TP1 = DynamicPhase.TripodThoraxPt1;
TP2 = DynamicPhase.TripodThoraxPt2;
TP3 = DynamicPhase.TripodThoraxPt3;
TH1 = DynamicPhase.TripodHeadPt1;
TH2 = DynamicPhase.TripodHeadPt2;
TH3 = DynamicPhase.TripodHeadPt3;
TH4 = DynamicPhase.TripodHeadPt4;

%%
% calculate the rotation angle and rotation matrix
[angle_z, angle_x, angle_y, R_z, R_x, R_y, R] = calculate_rotation_angles(x_axis, y_axis, z_axis);
% computing the head coodinate after rotation
% the head movement will be shown at R1
[headAfterRotation] = Computingthehead(R,TH1,TH2,TH3,TH4);
%% Assuming headAfterRotation.O_rotated is a 407x3 matrix
% where each row represents the coordinates of a point at a time step
% Extract the coodinate of head before and after the rotation
visualizePointsOverTime(headAfterRotation.O_rotated);
%% Movement, velocity and angle
visualizeMotionAndVelocity(headAfterRotation.O_rotated);
calculateTheAngle(origin,headAfterRotation.O_rotated);