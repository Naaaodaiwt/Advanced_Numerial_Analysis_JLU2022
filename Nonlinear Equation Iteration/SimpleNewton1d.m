function r = SimpleNewton1d(f, df, x0, eps)
    B = df(x0);  % 用初始近似的f'(x0)代替所有的f'(xk)
    r = x0 - B \ f(x0);
    k = 1;
    while norm(f(r)) >= eps
        x0 = r;
        r = x0 - B \ f(x0);
        k = k + 1;
    end
    k
end