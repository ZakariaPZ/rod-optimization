function [yOut, t, y] = eulerMethodCode(BC, t1, t2, dy, h)
tic

%Initial boundary
dy_n = BC;

%Allocate space to arrays
tList = zeros(1, ((t2-t1)/h)+1);
yList = zeros(1, ((t2-t1)/h)+1);

tList(1)=0;
yList(1)=20;
for i=1:length(tList)    
    %Apply Euler's method 
    dy_n = dy_n + dy(dy_n)*h;
    %Update time and value list
    tList(i+1) = i*h;
    yList(i+1) = dy_n;
end

%return lists to plot, output 
yOut = dy_n;
t = tList;
y = yList;
toc 
end