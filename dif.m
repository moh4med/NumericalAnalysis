function [y] = dif(x)
epsilon=1e-8;
y=((x+epsilon)^2-x^2)/epsilon

