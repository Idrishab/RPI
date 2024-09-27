% Quadratic Formula (formula with variables, function)

function [RootFromPlus,RootFromMinus] = quadraticSolver(a, b, c)
%Enter commands in the space below to evaluate the expression and assign the results 
%to the output variables defined in the function command in line 1.  \

RootFromPlus = (-b + sqrt(b^2 - 4*a*c))/(2*a);
RootFromMinus = (-b - sqrt(b^2 - 4*a*c))/(2*a);

end 

a = 1;b=-5;c=6;
[RootFromPlus,RootFromMinus] = quadraticSolver(a, b, c)