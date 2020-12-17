function [t, T] = funcODE45
%f = @(t, x) [-10*x(1) + 10*x(2); 28*x(1)-x(2)-x(1)*x(3);
%    -3*x(3)+x(1)*x(2)];

mdot=0.1;
ht=10;
At=2;
C=4180;
hcoil=150;
Acoil=0.5;
Tin=70;
M=200;
Tinf=20;

f = @(t, T) (-2*mdot*C*Acoil*hcoil*(T-Tin)/(Acoil*hcoil+2*C*mdot)-ht*At*(T-Tinf))/(M*C);


[t,T] = ode45(f,[0, 12*3600], 20);

end 
