function [ln rn xrr err] = regula_falsi(func,l,r,xr,ch)
    f=inline(func)
    yl=f(l);
    yr=f(r);
    a=(l*yr-r*yl)/(yr-yl)
    ya=f(a)
    if(ya*yl>0)
        ln=a;
        rn=r;
    else
        ln=l;
        rn=a;
    end   
    if ch>1
    err=abs((a-xr)/a);
    else
        err=1000;
    end
    xrr=a;