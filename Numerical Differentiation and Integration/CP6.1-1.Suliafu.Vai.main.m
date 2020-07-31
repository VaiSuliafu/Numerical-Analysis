% Euler's Method for Solving Initial Value Problems
% Input: function f, actual solution f_a, interval inter, initial value y0, number of steps n
% Output: time steps t, solution y
% Example usage: euler1([0 1], 1, 10)
function [t,y,z] = euler(f, f_a, inter, y0, n)
  t(1) = inter(1);
  y(1) = y0;
  h = (inter(2) - inter(1))/n;
  z(1) = f_a(t(1));
  for i = 1:n
    t(i+1) = t(i) + h;
    x = [t(i), y(i)]; % t=x(1), y=x(2)
    y(i+1) = eulerstep(f, x, h);
    z(i+1) = abs(y(i+1) - f_a(t(i+1))); % error calculation
  end
  %plot(t,y)
endfunction

function y = eulerstep(f, x, h)
  % one tep of Euler's Method
  % Input: function f, vector x where x(1) is current time t, x(2) is current value y, stepsize h
  % Output: approximate solution value at time t+h
  y = x(2) + (h * feval(f, x));
endfunction

fprintf("[T | W | ERROR]\n")

% Part A
f=@(x) x(1);
f_a=@(x) ((x^2)/2) + 1;
[t,y,z] = euler(f, f_a, [0 1], 1, 10);
PartA = [t ; y; z]'
fprintf("\n");

% Part B
f=@(x) (x(1)^2) * x(2);
f_a=@(x) e^((x(1)^3)/3);
[t,y,z] = euler(f, f_a, [0 1], 1, 10);
PartB = [t ; y; z]'
fprintf("\n");

% Part C
f=@(x) 2 * (x(1) + 1) * x(2);
f_a=@(x) e^((x(1)^2) + (2 * x(1)));
[t,y,z] = euler(f, f_a, [0 1], 1, 10);
PartC = [t ; y; z]'
fprintf("\n");

% Part D
f=@(x) 5 * (x(1)^4) * x(2);
f_a=@(x) e^(x(1)^5);
[t,y,z] = euler(f, f_a, [0 1], 1, 10);
PartD = [t ; y; z]'
fprintf("\n");

% Part E
f=@(x) 1 / x(2)^2;
f_a=@(x) ((3 * x(1)) + 1)^(1/3);
[t,y,z] = euler(f, f_a, [0 1], 1, 10);
PartE = [t ; y; z]'
fprintf("\n");

% Part F
f=@(x) (x(1)^3) / (x(2)^2);
f_a=@(x) (((3 * (x(1)^4)) + 4) / 4)^(1/3);
[t,y,z] = euler(f, f_a, [0 1], 1, 10);
PartF = [t ; y; z]'
fprintf("\n");