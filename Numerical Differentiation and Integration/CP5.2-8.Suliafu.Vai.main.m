% Program to run Simpson's Composite Rule for Numerical Integration
% Inputs: f is the integrand to evaluate
%         a is the lower limit for integration
%         b is the upper limit for integration
%         m is the number of panels or sub-intervals
% Output: s the resulting sum from Simpson's Composite Rule
function s=simps(f,a,b,m)
  h = (b-a) / (2*m);
  s1 = 0;
  s2 = 0;
  for k=1:m
    x = a + (h * (2*k-1)); % the odd indice panels
    s1 = s1+ feval(f,x);
  end
  for k=1:(m-1)
    x = a + (h * (2*k)); % the even indice panels
    s2 = s2 + feval(f,x);
  end
  s = h * (feval(f,a) + feval(f, b) + (4 * s1) + (2 * s2)) / 3;
endfunction

% PartA
f=@(x) sqrt(1 + (3 * x^2)^2);
PartA = simps(f, 0, 1, 32)

% PartB
f=@(x) sqrt(1 + (tan(x)^2 + 1)^2);
PartB = simps(f, 0, pi/4, 32)

% PartC
f=@(x) sqrt(1 + (1 / (x^2 + 1))^2);
PartC = simps(f, 0, 1, 32)


