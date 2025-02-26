function y = F(x)

n = length(x);
y = zeros(n,1);

y(1) = 3*x(1) + exp(-x(2)^2) - 1;
for i = 2:n-1
    y(i) = cos(x(i-1)) + 3*x(i) + exp(-x(i+1)^2) - 1;
end
y(n) = cos(x(n-1)) + 3*x(n) - 1;

end