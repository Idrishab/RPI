% Projectile trajectory (plot of multiple data series)

y1 = trajectory(30, 25, 3.5);
x1 = colVector(30, 25, 3.5);

y2 = trajectory(45, 25, 3.5);
x2 = colVector(45, 25, 3.5);

y3 = trajectory(60, 25, 3.5);
x3 = colVector(60, 25, 3.5);

% disp('y1:');
% disp(y1);
% disp('y2:');
% disp(y2);
% disp('y3:');
% disp(y3);

plot(x1, y1)
hold on
plot(x2, y2)
hold on
plot(x3, y3)
hold off

title('Projectile trajectory (plot of multiple data series)')
xlabel("Range")
ylabel('Trajectory')
legend('y1', 'y2', 'y3')
grid("on")


% Define functions

function d = range(theta, v0, y0)
    t = deg2rad(theta);
    g = 9.81;
    d = (v0*cos(t)/g) * (v0*sin(t) + sqrt((v0*sin(t))^2 + 2*g*y0));
end

function x = colVector(theta, v0, y0)
    d = range(theta, v0, y0);
    x = linspace(0, d, 200)';
end

function y = trajectory(theta, v0, y0)
    g = 9.81;
    t = deg2rad(theta);
    x = colVector(theta, v0, y0);
    y = zeros(length(x), 1);
    for i = 1:length(x)
        y(i) = (x(i) * tan(t) ) - (0.5*x(i)^2 *g/(v0*cos(t))^2) + y0;
    end
end



