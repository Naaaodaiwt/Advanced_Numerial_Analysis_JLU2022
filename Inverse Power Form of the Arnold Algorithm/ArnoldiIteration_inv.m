function [Q, H] = ArnoldiIteration_inv(A, q1, k)

    q1 = q1 / norm(q1);
    n = size(A, 1);
    Q = zeros(n, k + 1);
    H = zeros(k + 1, k);
    Q(:, 1) = q1;
    
    for i = 1 : k
        w = A \ Q(:, i);  % 欲求最小特征值，采用反幂法
        for j = 1 : i
            H(j, i) = w' * Q(:, j);
            w = w - H(j, i) * Q(:, j);
        end
        H(i + 1, i) = norm(w);
        if H(i + 1, i) == 0
            disp('正交化无法继续');
            break;
        else
            Q(:, i + 1) = w / H(i + 1, i);
        end
    end
end