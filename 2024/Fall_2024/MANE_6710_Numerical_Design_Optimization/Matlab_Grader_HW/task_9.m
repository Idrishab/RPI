% Triangle Calculations (script with two anon functions)

% Define anonymous functions
ThirdSide = @(a, b, C) sqrt(a^2 + b^2 -(2 * a * b * cos(deg2rad(C))));
TriangleArea = @(a, b, C) 0.5 * a * b * sin(deg2rad(C));


%           OR
%function [SideC] = ThirdSide(a, b, C)
%    C_rad = deg2rad(C);
%    SideC = sqrt(a^2 + b^2 -(2*a*b*cos(C_rad)));
%end

%function [AreaABC] = TriangleArea(a,b, C)
%    C_rad = deg2rad(C);
%    AreaABC = 0.5*a*b*sin(C_rad);
%end

[SideC] = ThirdSide(5, 8, 50)
[AreaABC] = TriangleArea(5, 8, 50)