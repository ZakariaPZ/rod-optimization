format long
clear 
mdot=0.1;
ht=10;
At=2;
C=4180;
hcoil=150;
Acoil=0.5;
Tin=@(t) 20 + 50*sin(pi*t/43200);
M=200;
Tinf=20;

f = @(t, T) (-2*mdot*C*Acoil*hcoil*(T-Tin(t))/(Acoil*hcoil+2*C*mdot)-ht*At*(T-Tinf))/(M*C);


[t1,T1] = ode45(f,[0 12*3600], 20);

texp = [0.0, 0.5, 1.5, 2.5, 3.5, 6.0, 8.5, 11.0, 12.0]*3600;
Texp = [20.5, 21.0, 22.5, 30.0, 33.5, 47.5, 53.0, 45.0, 37.5];

plot(texp, Texp)
hold on 
plot(t1, T1) 
legend('Exp', 'ode45')

xlabel('Time')
ylabel('Temp')
title('Temperature vs. Time')


