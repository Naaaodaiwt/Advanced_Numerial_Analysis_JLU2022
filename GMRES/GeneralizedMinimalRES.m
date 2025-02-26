function x = GeneralizedMinimalRES(A, b, eps)
    k = 1;
    beta = norm(b);
    rho = norm(b);
    while (norm(rho) ^ 2) / (beta ^ 2) >= eps
        [Q, H] = ArnoldiIteration(A, b, k);
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

