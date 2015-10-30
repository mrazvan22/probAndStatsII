function ex3B3()

mu = 26;
stdDev = 0.09;
nrSamples = 10^6;
L = normrnd(mu, sqrt(stdDev), [1 nrSamples]);
U = unifrnd(0,1, [1 nrSamples]);

L1 = L .* U;

muL1 = mean(L1)

varL1 = var(L1)


end