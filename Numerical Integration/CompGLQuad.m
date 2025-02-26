function G = CompGLQuad(f, a, b, n)
    h = (b - a) / n;
    G = 0;
    for i = 1 : n
        t = [-sqrt(3 / 5); 0; sqrt(3 / 5)];
        A = [5 / 9; 8 / 9; 5 / 9];
        x = h * t / 2 + a + (i - 1 / 2) * h;
        Gi = (A(1) * f(x(1)) + A(2) * f(x(2)) + A(3) * f(x(3))) * h / 2;
        G = G + Gi;
    end
end