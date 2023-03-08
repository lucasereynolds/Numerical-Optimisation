% Performs fixpoint iteration and Newton's method on the problem
% f(x) = x-exp(-x) with x_0 = 1

clear
format short 
tol = 1e-6;
exact = 5.671432904097838e-01;

%% Fixed-point iteration
clear x
x(1) = 1;
k = 1;

while abs( x(k)-exp(-x(k)) )>tol
    x(k+1) = exp(-x(k));
    k = k + 1;
end

% table of errors
x = x'; % "table" expects vectors in column format
error = abs(x-exact);
linear_convergence_factor = [0; error(2:end)./error(1:end-1)];

iteration = [1:k]';
table(iteration, x, error, linear_convergence_factor)

%% Newton's method
clear x
x(1) = 1; 
k = 1;

while abs(x(k)-exp(-x(k)))>tol
    x(k+1) = x(k) - (x(k) - exp(-x(k)))/(1+exp(-x(k)));
    k = k + 1;
end                

% table of errors
x = x'; % "table" expects vectors in column format
error = abs(x-exact);
quadratic_convergence_factor = [0; error(2:end)./error(1:end-1).^2]; 

iteration = [1:k]';
table(iteration, x, error, quadratic_convergence_factor)
