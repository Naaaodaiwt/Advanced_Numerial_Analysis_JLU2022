function [Q, H] = ArnoldiIteration(A, q1, k)
    q1 = q1 / norm(q1);
    n = size(A, 1);
    Q = zeros(n, k + 1);
    Q(:, 1) = q1;
    H = zeros(k + 1, k);

    for i = 1 : k
        w = A * Q(:, i);
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