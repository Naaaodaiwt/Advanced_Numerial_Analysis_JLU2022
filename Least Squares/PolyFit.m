function a = PolyFit(x, y, n)
    m = length(x);
    G = zeros(n + 1, n + 1);
    d = zeros(n + 1, 1);
    for i = 1 : n + 1
        for j = 1 : n + 1
            for k = 1 : m
                G(i, j) = G(i, j) + x(k) ^ (i + j - 2);
            end
        end
        for k = 1 : m
            d(i) = d(i) + x(k) ^ (i - 1) * y(k);
        end
    end
    G
    d
    a = G \ d
end