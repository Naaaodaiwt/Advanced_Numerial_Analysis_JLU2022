function x = TridiagonalGeneralizedMinimalRES(A, b, eps)
    n = size(A, 1);
    Bout = spdiags(A, -1 : 1);  % 提取 A 的三对角元素
    P = spdiags(Bout, -1 : 1, n, n);  % 生成对应三对角矩阵
    v1 = chase(P, b);  % 避免直接求逆，使用追赶法求解右端向量
    k = 1;
    beta = norm(v1);
    rho = norm(v1);
    while (norm(rho) ^ 2) / (beta ^ 2) >= eps
        [Q, H] = ArnoldiIteration_pre(P, A, v1, k);
        [Sk, Rk] = qr(H);
        Rkk = Rk(1 : k, :);
        uk = beta * Sk';
        tk = uk(1 : k, 1);
        rho = uk(k + 1, 1);
        yk = Rkk \ tk;
        x = Q(:, 1 : k) * yk;
        k = k + 1;
    end
    k
end

