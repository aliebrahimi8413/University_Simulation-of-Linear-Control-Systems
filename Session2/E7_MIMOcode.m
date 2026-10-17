% Creating MIMO System

s = tf('s');

G_11 = 1/(s+1);
G_12 = (s-1)/(s+2);
G_21 = (2*s+1)/(s+3);
G_22 = s/(2*s+5);

G = [G_11 G_12; G_21 G_22]

step(G)
grid on