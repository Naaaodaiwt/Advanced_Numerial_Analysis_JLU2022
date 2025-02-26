function a = PolyFit_simple(x, y, n)
    P = x .^ (0 : n);
    P = P'; 
    G = P * P'
    d = P * y
    a = G \ d
end