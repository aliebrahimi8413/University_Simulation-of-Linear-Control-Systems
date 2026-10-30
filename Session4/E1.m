clear all
clc

% this system transfer function equal to zero 
% because the input not affects on the steady varible x1
% and x2 affects on output
% and x1 not affects on x2

A = [1 0; -1 -2];
B = [0; 1];
C = [1 0];
D = [0];

G = ss(A, B, C, D);
step(G) % check step response
grid on

eig(A) % check eigenValue
pole(G) % check poles
isstable(G) % Check Stability

tf(G) % Check Transfer Function