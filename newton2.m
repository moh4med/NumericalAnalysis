function [] = newton(l,m)
for i=1:15
    [y1 d1]=sol(l);
    l=l-m*(y1/d1)
    yl=sol(l);
end    
