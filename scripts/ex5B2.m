function ex5B2()

% proprnd = @(x) mvnrnd(x, eye(2));
% startX = [0, 0];
% jointLikXY(startX)
% [smpl, acc] = mhsample(startX,10^5,'pdf',@jointLikXY,'proprnd',proprnd,'symmetric',true);

a = pi/2;
nrSamples = 10^5;
U = unifrnd(-a,a,[nrSamples,1],);
X = sin(U);

muX = mean(X);
muY = mean(U);

muXU = mean(X .* U);

muXsq = mean(X .^2);

covXU = cov(X,U);
corrXU = corr(X,U);

varX = var(X);
end


function l = jointLikXY(x)
    l = exp(-norm(x));    
end

