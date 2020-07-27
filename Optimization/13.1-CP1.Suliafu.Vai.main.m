function y = gss(f,a,b,k)
  g = (sqrt(5)-1)/2;
  x1 = a+(1-g)*(b-a);
  x2 = a+g*(b-a);
  f1 = f(x1); f2 = f(x2);
  for i=1:k
    if f1 < f2 % if f(x1) < f(x2), replace b with x2
      b=x2; x2=x1; x1=a+(1-g)*(b-a);
      f2=f1; f1=f(x1); % single function evalutation
    else               % otherwise, replace a with x1
      a=x1; x1=x2; x2=a+g*(b-a);
      f1=f2; f2=f(x2); % single function evaluation     
    endif
  endfor
  y=(a+b)/2;
endfunction

%Part A
f=@(x) (2 * (x.^4)) + (3 * (x.^2)) - (4 * x) + 5;
x = linspace(-2, 2, 1000);
%plot(x, f(x));
fprintf("Function A is unimodal on [0, 1]\n")
Part_A_Minimum = gss(f, 0, 1, 10)
fprintf("\n")

%Part B
f=@(x) (3 * (x.^4)) + (4 * (x.^3)) - (12 * (x.^2)) + 5;
x = linspace(-3, 3, 1000);
%plot(x, f(x));
fprintf("Function B is unimodal on [-2.5, -1.5]\n")
Part_B_LeftMinimum = gss(f, -2.5, -1.5, 10)
fprintf("\n")
fprintf("Function B is unimodal on [0.5, 1.5]\n")
Part_B_RightMinimum = gss(f, 0.5, 1.5, 10)
fprintf("\n")

%Part C
f=@(x) (x.^6) + (3 * (x.^4)) - (2 * (x.^3)) + (x.^2) - x - 7;
x = linspace(-3, 3, 1000);
%plot(x, f(x));
fprintf("Function C is unimodal on [0, 1]\n")
Part_C_Minimum = gss(f, 0, 1, 10)
fprintf("\n")

%Part D
f=@(x) (x.^6) + (3 * (x.^4)) - (12 * (x.^3)) + (x.^2) - x - 7;
x = linspace(-3, 3, 1000);
%plot(x, f(x));
fprintf("Function D is unimodal on [1, 2]\n")
Part_D_Minimum = gss(f, 1, 2, 10)
fprintf("\n")