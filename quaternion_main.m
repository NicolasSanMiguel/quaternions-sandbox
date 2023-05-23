% Nicolas San Miguel
% April 2023
clc; clear; close all;

% % Exploring creating and manipulating quaterions using MATLAB

%% Generating Quaternions
% % % % % % % % % % % % Simple Constructions
quat1 = quaternion() % empty

% using 
A = 1.2; B = 1.6; C = 7; D = 2.3;
quat2 = quaternion(A,B,C,D)

% quaternion is its own data type, but it has an underlying class
classUnderlying(quat1)
classUnderlying(quat2)

% create a quaternion array by using arrays and matrices as inputs
A = [1.6 4];
B = [2.7 2];
C = [3.8 2];
D = [4.9 4];
quat3 = quaternion(A,B,C,D)
classUnderlying(quat3)


% similarly, generating a quat with an array
quat_coeff = rand(5,4)
quat = quaternion(quat_coeff) % makes 5 quaternions

% compact() retrieves the coefficients
quat_coeff_again = compact(quat)

% the following two lines are equivalent
quat2_coeff_again = compact(quat(2,:))
quat2_coeff_again = compact(quat(2))

% % % % % % % % % % % % Constructing from Rotation Matrices
% here a rotation vector consists of three values representing the axis of
% the rotation in 3D, and the magnitude represents the mag of the rotation

% rotation vector -> scalar quaterntion
rotationVector = [0.3491,0.6283,0.3491];
quat4 = quaternion(rotationVector,'rotvec') % this is unit length
norm(quat4)
% scalar quaterntion -> rotation vector
rotvec(quat4)

% there is a degrees equivalent for these with rotvecd()

% % % now using a rotation matrix
% rotation vector -> rotation matrix
rotvec2mat3d(pi/3*[1 0 0])
rotvec2mat3d(pi/3*[0 1 0])
rotvec2mat3d(pi/3*[0 0 1])

rotationMatrix = [1          0            0; ...
                  0     sqrt(3)/2        0.5; ...
                  0        -0.5      sqrt(3)/2];
quat = quaternion(rotationMatrix,'rotmat','frame')

% % % % % % % % % % % % Constructing from Euler Angles
% E = [pi/2,0,pi/4];
% quat = quaternion(E,'euler','ZYX','frame')
% euler(quat,'ZYX','frame')
% 
% E = [90,0,45];
% quat = quaternion(E,'eulerd','ZYX','frame')
% eulerd(quat,'ZYX','frame')


%% Quaternion Algebra
q1 = quaternion(1,2,3,4)
q2 = quaternion(5,6,7,8)

q1plusq2 = q1 + q2
q2plusq1 = q2 + q1
% ^^ order doesnt matter

q1minusq2 = q1 - q2
q2minusq1 = q2 - q1
% ^^ order does matter

Q1plusRealNumber = Q1 + 5
% ^^ adds to scalar

disp('multiplication')
q1timesq2 = q1 * q2
q2timesq1 = q2 * q1
% ^^ order does matter
% can be multiplied by a scalar either way though



% % Conjugate of the quaternion
conj(q1)
q1*conj(q1)
conj(q1)*q1
% ^^ these are the same







