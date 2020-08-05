% Program: Backward difference method for heat equation
% Input: D diffusion coefficient, functions f, l, r,
%        space interval [xl, xr], time interval [yb, yt],
%        number of space steps M, number of time steps N
% Ouput: solution w
% Example usage: w=heatbd(0,1,0,1,10,10)
function w=heatbd(D, f, l, r, xl, xr, yb, yt, M, N)
  h=(xr-xl)/M;
  k=(yt-yb)/N; 
  m=M-1; 
  n=N;
  sigma=D*k/(h*h);
  a=diag(1+2*sigma*ones(m,1))+diag(-sigma*ones(m-1,1),1);
  a=a+diag(-sigma*ones(m-1,1),-1);  % define matrix a
  lside=l(yb+(0:n)*k); rside=r(yb+(0:n)*k);
  w(:,1)=f(xl+(1:m)*h)';  % initial conditions
  for j=1:n
    w(:, j+1)=a\(w(:,j)+sigma*[lside(j); zeros(m-2,1); rside(j)]);
  end
  w=[lside; w; rside];  % attach boundary conds
  x=(0:m+1)*h; 
  t=(0:n)*k;
  mesh(x,t,w')  % 3-D plot solution w
  view(60,30); 
  axis([xl xr yb yt])
endfunction

%Part A
f=@(x) 2*cosh(x);
l=@(t) 2*e.^(2*t);
r=@(t) ((e.^2)+1)*(e.^((2*t)-1));
figure(1);
heatbd(2,f,l,r,0,1,0,1,50,50); % h=0.02, k=0.02
figure(2);
heatbd(2,f,l,r,0,1,0,1,50,100); % h=0.02, k=0.01
figure(3);
heatbd(2,f,l,r,0,1,0,1,50,200); % h=0.02, k=0.005

%Part B
f=@(x) e.^x;
l=@(t) e.^(2*t);
r=@(t) (e.^((2*t)+1));
figure(4);
heatbd(2,f,l,r,0,1,0,1,50,50); % h=0.02, k=0.02
figure(5);
heatbd(2,f,l,r,0,1,0,1,50,100); % h=0.02, k=0.01
figure(6);
heatbd(2,f,l,r,0,1,0,1,50,200); % h=0.02, k=0.005