close all

t = 0:.01:10;

s = tf('s');

%% Simple Pole Close to jw axis
G1 = 1/(s+1); 
figure
step(G1);
grid on
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E1.svg');

%% Simple Pole Away from jw axis
G2 = 1/(s+10); 
figure
step(G2);
grid on
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E2.svg');

%% Repeated Pole --> Slow Rise Time
G3 = 1/(s+1)^2; 
figure
step(G3);
grid on
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E3.svg');

%% Right Pole --> Unstable Response
G4 = 1/(s-1); 
figure
step(G4);
grid on
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E4.svg');

%%
G5 = 1/(s^2+2); % Pole at Origin --> Marginally Stable
% zita = 0 , w_n = sqrt(2)
figure
step(G5);
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E5.svg');

figure
u_cos = cos(t*1.41); 
[y, t] = lsim(G5,u_cos,t);  % Signal Frequency Close to System Frequency
plot(t,y);
grid on
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E6.svg');

%% One Pole at Right  --> Non-MinimumPhase
G6 = (s-1)/((s+1)*(s+2));  
figure
step(G6);
grid on
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E7.svg');

%% Img. Poles --> Oscillator Stable System
G7 = 1/((s+2+3i)*(s+2-3i));  
G8 = 1/((s+2+2i)*(s+2-2i));  % low b --> low oscillation
G9 = 1/((s+1+3i)*(s+1-3i));  % low a --> high oscillation & low settling time
G10 = 1/((s-1+3i)*(s-1-3i)); % a < 0 --> Unstable 
G11 = 1/((s+3i)*(s-3i)); % a = 0 --> Marginally stable
figure
u_stp = ones(size(t));
[y7, t] = lsim(G7, u_stp, t);
[y8, t] = lsim(G8, u_stp, t);
[y9, t] = lsim(G9, u_stp, t);
[y10, t] = lsim(G10, u_stp, t);
[y11, t] = lsim(G11, u_stp, t);
plot(t, y7);
hold on
plot(t, y8);
plot(t, y9);
plot(t, y10);
plot(t, y11);
ylim([-0.025 0.25]);
xlim([0 6])
legend('a=2, b=-+3', 'a=2, b=-+2', 'a=1, b=-+3', 'a=-1, b=-+3'...
            , 'a=0, b=-+3');
grid on
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E8.svg');

%% One Real Pole & Two Imaginary Poles --> dependent on Dominant Pole
a = 1;
b = 3;
c = 1;
G12 = 1/((s+c)*(s+a+b*1i)*(s+a-b*1i));  

figure
u_stp = ones(size(t));
[y12, t] = lsim(G12,u_stp,t);  
plot(t,y12);
grid on
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E9.svg');
figure
rlocus(G12)
grid on
set(gcf, 'WindowState', 'maximized');
saveas(gcf, 'E10.svg');