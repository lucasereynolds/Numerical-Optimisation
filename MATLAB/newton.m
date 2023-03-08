function xn = newton(f, df, d2f, xold, tol, maxIt)
% Newton's method (algorithm 3.1 in the lecture notes)

% Inputs:
%
%   function f, gradient df, Hessian d2f (function handles)
%   intitial guess xold (array)
%   tolerance for stopping criterion tol (scalar)
%   maximum number of iterations maxit (scalar)

% Output:
%   approximate solution xn

% Set initial guess

xn = xold;

% Iterate up to a maximum of maxIt iterations (safety-net)
for i = 1:maxIt
    
    % Evaluate the Hessian and the Gradient at the current point x
    
    H = d2f(xn);
    F = df(xn);
    
    % Calculate the next iterate via Newton's Method
    
    xn = xn - H\F;
    
    % For the stopping criterion, evaluate the residual and the step length
    % and stop when both are below the requested tolerance
    
    e = [f(xn), norm(xn-xold)];
    
    if max(e) < tol
        break
    end
    
    xold = xn;
    
end

% Check that the critical point that was found is indeed a local minimum

if min(eig(H)) > 0
    sprintf('Found a local minimum. Number of iterations: %d',i)
else
    disp('Newton ended up in a critical point that is not a local minimum')
end

end
