% Matrix Manipulations (extracting elements for new matrices)

function [B, C, D] = matrixFun(A)
%Enter the commands for your function below. Be sure to assign values 
%to each of the output variables defined in the function command on line 1.

%Create a new  matrix, B, that consists of the first and last rows of A. 
B = A([1 end], :);

% Create a new  matrix, C, that consists of the 
% elements at the four corners of A.
C = A([1 end], [1 end]);

% Create a new  matrix, D, that consists of the second through 
% last columns in the second through last rows of A.
D = A(2:end, 2:end);

end

A = [1 1 2 3 5 8; 0 2 4 6 8 10; -1 -3 -5 -7 -9 -11;2 4 8 16 32 64;13 21 34 55 89 144]; 
[B, C, D] = matrixFun(A)