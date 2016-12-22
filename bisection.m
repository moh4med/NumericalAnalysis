function [ll rr xrr err] = bisection(func,l,r,xr,ch)
    f=inline(func);
    yl=f(l);
    yr=f(r);
    a=(l+r)/2;
    ya=f(a);
    if(ya*yl>0)
        ll=a;
        rr=r;
    else
        rr=a;
        ll=l;
    end
    if ch>1
    err=abs((a-xr)/a);
    else
        err=1000;
    end
    xrr=a;
