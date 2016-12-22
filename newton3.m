function [] = newton(l)
for i=1:15
    [y1 d1 d2]=sol(l);
    l=l-(y1*d1/(d1^2-y1*d2))
    yl=sol(l);
end    
