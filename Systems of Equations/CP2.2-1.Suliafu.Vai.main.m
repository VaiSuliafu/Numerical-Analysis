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

[L_PartA, U_PartA] = LU_factor([3 1 2; 6 3 4; 3 1 5])

[L_PartB, U_PartB] = LU_factor([4 2 0; 4 4 2; 2 2 3])

[L_PartC, U_PartC] = LU_factor([1 -1 1 2; 0 2 1 0; 1 3 4 4; 0 2 1 -1])