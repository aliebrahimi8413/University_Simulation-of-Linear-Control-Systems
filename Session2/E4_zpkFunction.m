% Creating System with zpk Function

Z = [1];
P = [-2 -2 -3];
K = 5;

G = zpk(Z,P,K)
step(G)