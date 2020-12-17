function [derivative] = NRDerivative(f, xn)
%create symbolic variable x 
syms x;
%differentiate input function
df = diff(f, x);
%Give x a value
x = xn;
%Evaluate derivative at xn
val = subs(df);
%return derivative value
derivative = val;

end 