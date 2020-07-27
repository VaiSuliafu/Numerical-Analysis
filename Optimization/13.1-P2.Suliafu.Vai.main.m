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
f=@(x) cos(x);
Part_A_Minimum = gss(f, 3, 4, 10)
%% Part_A_Minimum =  3.1418

%Part B
f=@(x) (2 * (x^3)) + (3 * (x^2)) - (12 * x) + 3;
Part_B_Minimum = gss(f, 0, 2, 10)
%% Part_B_Minimum =  0.99498

%Part C
f=@(x) (x^3) + (6 * (x^2)) + 5;
Part_C_Minimum = gss(f, -5, 5, 10)
%% Part_C_Minimum = -0.025125

%Part D
f=@(x) (2 * x) + (e^(-x));
Part_D_Minimum = gss(f, -5, 5, 10)
%% Part_D_Minimum = -0.71396