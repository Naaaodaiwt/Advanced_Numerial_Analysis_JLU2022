function x = chase(A, b)
    n = size(A, 1);
    r = zeros(n, 1);
    l = zeros(n, 1);
    y = zeros(n, 1);
    x = zeros(n, 1);
    r(1, 1) = A(1, 1);
    for i = 2 : n
        l(i, 1) = A(i, i - 1) / r(i - 1, 1);
        r(i, 1) = A(i, i) - l(i, 1) * A(i - 1, i);
    end

    y(1, 1) = b(1, 1);
    for i = 2 : n
        y(i, 1) = b(i, 1) - l(i, 1) * y(i - 1, 1);
    end
    
    x(n, 1) = y(n, 1) / r(n, 1);
    for i = n - 1 : -1 : 1
        x(i, 1) = (y(i, 1) - A(i, i + 1) * x(i + 1, 1)) / r(i, 1);
    end
