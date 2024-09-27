
% This function generate two arrays for h and x. h is the height of the 
% heat exchanger geometry at each x location while x is the discrete
% locations within the domain. h is a function of x, and it is computed
% using a sinusoidal correlation.
%
% Inputs:
%   a - amplitude of oscillation
%   L - length of domain in x direction
%   Nx - number of elements along the x direction
%
% Outputs:
%   h - height as a function of x; note that size(h,1) must be Nx+1
%   x - discretized locations along the x direction
%--------------------------------------------------------------------------

function [h, x] = Geth(a, L, Nx)
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

