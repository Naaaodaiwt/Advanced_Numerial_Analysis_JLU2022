function r = Newton1d(f, df, x0, eps)
    r = x0 - df(x0) \ f(x0);
    k = 1;
    while norm(f(r)) >= eps
        x0 = r;
        r = x0 - df(x0) \ f(x0);
        k = k + 1;
    end
    k
end