format long
x = [0.0; 0.2; 0.4; 0.6; 0.8; 1.0];
y = [-0.1; 0.06; 0.12; 0.39; 0.60; 1.05];
n = 2;
a = PolyFit_simple(x, y, n);
% a = PolyFit(x, y, n);

disp(['拟合多项式为: y=', num2str(a(3), '%.6f'), 'x^2+' num2str(a(2), '%.6f') 'x', num2str(a(1), '%.6f') '.'])


%%% 运行上述程序后得到表达式，画图
f = @(x) 0.915179*x.^2+0.176250*x-0.070357;

x0 = 0:1e-5:1;
figure
plot(x0,f(x0),'m', x, y, 'bx');
axis([0 1 -0.2 1.2]);
legend('拟合多项式', '拟合点');
legend('boxoff');
