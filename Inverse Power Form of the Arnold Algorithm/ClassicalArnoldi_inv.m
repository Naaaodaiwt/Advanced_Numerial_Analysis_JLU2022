function [mu, U] = ClassicalArnoldi_inv(A, q, m)
    q = q / norm(q);
    eps = 1;
    k = m - 1;
    while eps > 1e-16
        k = k + 1;
        I = eye(k);
        ek = I(:, k);
        [Q, H] = ArnoldiIteration_inv(A, q, k);
        Hk = H(1 : k, :);
        [V, Lambda] = BasicQR(Hk, eps);
        Q = Q(:, 1 : k);
        U = Q * V;  % 计算 Ritz 向量
        for j = 1 : m
            eps = norm(H(k + 1, k)) * norm(ek' * V(:, j));
            if eps > 1e-16
                break;
            end
        end
    end
    mu = 1 ./ Lambda(1:3);  % 取倒数才是 A 本身对应的最小特征根
end