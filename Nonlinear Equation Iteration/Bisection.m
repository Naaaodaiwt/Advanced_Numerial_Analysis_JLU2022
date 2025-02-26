function r = Bisection(f, a, b, eps)
    r = (a + b) / 2;
    k = 1;
    while b - a >= eps
        if f(a) * f(r) > 0
            a = r;
        else 
            b = r;
        end
        r = (a + b) / 2;
        k = k + 1;
    end
    k
end
