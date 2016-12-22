function [ln err] = fixedpoint(func,l,ch)
f=inline(func);
ln=f(l)
 if ch>1
     l
    err=abs((ln-l)/ln)
    else
        err=1000;
    end
