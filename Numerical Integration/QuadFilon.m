function I = QuadFilon(g, dg, a, b, m, n)
    h = (b - a) / n;
    x = a + (0: 1: n) * h;
    y = g(x);
    b2 = [1; y'; exp(pi/2)];
    I = (g(b)*sin(m*b)-g(a)*sin(m*a))/m;
    I = I + (dg(b)*cos(m*b)-dg(a)*cos(m*a))/(m^2);
    S = spline(x, b2);
    s2b = S.coefs(end,1) * (b-x(n)) + S.coefs(end,2);
    s2a = S.coefs(1,2);
    I = I - (s2b*sin(m*b)-s2a*sin(m*a))/(m^3);
    for i = 1 : n
        I = I - S.coefs(i, 1)*(cos(m*x(i+1))-cos(m*x(i)))/(m^4);
    end
end
