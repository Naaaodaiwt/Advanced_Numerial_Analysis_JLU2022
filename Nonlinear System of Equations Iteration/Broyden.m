function r = Broyden(F, x0, B0, eps)
    s = B0 \ (-F(x0));
    r = x0 + s;
    k = 0;
    while norm(F(r)) >= eps
        y = F(r) - F(x0);
        B0 = B0 + (y - B0 * s) * s' / (s' * s);
        s = B0 \ (-F(r));
        x0 = r;
        r = r + s;
        k = k + 1;
    end
    k
end
    