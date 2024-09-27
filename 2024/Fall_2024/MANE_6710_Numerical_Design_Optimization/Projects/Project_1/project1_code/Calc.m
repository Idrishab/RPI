
Nx = 100; % number of cells along x-driection
Ny = 100; % number of cells along y-direction
L = 0.05; % Heat exchanger width 
kappa = 20; % steel thermal conductivity
Ttop = 293.15; % air temp in Kelvin (20 degC)
Tbot = 363.15; % water temp in Kelvin (90 degC)
a = [4;3;2;1;2;3;4];
% n ?
% L ?
% Nx ?


[h, x] = Calch(a, L, Nx);
[flux,T,dTdx,xy] = CalcFlux(L, h, Nx, Ny, kappa, Ttop, Tbot);
disp('flux');
disp(flux);

plot(x,h)

% disp('h');
% disp(h)

function [h, x] = Calch(a, L, Nx)
    dx = L/Nx;
    n = length(a); % length of a
    if n < 2
        error('Array a must have at least 2 elements');
    end
    % Array of x and h values, initialized to 0's
    x = zeros(Nx+1,1);
    h = zeros(Nx+1,1);
    
    for i = 1:Nx+1
        
        x(i) = (i-1)*dx; % Allocating values to the x array elements
        h(i) = a(1); % Initializing h to a1
        for k = 2:n
            % Adding the summation part of h(x) eqn from k=2 to k=n
            h(i) = h(i) + a(k)*sin((2*pi*(k-1)*x(i))/L);
           
        end
    end
    
    
end 

