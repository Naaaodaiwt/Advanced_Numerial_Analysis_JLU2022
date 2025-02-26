function x = ConjugateGradient_stu(A, b, eps)
    k = 0;
    x = 0;
    r = b;
    p = b;
    pho = r' * r;

    while pho / (b' * b) >= eps
        pho_last = pho;  % 保存上一次的 pho
        v = A * p;
        alpha = pho / (v' * p);
        x = x + alpha * p;
        r = r - alpha * v;
        pho = r' * r;
        beta = pho / pho_last;
        p = r + beta * p;
        k = k + 1;
    end
    k
end