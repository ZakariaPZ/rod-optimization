function [root] = NewtonRaphson(x0, errLim, f)
%IMPORTANT: To make the function as general as possible, 
%code takes in f like this: NewtonRaphson(x0, errLim, @(x) x^2-1)
tic
%format to output max decimal places
format long
%initialize variables and constants 
ea = 100;
xn = x0;
err = errLim;
maxIter = 50;
counter = 0;
noErr = 1;

%continue to run code until error ea is low enough, or the maximum
%number of iterations have been passed
while (ea > err && counter < maxIter)
    %update counter
    counter = counter + 1;
    %save previous value of xn before updating it
    xprev = xn;
    %evaluate function and its derivative 
    fxn = f(xn);
    fdf = NRDerivative(f, xn);
    %break loop and return error if f' = 0 
    if fdf == 0
        root = 'Error - division by zero';
        noErr = 0;
        break
    end
    %apply Newton-Raphson method
    xn = xn - fxn/fdf;
    %update error
    ea = abs((xn - xprev)/xn);
end
toc 
disp(counter)
%return root
if (noErr)
    root = double(xn);
end

end