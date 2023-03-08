function G = g_Rosen(x)

% The Gradient of the two-dimensional Rosenbrock function 

b = 100;

G(1) = 2*(x(1)-1) + 4*b*x(1)*(x(1)^2 - x(2));
G(2) = 2*b*(x(2)-x(1)^2);

% Make sure it is a column vector
G = G(:);

end

