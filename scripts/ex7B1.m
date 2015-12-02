function ex7B1()

z = mvnrnd([0 0], eye(2))';

R = [sqrt(2) -1/sqrt(2); 0 2];

z2 = mtimes((R'), z);

S = 0.5 * [1+sqrt(3), 1-sqrt(3); 1-sqrt(3), 1+sqrt(3) ];

z3 = S*z;

end