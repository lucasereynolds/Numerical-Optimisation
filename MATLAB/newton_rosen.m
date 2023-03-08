% Script to apply Newton's method to the Rosenbrock function for several
% initial guesses

clear

% Initial guess
x0  = [-1.2;1];


% Algorithm Parameters
tol = 1.0e-8;
maxIt = 100;

% exact solution computed analytically
xex = [1;1];

x = newton(@f_Rosen, @g_Rosen, @h_Rosen, x0, tol, maxIt);

disp(x)

% Check accuracy of the solution
norm(x-xex)
