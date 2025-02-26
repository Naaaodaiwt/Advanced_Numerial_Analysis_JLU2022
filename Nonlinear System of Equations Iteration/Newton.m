function r = Newton(F, dF, x0, eps)
    s = dF(x0) \ (-F(x0));
    x = x0;
    r = x + s;
    k = 1;
    while norm(F(r)) >= eps
        s = dF(r) \ (-F(r));
        r = r + s;
        k = k + 1;
    end
    k
end