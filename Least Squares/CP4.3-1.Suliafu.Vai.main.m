% Program 4.1 Modified Gram-Schmidt Orthogonalization
% Input: m x n matrix A with linearly independent columns
% Output: Orthogonal matrix Q, upper triangular R
% Example usage: [Q,R]=clgs(A)
function [Q,R] = clgs(A)
  [m,n] = size(A);
  for j = 1:n
    y = A(:,j);
    for i = 1:j-1
      R(i,j) = Q(:,i)'* y;
      y = y - R(i,j) * Q(:,i);
    endfor
    R(j,j) = norm(y);
    Q(:,j) = y/R(j,j);
  endfor
endfunction

%PartA
fprintf("Part A\n")
[Q, R] = clgs([4,0; 3,1])
[Q_octave, R_octave] = qr([4,0; 3,1])
fprintf("\n");

fprintf("Part B\n")
[Q, R] = clgs([1,2; 1, 1])
[Q_octave, R_octave] = qr([1,2; 1, 1])
fprintf("\n");

fprintf("Part C\n")
[Q, R] = clgs([2,1; 1,-1; 2,1])
[Q_octave, R_octave] = qr([2,1; 1,-1; 2,1])
fprintf("\n");

fprintf("Part D\n")
[Q, R] = clgs([4, 8, 1; 0, 2, -2; 3, 6, 7])
[Q_octave, R_octave] = qr([4, 8, 1; 0, 2, -2; 3, 6, 7])
fprintf("\n");