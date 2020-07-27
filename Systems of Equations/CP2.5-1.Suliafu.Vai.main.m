% Program 2.1 Sparse matrix setup
% Input: n = size of system
% Outputs: sparse matrix a, r.h.s. b
function [a,b] = sparsesetup(n)
  e = ones(n,1);
  a = spdiags([-e 3*e -e], -1:1,n,n); %Entries of a 
  b = zeros(n,1);      %Entires of r.h.s b
  b(1)=2; b(n)=2; b(2:n-1)=1;
endfunction

%Program 2.2 Jacob Method
%Inputs: full or sparse matrix a, r.h.s. b,
%        number of Jacobi iterations, k
%Output: solution x
function [m, be] = jacobi(a,b,tol)
  n = length(b);    % find n
  d = diag(a);      % extract diagonal of a
  r = a-diag(d);    % r is the remainder
  x = zeros(n,1);   % initialize vector x
  p = zeros(n,1);
  c = zeros([n,1]);
  e = zeros([n,1]);
  n1 = 0;
  err = 0;
  relerr = 1;
  while(1)    % loop for Jacobi iteration
    x = (b-r*x)./d;
    err = abs(norm(x-p));
    relerr = err / (norm(x)+eps);
    p = x;
    n1 = n1+1;
    if (err < tol)
      break
    endif
  endwhile
  
  xc = x;
  m = n1;
  
  % correct solution
  for i=1:n
    for j=1:n
      xa(j) = 1;
      c(i) = c(i) + a(i,j) * xa(j);
      e(i) = e(i) + a(i,j) * xc(j);
    endfor
  endfor
  
  % absolute values
  for i = 1:n
    dif(i) = abs(xa(i) - xc(i));
    dif2(i) = abs(e(i) - c(i));
  endfor
  
  % error calculations
  fe = max(dif, [], 2);
  be = max(dif2, [], 2);
endfunction

%Part A
[a,b] = sparsesetup(100);
[iters_PartA, backError_PartA] = jacobi(a,b,0.0000005)

fprintf("\n");

%Part B
[a,b] = sparsesetup(100000);
[iters_PartB, backError_PartB] = jacobi(a,b,0.0000005)