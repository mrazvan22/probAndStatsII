function ex5B1()

proprnd = @(x) mvnrnd(x, 0.1*eye(2));
a = 1;
likWithA = @(x) jointLik(x,a);
startX = [0, 0.1];
jointLik(startX,a)
[smpl, acc] = mhsample(startX,10^5,'pdf',likWithA,'proprnd',proprnd,'symmetric',true);

X = smpl(:,1);
Y = smpl(:,2);

muX = mean(X);
muY = mean(Y);

muXY = mean(X .* Y);

muXsq = mean(X .^2);

covXY = cov(X,Y);
corrXY = corr(X,Y);

end


function l = jointLik(x, a)
  if (x(1) >= -1 + (a+1)*x(2) && x(1) <= 1 + (a-1)*x(2) && x(2) >= 0)
    l = 1;
  else
    l = 0;
  end
    
end

