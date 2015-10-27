function ex3A1()


proprnd = @(x) mvnrnd(x, 0.1*eye(2));
smpl = mhsample([0.8, 0.8],10^5,'pdf',@jointLik,'proprnd',proprnd,'symmetric',true);

X = smpl(:,1);
Y = smpl(:,2);

muX = mean(X);
muY = mean(Y);

muXY = mean(X .* Y);

muXsq = mean(X .^2);

covXY = cov(X,Y);
corrXY = corr(X,Y);
end

function l = jointLik(x)
  if (x(1) >= 0 && x(1) <= 1 && x(2) >= 0 && x(2) <= 1)
    l = x(1)+x(2);
  else
    l = 0;
  end
    
end

