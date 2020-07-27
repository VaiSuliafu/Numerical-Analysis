% Main script to answer 1.1-CP2

function xc=bisect(f,xa,xb,tol)
  if f(xa) * f(xb) < 0
  else
    fprintf('The guess is incorrect! Enter new guesses\n');
    %xa=input('Enter the starting value of the interval:\n');
    %xb=input('Enter the end value of the interval:\n');
  endif
    
  for i=2:1000
    xc=(xb+xa)/2;
    if f(xb) * f(xc)<0
      xa=xc;
    else
      xb=xc;
    end
      
    if f(xa)*f(xc)<0
      xb=xc;
    else
      xa=xc;
    endif
    
    xnew(1)=0;
    xnew(i)=xc;
    
    if abs((xnew(i)-xnew(i-1))/xnew(i))<tol
      break
    endif
      
    endfor
endfunction


% Part A
f=@(x) x^5+x-1;
xa=0;
xb=1;
tol = 0.00000005;
Part_A_Root = bisect(f,xa,xb,tol)

%Part B
f=@(x) sin(x)-(6*x) - 5;
xa=-1;
xb=0;
tol = 0.00000005;
Part_B_Root = bisect(f,xa,xb,tol)

%Part C
f=@(x) log(x)+(x^2)-3;
xa=1;
xb=2;
tol=0.00000005;
Part_C_Root = bisect(f,xa,xb,tol)