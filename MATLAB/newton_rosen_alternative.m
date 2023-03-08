% Script to apply Newton's method to the Rosenbrock function for several
% initial guesses

clear all

% Use function handles/ inline to define f, its gradient and Hessian
f   = @(x) (1-x(1))^2 + 100 * (x(2) -x(1)^2)^2;
df  = @(x) [2*(x(1)-1) + 400*x(1)*(x(1)^2 - x(2)); 200*(x(2) - x(1)^2)]; % gradient of f is a column vector
d2f = @(x) [2-400*x(2)+1200*x(1)^2, -400*x(1); -400*x(1), 200];           % Hessian of f is a matrix

% Initial guess
x0  = [-2;2];
% x0  = [1.2;1.2];
% x0  = [-1.2;1];

% Necessary inputs
tol = 1.0e-2;
maxit = 100;

% exact solution computed analytically
xex = [1;1];

x = newton(f,df,d2f,x0,tol,maxit);

disp(x)

% Check accuracy of the solution
norm(x-xex)
