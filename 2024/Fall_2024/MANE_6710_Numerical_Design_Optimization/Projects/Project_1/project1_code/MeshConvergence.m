% This script generates the mesh convergence plot and save in a .png file.
% It is predominantly hardcoded.
%
% Inputs:
%   a - amplitude of oscillation
%   L - length of domain in x direction 
%   Nx - number of elements along the x direction
%   Ny - number of elements along the y direction
%   kappa - thermal conductivity
%   Ttop - the ambient air temperature along the top of the domain
%   Tbot - the fluid temperature along the bottom of the domain
%
%
% Outputs:
%   mesh_convergence.png 
%--------------------------------------------------------------------------

a = [0.0300; -0.0003; 0.0; 0.0; 0.0; 0.0; 0.0; -0.0001; 0.0; 0.0203];
Nx = 550; % number of cells along x-driection
Ny = Nx; % number of cells along y-direction
L = 0.05; % Heat exchanger width, also length of the domain
kappa = 20; % steel thermal conductivity
Ttop = 293.15; % air temp in Kelvin (20 degC)
Tbot = 363.15; % water temp in Kelvin (90 degC)

[h, ~] = Geth(a, L, Nx);
[flux,~,~,~] = CalcFlux(L, h, Nx, Ny, kappa, Ttop, Tbot);

% disp('Heat flux')
% disp(flux)
flux_array = [];
Nx_array = [];
i = 1;

for Nx = 50:50:1000
    Ny = Nx;
    [h, ~] = Geth(a, L, Nx);
    [flux,~,~,~] = CalcFlux(L, h, Nx, Ny, kappa, Ttop, Tbot);
    flux_array(i) = flux;
    Nx_array(i) = Nx;
    i = i+1;
end

plot(Nx_array, flux_array)
title('Mesh convergence study'); % Title of the plot
xlabel('Number of Cells (Nx=Ny)');  % Label for the x-axis
ylabel('Heat Flux [W/m]');  % Label for the y-axis
grid on
saveas(gcf, 'mesh_convergence.png')

% Nx = [50; 100; 150; 200; 250; 300; 350; 400; 450; 500; 550;	600; 650; 700; 750; 800; 850; 900; 950; 1000];
% flux_array = [
%     24094.6532762159;
%     27372.6983236232;
%     28267.7017903410;
%     28661.4203245170;
%     28878.7452636220;
%     29015.3917872036;
%     29108.8577666152;
%     29176.6585176318;
%     29228.0124876074;
%     29268.2251321233;
%     29300.5426297365;
%     29327.0717750320;
%     29349.2331602698;
%     29368.0188909905;
%     29384.1428182620;
%     29398.1314918993;
%     29410.3813663835;
%     29421.1969079573;
%     29430.8151375699;
%     29439.4242557815];