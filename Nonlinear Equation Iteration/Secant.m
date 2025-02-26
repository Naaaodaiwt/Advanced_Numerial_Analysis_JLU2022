function r = Secant(f, x0, x1, eps)
    g = (f(x1) - f(x0)) / (x1 - x0);
    r = x1 - g \ f(x1);
    k = 1;
    while norm(f(r)) >= eps
        x0 = x1;
        x1 = r;
        g = (f(x1) - f(x0)) / (x1 - x0);  % 差商代替微商
        r = x1 - g \ f(x1);
        k = k + 1;
    end
    k
end