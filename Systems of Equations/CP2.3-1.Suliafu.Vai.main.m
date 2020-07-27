%LU factorization
function [L,U] = LU_factor(a)
  [n,n] = size(a);
  L = zeros(n,n);
  U = zeros(n,n);
  for i=1:n
    if abs(a(i,i)) <0;
      error('zero pivot encountered');
      break
    endif

    for k=1:i-1
      L(i,k) = a(i,k);
      for j=1:k-1
        L(i,k)=L(i,k) - L(i,j)*U(j,k);
      endfor
      L(i,k) = L(i,k)/U(k,k);
    endfor
    
    for k=1:n
      U(i,k) = a(i,k);
      for j=1:i-1
        U(i,k)=U(i,k)-L(i,j)*U(j,k);
      endfor
    endfor
    
    L(i,i)=1;
  endfor
endfunction

%Gaussian Elimination
function x = gauss_elim(a, b)
  [n,n] = size(a);
  for j = 1:n-1
    for i = j+1:n
      mult = a(i,j)/a(j,j);
      for k = j+1:n
        a(i,k) = a(i,k) - mult*a(j,k); %row manipulation
      end
      b(i) = b(i) - mult*b(j); %target manipulation
    end
  end
  
  %back substitution
  for i = n:-1:1
    for j = i+1:n
      b(i) = b(i) - a(i,j)*x(j);
    end
    x(i)=b(i)/a(i,i);
  end
endfunction

% Calculates the Forward Error
function fe = forwardError(X_a, X_c)
  fe = X_a - X_c; % difference between actual solution and computed
  fe = max(abs(fe));
endfunction

% Calculates the Relative Forward Error
function rfe = relativeForwardError(X_a, X_c)
  fe = forwardError(X_a, X_c);
  rfe = fe / max(abs(X_a));
endfunction

% Calculates the Relative Backward Error
function rbe = relativeBackwardError(b, a, X_c)
  % computing residual
  r = b.' - X_c*a;
  rbe = max(abs(r)) / max(abs(b));
endfunction

% Calculates the Error Magnification Factor
function emf = errorMagnificationFactor(b, a, X_a, X_c)
  rfe = relativeForwardError(X_a, X_c);
  rbe = relativeBackwardError(b, a, X_c);
  emf = rfe / rbe;
endfunction

% Calculates the infinity norm of the input matrix 'a'
function infNorm = infinityNorm(a)
  [n,n] = size(a);
  infNorm = 0;
  for i=1:n
    rowSum = 0;
    for j=1:n
      rowSum = rowSum + abs(a(i,j));
    endfor
    if rowSum > infNorm
      infNorm = rowSum;
    endif
  endfor
endfunction

% Calculates the Condition Number of the input matrix 'a'
function cn = conditionNumber(a)
  cn = infinityNorm(a) * infinityNorm(inv(a));
endfunction

% main function which compiles the various functions to solve the problem
function [fe, emf, cn] = solve(n)
  
  % Setting up the problem parameters
  b = zeros([n, 1]);
  c = zeros([n, 1]);
  for i = 1:n
    for j = 1:n
      X_a(j) = 1;
      a(i,j) = 5/(i + 2*j - 1);
      c(i) = c(i) + a(i,j)* X_a(j);
      b(i) = c(i);
    end
  end
  
  % LU factorization to derive the computed solution X_c
  [L,U] = LU_factor(a);
  X = gauss_elim(L, b); % Step A of back substitution
  X_c = gauss_elim(U, X); % Step B of back substitution
  
  % Computing forward error
  fe = forwardError(X_a, X_c);
  
  % Computing Error Magnification Factor
  emf = errorMagnificationFactor(b, a, X_a, X_c);
  
  % Computing the Condition Number
  cn = conditionNumber(a);

endfunction

% solving the HW assignments
[fe_PartA, emf_PartA, cn_PartA] = solve(6)
fprintf("\n");
[fe_PartB, emf_PartB, cn_PartB] = solve(10)