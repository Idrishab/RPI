% This is the script that performs the optimization and calls all the
% needed functions to maximize the objective.
%
% Inputs:
%   L - length of domain in x direction
%   a - amplitude of oscillation
%   a0 - initial guess for a
%   Nx - number of elements along the x direction
%   Ny - number of elements along the y direction
%   kappa - thermal conductivity
%   Ttop - the ambient air temperature along the top of the domain
%   Tbot - the fluid temperature along the bottom of the domain
%
% Outputs:
%   flux - the maximized objective flux
%   iter (iteration) results from fmincion optimization
%   plot of x against h, showing the shape of the heat exchanger 
%--------------------------------------------------------------------------

% Cleaning up the command window
% clc
% clear

Nx = 400; % number of cells along x-driection
Ny = 400; % number of cells along y-direction
L = 0.05; % Heat exchanger width, also length of the domain
kappa = 20; % steel thermal conductivity [W/mk]
Ttop = 293.15; % air temp in Kelvin (20 degC)
Tbot = 363.15; % water temp in Kelvin (90 degC)

% random initial guess for "a" which is scaled by 5mm
% a0 = 0.005*rand(9,1); a0(1) = 0.03;
a0 = [0.0300; -0.0003; 0.0; 0.0; 0.0; 0.0; 0.0; -0.0001; 0.0; 0.0203];

[~,x] = Geth(a0, L, Nx);

[Aineq, bineq] = DefConstraint(a0, L, Nx, x);

% anonymous function to calculate the objective
fun = @(a) maxim(L, a, Nx, Ny, kappa, Ttop, Tbot);

% Setting options to use the 'sqp' algorithm
options = optimoptions('fmincon', 'Algorithm', 'sqp', 'Display', 'iter');

[a_opt, fval] = fmincon(fun, a0, Aineq, bineq, [], [], [], [], [], options);

disp('flux');
heat_flux = 1/fval;
disp(heat_flux); % outputing the value maximized objective, flux

[h, x] = Geth(a_opt,L, Nx);
plot(x, h)
xlabel('x-locations')
ylabel('Heights (h)')
title(sprintf('Maximized heat flux = %.2f', heat_flux ));
grid on
% grid minor
saveas(gcf, 'heat_exchanger.png')