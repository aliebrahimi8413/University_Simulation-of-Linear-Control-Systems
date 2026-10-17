% zpk to tf Transforming

Z = [1];
P = [-2 -2 -3];
K = 5;

G = tf(zpk(Z,P,K));
step(G)
grid on