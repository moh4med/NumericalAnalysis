function [ln err] = newton(func,l)
dx=1e-9;
f=inline(func);
fd=f(l+dx);
dd=fd-f(l);
ln=l-f(l)/(dd/dx);
err=abs((ln-l)/ln);
