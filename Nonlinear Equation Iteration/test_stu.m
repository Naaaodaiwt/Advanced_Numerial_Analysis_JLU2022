
x0 = -1;
x1 = 1;
eps = 1e-8;

disp('二分法')
r1 = Bisection(@f1d, x0, x1, eps);
abs(f1d(r1))

disp('Newton法')
r2 = Newton1d(@f1d, @Df1d, x0, eps);
abs(f1d(r2))

disp('简化Newton法')
r3 = SimpleNewton1d(@f1d, @Df1d, x0, eps);
abs(f1d(r3))

disp('割线法')
r4 = Secant(@f1d, x0, x1, eps);
abs(f1d(r4))