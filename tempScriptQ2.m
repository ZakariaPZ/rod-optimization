Temp = [200];
Temp = [Temp, TDMA([-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05, 2.05], [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1], [201, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 101], 19)];
Temp = [Temp, 100];
%x = [0, 0.4, 0.8, 1.2, 1.6, 2];
x = 0:0.1:2;

TL = 100;
T0 = 200;
h=100;
k=400;
L=2;
d=0.2;
r=d/2;
P=2*pi*(r);
Tinf=20;
Ac=pi*r^2;

m = sqrt(h*P/(k*Ac));

xTemp = 0:0.01:2;
T = ((TL - Tinf)/(T0-Tinf)*sinh(m*xTemp) + sinh(m*(L-xTemp)))/sinh(m*L)*(T0-Tinf)+Tinf;

scatter(x, Temp)
hold on 
plot(xTemp, T)
xlabel('Length (x)')
ylabel('Temperature')
title('Temperature Along Rod')
legend('Approximate', 'Analytical')

min(T)