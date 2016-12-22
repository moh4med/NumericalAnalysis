function [ln rn err] = secant(func,l,r)
f=inline(func);
a=l-r;
b=f(l)-f(r);
rn=r-f(r)*a/b;
ln=r;
err=abs((rn-ln)/rn);