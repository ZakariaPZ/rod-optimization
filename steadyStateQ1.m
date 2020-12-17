mdot=0.1;
ht=10;
At=2;
C=4180;
hcoil=150;
Acoil=0.5;
Tin=70;
M=200;
Tinf=20;

f = @(T) (-2*mdot*C*Acoil*hcoil*(T-Tin)/(Acoil*hcoil+2*C*mdot)-ht*At*(T-Tinf))/(M*C);


fzero(f, 20)