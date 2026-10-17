% Creation System with s=tf('s') Method

s = tf('s');

G = (s^2-2*s+1)/(s^4-2*s^2+6)
step(G)