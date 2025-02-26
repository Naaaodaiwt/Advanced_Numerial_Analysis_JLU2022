load A

b = ones(size(A,1), 1);
eps = 1e-10;

disp('最速下降法:')
x = SteepestDescent_stu(A, b, eps);
error1 = norm(A*x-b)/norm(b)

disp('共轭梯度法:')
x = ConjugateGradient_stu(A, b, eps);
error2 = norm(A*x-b)/norm(b)

disp('对角预处理:')
x1 = DiagnoalPrecondition_stu(A, b, eps);
error3 = norm(A*x1-b)/norm(b)

disp('不完全Cholesky分解预处理:')
x2 = CholeskyPrecondition_stu(A, b, eps);
error4 = norm(A*x2-b)/norm(b)