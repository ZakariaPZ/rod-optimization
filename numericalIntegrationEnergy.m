function [Energy] = numericalIntegration(a, b, n, f)

%Initialize area
area = 0;
M = 200;
C = 4180;

%Check remainder
out=rem(n,2);

%Initialize stepsize and 
h = (b - a)/n;
x0 = a;
x1 = a + h;
x2 = a + 2*h;

%Apply trapezoidal to first segment 
if out == 1
    %Apply trap rule 
    I = (x1 - x0)*(f(x0) + f(x1))/2;
    area = area + I;
    %Index the points 
    x0 = x0 + h;
    x1 = x1 + h;
    x2 = x2 + h;
    %Replace n by new value
    n = n - 1;
end

%Apply simpson's rule
for i=1:n/2
    %reassign final value to prevent going past b 
    if i == n/2
        x2 = b;
    end
    
    %apply simpson's 
    I = (x2 - x0)*(f(x0) + 4*f(x1) + f(x2))/6;
    
    area = area + I;
    
    %index points
    x0 = x0 + 2*h;   
    x1 = x1 + 2*h;
    x2 = x2 + 2*h;
end

Energy = M*C*area/12

%error
%abs(1296*pi/91 - area)/1296*pi/91;

end