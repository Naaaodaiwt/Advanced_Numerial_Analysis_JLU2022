format long

load A

b = ones(size(A,1), 1);
eps = 1e-10;

disp('GMRES方法:')
x1 = GeneralizedMinimalRES(A, b, eps);
error1 = norm(A*x1-b)/norm(b)

disp('三对角预处理GMRES方法:')
x2 = TridiagonalGeneralizedMinimalRES(A, b, eps);
error2 = norm(A*x2-b)/norm(b)