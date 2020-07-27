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
