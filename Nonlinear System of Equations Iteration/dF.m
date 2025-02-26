function y = dF(x)

n = length(x);
y = sparse(n, n);

y(1,1) = 3;
y(1,2) = -2*x(2)*exp(-x(2)^2);

for i = 2:n-1
    y(i,i-1) = -sin(x(i-1));
    y(i,i) = 3;
    y(i,i+1) = -2*x(i+1)*exp(-x(i+1)^2);
end

y(n, n-1) = -sin(x(n-1));
y(n,n) = 3;

end