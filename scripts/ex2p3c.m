function ex2p3c()

rng(9);
n = 50;
p = 0.3;
nrSamples = 10^6;
X = binornd(n,p,[nrSamples 1]);
Y = gamrnd(X+1, 0.1);

expect = mean(2*X.^3 + 2*X.^2 - 0.2*Y.*(X.^2))

end