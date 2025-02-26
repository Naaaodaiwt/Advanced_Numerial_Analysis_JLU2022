
x0 = ones(10, 1);
eps = 1e-8;

% disp('Newton法')
% x1 = Newton(@F, @dF, x0, eps);
% norm(F(x1))
% 
% B0 = dF(x0);
% 
% disp('Broyden法')
% x2 = Broyden(@F, x0, B0, eps);
% norm(F(x2))

h = 1e-5;
eps_gmres = 1e-12;
disp('JFNK法')
x3 = JacobiFreeNewtonKrylov(@F, x0, h, eps, eps_gmres);
norm(F(x3))