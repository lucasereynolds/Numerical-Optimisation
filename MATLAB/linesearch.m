function alpha = linesearch(f, df, x, s, theta)
% Backtracking Linesearch (Algorithm 4.1 in the lecture notes)

% INPUT:
%   f : function handle
%       target function to minimise (thanks to Armijo)
%   df : function handle
%       gradient of target function
%   x : array
%       vector of the current iterate
%   s : array
%       descent direction
%   theta : scalar
%       added parameter in (0,1), typically very small ~10^-3

% OUTPUT:
%   alpha : scalar
%       distance to travel in descent direction

    % Set initial guess
    alpha = 1;

    for i = 1:30
        % We stop if the Armijo condition is satisfied
        if f(x + alpha*s) >= f(x) + theta*alpha*dot(df(x), s)
            break;
        end
        alpha = alpha/2;
    end
end

