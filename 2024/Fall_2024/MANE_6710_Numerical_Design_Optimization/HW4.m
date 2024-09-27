% Question: Use forward difference approximation with a step size of h
% to approximate df/dx1 at x = [1; -1], where
% f(x) = exp(x1) + exp(-x1) + 0.25(x1 + x2)^4 - 2(x1 + x2)^2
% I entered "format long" in the command window to get more significant
% digits

f = @(x) exp(x(1)) + exp(-x(1)) + (0.25*(x(1) + x(2))^4) -(2*(x(1) + x(2))^2);
dfdx1 = @(x) exp(x(1)) - exp(x(1)) + (x(1) + x(2))^3 - (4*(x(1)) + x(2));

x = [1; -1];

% h = 1e-3 for x1 or x(1) only (i.e. x2 or x(2) = 0.0)
disp('Question 1')
dfdx1_FD_Q1 = (f(x + [1e-3; 0.0]) - f(x))/1e-3;
disp(dfdx1_FD_Q1)

% h = 1e-7 for x1 or x(1) only (i.e. x2 or x(2) = 0.0)
disp('Question 2')
dfdx1_FD_Q2 = (f(x + [1e-7; 0.0]) - f(x))/1e-7;
disp(dfdx1_FD_Q2)

% h = 1e-16 for x1 or x(1) only (i.e. x2 or x(2) = 0.0)
disp('Question 3')
dfdx1_FD_Q3 = (f(x + [1e-16; 0.0]) - f(x))/1e-16;
disp(dfdx1_FD_Q3)

% Using complex-step method
% h = 1e-30 for x1 or x(1) only (i.e. x2 or x(2) = 0.0)
xc = x;
xc(1) = xc(1) + complex(0.0, 1e-30); % Adding complex term to x1
dfdx_complex = imag(f(xc))/1e-30;

disp('Question 4')
% dfdx1_FD_Q4 = (f(x + [1e-30; 0.0]) - f(x))/1e-30;
disp(dfdx_complex)