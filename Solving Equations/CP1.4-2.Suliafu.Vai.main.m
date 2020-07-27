function c = newtonsmethod(f, fp, x, tol)
  while(abs(f(x)) > tol)
  xn = x - (f(x)/fp(x));
  dx = abs(x - xn);
  x = xn;
  endwhile
c = x;
endfunction

%Part A
f=@(x) (x^5) + x - 1;
fp=@(x) (5 *(x^4)) + 1;
x0 = 2;
tol = 0.00000001;
Part_A_Root = newtonsmethod(f,fp,x0,tol)

%Part B
f=@(x) sin(x) - (6*x) - 5;
fp=@(x) cos(x) - 6;
x0 = 1;
tol = 0.00000001;
Part_B_Root = newtonsmethod(f,fp,x0,tol)

%Part C
f=@(x) log(x) + (x^2) - 3;
fp=@(x) (1/x) + (2*x);
x0=1;
tol = 0.00000001;
Part_C_Root = newtonsmethod(f,fp,x0,tol)