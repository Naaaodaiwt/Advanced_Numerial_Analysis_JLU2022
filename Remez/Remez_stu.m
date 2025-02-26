function [sigma, pa] = Remez_stu(a, b, n)

epsilon = 1e-5;
eta = 1.0;

A = linspace(a, b, n + 2);

while eta > epsilon
    [eta, xmax, sigma, pa] = approximation(a, b, A);
    A = exchange(A, xmax, pa);
end

end

function y = f(x)
y = sin(3*x);
end

function [eta, xmax, sigma, pa] = approximation(a, b, A)
    
    n = length(A) - 2;
    C = zeros(n); 
    
    for i = 1 : n + 2
        C(i, 1) = (-1) ^ (i + 1);
        for j = 2 : n + 2
            C(i, j) = A(i) ^ (j - 2);
        end
    end
    h = f(A);
    y = C \ h';
    sigma = y(1);
    pa = y(2 : n + 2);
    
    m = 1000;
    x = linspace(a, b, m);
    pv = zeros(m, 1);
    for i = 1 : m
        p = polynomial_value(pa, x(i));
        pv(i) = p;
    end
    pv = pv';
    q = abs(f(x) - pv);
    eta = max(q) - abs(sigma);
    for i = 1 : m
        if abs(f(x(i)) - pv(i)) - abs(sigma) == eta
            xmax = x(i);
        end
    end
end

function p = polynomial_value(pa, x)
    % 算出多项式在离散点处的值
    n = length(pa) - 1;
    p = 0;
    for j = 1 : n + 1
        p = p + pa(j) * x ^ (j - 1);
    end
end 


function A = exchange(A, xmax, pa)

    n = length(A) - 2;
    if xmax < A(1)
        if (f(A(1)) - polynomial_value(pa, A(1))) * (f(xmax) - polynomial_value(pa, xmax)) < 0
           A(2 : n + 2) = A(1 : n + 1);
        end
        A(1) = xmax;
    elseif xmax > A(n + 2)
        if (f(A(n + 2)) - polynomial_value(pa, A(n + 2))) * (f(xmax) - polynomial_value(pa, xmax)) < 0
            A(1 : n + 1) = A(2 : n + 2);
        end
        A(n + 2) = xmax;
    else
        for i = 1 : n + 1
            if A(i) < xmax && xmax < A(i + 1)
                if (f(A(i)) - polynomial_value(pa, A(i))) * (f(xmax) - polynomial_value(pa, xmax)) < 0
                    A(i + 1) = xmax;
                else
                    A(i) = xmax;
                end
                break;
            end
        end
    end
end
              
