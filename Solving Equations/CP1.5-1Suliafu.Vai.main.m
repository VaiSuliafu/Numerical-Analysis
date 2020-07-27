function c = secantmethod(f, x0, x1)
  while(abs(f(x1) - f(x0)) > 0.00001)
  x = x1 - (f(x1) * (x1 - x0))/(f(x1) - f(x0))
  x0 = x1;
  x1 = x;
  endwhile
c = x;
endfunction

x0= 1;
x1 = 2;

%Part A
f=@(x) (x^3) - (2*x) - 2;
Part_A_Root = secantmethod(f, x0, x1)

%Part B
f=@(x) (e^x) + x - 7;
Part_B_Root = secantmethod(f, x0, x1)

%Part C
f=@(x) (e^x) + sin(x) - 4;
Part_C_Root = secantmethod(f, x0, x1)
