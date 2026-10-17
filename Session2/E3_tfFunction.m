% Creating System with tf Function

Num = [1 1];
Den = [1 4 2 1];

G = tf(Num, Den)
step(G)

