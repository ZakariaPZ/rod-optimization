function [root] = GoldenSearch(xl0, xu0, errlim, f)
tic
format long

%Initialize iteration counter
count = 0;

%Initialize golden ratio 
R = (sqrt(5)-1)/2;

%initialize intervals
x_l = xl0;
x_u = xu0;

%Initialize d value, and x1, x2
d = R*(x_u - x_l);
x1 = x_l + d;
x2 = x_u - d;

%Initialize variable for best estimate of root
xest = 'None';

%set error limit
err = errlim;
ea = 100;

%Evaluate f(x1) and f(x2) to see which is closer to the max
fx1 = f(x1);
fx2 = f(x2);

if fx1 > fx2
    xest = x1;
    fx = fx1;
else 
    xest = x2;
    fx = fx2;
end 

%loop until error is less than desired error
while (ea > err)
    d = R*d;
    if fx1 > fx2
        %apply appropriate reassignments when fx1 > fx2
        x_l = x2;
        x2 = x1;
        x1 = x_l + d;
        fx2 = fx1;
        fx1 = f(x1);
    else 
        %apply appropriate reassignments when fx1 < fx2
        x_u = x1;
        x1 = x2;
        x2 = x_u - d;
        fx1 = fx2;
        fx2 = f(x2);
    end 
    count = count + 1;
    if fx1 > fx2
        xest = x1;
        fx = fx1;
    else
        xest = x2;
        fx = fx2;
    end
    %update error 
    if xest ~= 0
        ea = (1-R)*abs(x_u - x_l)/xest;
    else
        break
    end 
end 

%output root 
f(xest);
root = xest; 
count;

end
