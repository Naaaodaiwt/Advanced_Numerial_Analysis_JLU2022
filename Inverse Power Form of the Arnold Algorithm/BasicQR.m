function [V, Lambda] = BasicQR(A, epsilon)
    k = 0;
    Ak = A;
    Q = eye(size(A, 1));
    while norm(Ak - triu(Ak)) > epsilon
        k = k + 1;
        [Qk, Rk] = qr(Ak);
        Q = Q * Qk;
        Ak = Rk * Qk; % 计算基本 QR 方法的迭代矩阵
    end
    n = size(Ak, 1);
    Vk = zeros(n);
    Lambda = diag(Ak);
    % 接下来考虑求出特征向量，为后续算 Ritz 向量做准备
    for i = n : -1 : 1
        fi = Lambda(i) * eye(n) - Ak;
        for j = i : -1 : 1
            if j == i
                Vk(j, i) = 1;
            else
                temp = 0;
                for k = n : -1 : j + 1
                    temp = temp + fi(j, k) * Vk(k, i);
                end
                    Vk(j, i) = -temp / fi(j, j);
            end
        end
        Vk(:, i) = Vk(:, i) / norm(Vk(:, i));
    end
    V = Q * Vk;  % V 才是 A 对应特征向量组成的矩阵
end