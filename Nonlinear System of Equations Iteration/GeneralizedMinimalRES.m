function s = GeneralizedMinimalRES(F, x, h, eps)
    
    k = 1;
    beta = norm(-F(x));
    rho = beta;
    
    while (rho ^ 2) / (beta ^ 2) >= eps
        [Q, H] = ArnoldiIteration_1(F, x, h, k);
        [Sk, Rk] = qr(H);
        Rkk = Rk(1 : k, :);
        uk = beta * Sk';
        tk = uk(1 : k, 1);
        rho = uk(k + 1, 1);
        yk = Rkk \ tk;
        s = Q(:, 1 : k) * yk;
        k = k + 1;
    end
end

