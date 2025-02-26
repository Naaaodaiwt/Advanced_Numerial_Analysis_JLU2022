function [Q, H] = ArnoldiIteration_1(F, x, h, k)
    q = -F(x) / norm(-F(x));
    n = length(x);
    Q = zeros(n, k + 1);
    Q(:, 1) = q;
    H = zeros(k + 1, k);
    for i = 1 : k
        w = (F(x + h * Q(:, i)) - F(x - h * Q(:, i))) / (2 * h);
        for j = 1 : i
            H(j, i) = w' * Q(:, j);
            w = w - H(j, i) * Q(:, j);
        end
        H(i + 1, i) = norm(w);
        if H(i + 1, i) == 0
            disp('无法继续正交化');
            break;
        else
            Q(:, i + 1) = w / H(i + 1, i);
        end
    end
end