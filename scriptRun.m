hSteps = [1, 300, 3600];
format long 

mdot=0.1;

ht=10;
At=2;
C=4180;
hcoil=150;
Acoil=0.5;
Tin=70;
M=200;
Tinf=20;

func = @(T) (-2*mdot*C*Acoil*hcoil*(T-Tin)/(Acoil*hcoil+2*C*mdot)-ht*At*(T-Tinf))/(M*C);

for h=hSteps
    tic
    [val, t, y] = eulerMethod(20, 0, 12*60*60, func, h);
    toc
    hold on 
    plot(t, y)
    xlabel('t')
    ylabel('y')
    disp(val)
end

tic
[t, T] = funcODE45;
toc

plot(t, T);
T(length(T))

legend('1', '300', '3600', 'ode45')
xlabel('Time (s)')
ylabel('Temp')



