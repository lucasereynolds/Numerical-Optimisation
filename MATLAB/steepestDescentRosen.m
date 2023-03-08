% Script to apply Basic Steepest descent to the Rosenbrock function for 
% several initial guesses

clear

% Initial guess
x0  = [-1.2; 1];

% Algorithm Parameters
theta = 6.3*10^-1;
tol = 1.0e-4;
maxIt = 10000;

% exact solution computed analytically
xex = [1;1];

x = steepestDescent(@f_Rosen, @g_Rosen, x0, theta, tol, maxIt);

disp(x)

% Check accuracy of the solution
norm(x-xex)