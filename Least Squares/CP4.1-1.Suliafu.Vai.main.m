function [x, error] = LS(A, b)
  AT_A = transpose(A) * A;
  AT_b = transpose(A) * b;
  x = inv(AT_A) * AT_b;
  preds = A * x;
  residuals = b - preds;
  error = norm(residuals,2);
endfunction

%Part A
A = [3,-1,2; 4,1,0; -3,2,1; 1,1,5; -2,0,3];
b = [10; 10; -5; 15; 0];
[solX_PartA, resid_norm_PartA] = LS(A, b)

fprintf("\n");

%Part B 
A = [4,2,3,0; -2,3,-1,1; 1,3,-4,2; 1,0,1,-1; 3,1,3,-2];
b = [10; 0; 2; 0; 5];
[solX_PartB, resid_norm_PartB] = LS(A, b)
