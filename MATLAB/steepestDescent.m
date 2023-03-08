function xn = steepestDescent(f, df, xold, theta, tol, maxIt)
% Basic Steepest Descent (Algorithm 4.2 in the lecture notes)

% INPUT:
%   f : function handle
%       target function to optimise
%   df : function handle
%       gradient of target function
%   xold : array
%       initial guess
%   theta : scalar
%       added parameter in (0,1), typically very small ~10^-3
%   tol : scalar
%       stoppng tolerance
%   maxIt : integer
%       maximum number of iterations

% OUTPUT:
%   xn : vector
%       minimum point of target function

    % Set initial guess
    xn = xold;

    for n = 1:maxIt
        s = -df(xn);  % set descent direction
        alpha = linesearch(f, df, xn, s, theta);
        sprintf('Step length used in iteration %d: %d', n, alpha)
        xn = xn + alpha*s;  % Perform update

        % For the stopping criterion, evaluate the residual norm of the 
        % gradient and the step length and stop when both are below the 
        % requested tolerance
        %e = [norm(df(xn)), norm(xn-xold)];
        
        if norm(df(xn)) < tol
            break
        end

    end

    sprintf('Found a local minimum. Number of iterations: %d', n)

end

