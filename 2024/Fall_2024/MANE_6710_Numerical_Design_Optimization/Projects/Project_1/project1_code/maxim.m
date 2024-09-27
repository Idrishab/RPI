% This function calculates the objective (flux) from the CalcFlux function
%
% Inputs:
%   L - length of domain in x direction
%   a - amplitude of oscillation
%   Nx - number of elements along the x direction
%   Ny - number of elements along the y direction
%   kappa - thermal conductivity
%   Ttop - the ambient air temperature along the top of the domain
%   Tbot - the fluid temperature along the bottom of the domain
%
% Outputs:
%   obj - the objective which in this case is to maximize flux and is
%   defined as the inverse of flux.
%--------------------------------------------------------------------------
function [obj] = maxim(L, a, Nx, Ny, kappa, Ttop, Tbot)
    [h,~] = Geth(a, L, Nx);
    flux = CalcFlux(L, h, Nx, Ny, kappa, Ttop, Tbot);
    obj = 1/flux;
    % obj = -1*flux;
end