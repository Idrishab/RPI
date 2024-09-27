% Projectile Velocity (multistep calculation in script)

function[yPosition,ProjectileVelocity] = projectileMotion(xPosition)
%Enter commands to solve the problem and assign the results 
%to the output variables defined in the function command in line 1.  

x = xPosition;
y0 = 2.0;
theta = 35; % deg
v0 = 25.0; % m/s
g = 9.81; %m/s^2

vx = v0 * cos(deg2rad(theta)); % deg2rad() converts degree to radian
% or vx = v0 * cos(theta * pi/180)

y = x*tan(deg2rad(theta)) - (0.5*x^2*g)/(v0*cos(deg2rad(theta)))^2 + y0;

vy = sqrt((v0*sin(deg2rad(theta)))^2 - (2*g*y));

v = sqrt(vx^2 + vy^2);

yPosition = y;
ProjectileVelocity = v;

end

xPosition = 25;
[yPosition,ProjectileVelocity] = projectileMotion(xPosition)