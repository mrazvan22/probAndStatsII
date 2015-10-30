function ex3B1()

propCov = [1,0;0,0.1];
proprnd = @(x) mvnrnd(x, propCov);
a = 20;
pdf = @(x) jointLik(x, a);
nrSamples = 10^5;
smpl = mhsample([0.8, 0.8],nrSamples,'pdf',pdf,'proprnd',proprnd,'symmetric',true);

X = smpl(:,1);
Y = smpl(:,2);

muX = mean(X);
muY = mean(Y);

muXY = mean(X .* Y);

muXsq = mean(X .^2);

covXY = cov(X,Y);
corrXY = corr(X,Y);

Yvals = 0:0.01:1;
delta = 0.01;
Xvals = 0:delta:10;


for j=1:nrSamples
  pXY(j) = jointLik(smpl(j,:), a);
end

for i=1:1001
  
  Xind = abs(X - Xvals(i)) < delta;
  muYgX(i) = mean(Y(Xind));
  
  sampledYgX{i} = Y(Xind);
  for j=1:101
    theoYgX{i}(j) = probYgX(Xvals(i),Yvals(j), a);
  end
  
  expectYgX(i) = expYgX(Xvals(i), a);
  
  margX(i) = pX(Xvals(i), a);
  
end

figure
plot(Xvals, muYgX);
hold on
plot(Xvals, expectYgX);
legend('empirical', 'theoretical')
  
% figure
% hist(X, 30);
% hold on
% plot(Xvals, nrSamples * margX);
% legend('samples', 'theoretical marginal p(X)')

bucketNr = 46;
figure
hist(sampledYgX{bucketNr}, 20);
hold on 
plot(Yvals, length(sampledYgX{bucketNr})/5 * theoYgX{bucketNr});

end

function expYgX = expYgX(x, a)
 % expectation of Y given X
  expYgX = -exp(-x*a)/(1-exp(-x*a)) + 1/(x*a);

end

function pYgX = probYgX(x,y, a)
 % expectation of Y given X
  pYgX = a*x*exp(-x*a*y)/(1-exp(-x*a));

end


function marginalX = pX(x, a)
  if x > 0
    marginalX = ((a+1)/a) *(1-exp(-x*a))* exp(-x);
  else
    marginalX = 0;
  end
end

function l = jointLik(x, a)
% x = [X,Y] is a 2x1 vector
  if (x(1) >= 0 && x(2) > 0 && x(2) < 1)
    l = (a+1)*x(1)*exp(-x(1)*(a*x(2)+1));
  else
    l = 0;
  end
    
end
