function x = CholeskyPrecondition_stu(A, b, eps)
    L = IncompleteCholesky_stu(A);
    b = L \ b;
    k = 0;
    x = 0;
    r = b;
    p = b;
    pho = r' * r;
    while pho / (b' * b) >= eps
        pho_last = pho;
        % 不要直接求L的逆, 通过下述方式间接求出
        v = L' \ p;
        v = A * v;
        v = L \ v;
        % 实现共轭梯度法
        alpha = pho / (v' * p);
        x = x + alpha * p;
        r = r - alpha * v;
        pho = r' * r;
        beta = pho / pho_last;
        p = r + beta * p;
        k = k + 1;
    end
    x = L' \ x;
    k
end