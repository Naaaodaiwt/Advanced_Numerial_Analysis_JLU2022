function [Q, H] = ArnoldiIteration_pre(P, A, q1, k)
    q1 = q1 / norm(q1);
    n = size(A, 1);
    Q = zeros(n, k + 1);
    Q(:, 1) = q1;
    H = zeros(k + 1, k);
    for i = 1 : k
        wl = A * Q(:, i);  
        % 注意整个Arnoldi算法中只有这里出现和 A 直接相乘
        w = chase(P, wl);  % 仍然避免直接求逆，使用追赶法求解
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