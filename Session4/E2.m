clear all
clc

A = [1 0; -1 -2];
B = [0; 1];
C = [0 1];
D = [0];

G = ss(A, B, C, D);
step(G) % check step response
grid on

eig(A) % check eigenValue
pole(G) % check poles
isstable(G) % Check Stability

tf(G) % Check Transfer Function