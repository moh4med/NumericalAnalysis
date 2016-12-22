F = @(x) cos(7*x).*exp(-2*x.^2).*(1-2*x.^2);
interval = [-10, 10];
N = 500;
start_pts = linspace(interval(1),interval(2),N);
found_roots = [];
for i=1:numel(start_pts)-1
    try
        found_roots(end+1) = fzero(F,[start_pts(i),start_pts(i+1)]);
    end
end

% Plot results:
figure, hold on
fplot(F,interval,1e-4)
plot(found_roots,zeros(size(found_roots)),'rx')