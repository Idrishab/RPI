% Vector Creation (creating equally spaced vectors)


% Q: Create an evenly-spaced row vector A with elements 
% starting at 0 and ending at 50 ith increments of 0.5. 
A = 0:0.5:50;

% Create a row vector B with 80 evenly-spaced elements 
% starting at 0 and ending at pi/2.
B = linspace(0, pi/2, 80)

% Create a row vector C that is an unsigned 8-bit integer data type 
% with elements counting backward from 200 to 0 in increments of 5.
C = uint8(200:-5:0)
