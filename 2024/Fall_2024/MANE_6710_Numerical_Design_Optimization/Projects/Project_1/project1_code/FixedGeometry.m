% This script generates a plot that represents the fixed geometry for the
% mesh convergence study
%
% Inputs:
%   a - amplitude of oscillation
%   L - length of domain in x direction 
%   Nx - number of elements along the x direction
%   
%
% Outputs:
%   fixed_geometry.png 
%--------------------------------------------------------------------------

a = [0.0300; -0.0003; 0.0; 0.0; 0.0; 0.0; 0.0; -0.0001; 0.0; 0.0203];
Nx = 400; % number of cells along x-driection
L = 0.05; % Heat exchanger width, also length of the domain
[h, x] = Geth(a, L, Nx);

plot(x, h)
title('Fixed geometery'); % Title of the plot
xlabel('x-locations');  % Label for the x-axis
ylabel('Heights (h)');  % Label for the y-axis
grid on
saveas(gcf, 'fixed_geometry.png')