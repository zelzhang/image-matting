function alpha = generateAlpha(I,fg_and_bg,fg)
    
  s = size(I);
  ss = s(1)*s(2);

  A=getLaplacian1(I,fg_and_bg);
  size(A)
  D=spdiags(fg_and_bg(:),0,ss,ss);
  lambda=100;
  
  x=(A+lambda*D)\(lambda*fg(:));
   size(x)

  alpha=max(min(reshape(x,s(1),s(2)),1),0);
  size(alpha)
