clc;
clear;

% Parameters
A1 = 120; % in degrees
A2 =120; % in degrees
b1 = 200; % in meters
b2 =180 ; % in meters
c1 = 120; % in meters

a = sqrt((b1^2 + c1^2)-(2 * b1 * c1 * cosd(A2))); % cosd() is in degrees


% Applying the sine law to get angle C2:
% a/sin(A2) = b2/sin(B2) = c2/sin(C2)

B2sin = (180*sind(100))/280;
B2 = asind(B2sin); % in degrees

C2 = 180 - B2 - A2; % Sum of angles in a triangle equals to 180 (in degrees)

c2 = sqrt((b2^2 + a^2)-(2 * b2 * a * cosd(C2))); % in meters
disp(['the value for c2 =', num2str(c2)]) 