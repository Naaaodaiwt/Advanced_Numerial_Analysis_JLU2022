function x = DiagnoalPrecondition_stu(A, b, eps)
    diagA = spdiags(A, 0);  % 提取A的主对角线元素
    n = length(A);
    
    P = sqrt(1 ./ diagA);
    P = spdiags(P, 0, n, n);  % 生成对应稀疏矩阵

    C = P * A * P';
    d = P * b;

    x = ConjugateGradient_stu(C, d, eps);
    x = P * x;
    
end