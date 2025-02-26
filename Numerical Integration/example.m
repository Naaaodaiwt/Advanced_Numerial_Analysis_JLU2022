format long
a = 0;
b = pi / 2;
n1 = 10;
n2 = 1000;
m = 1000;
G_exact1 = 1;
G1 = CompGLQuad(@f1, a, b, n1);
disp('f1的Gauss积分, n=10时的积分值为');
disp(G1);
disp('error1=');
disp(abs(G1 - G_exact1));

G_exact2 = (exp(pi/2)-1)/(10^6+1);
G2_1 = CompGLQuad(@f2_1, a, b, n1);
disp('f2的Gauss积分, n=10时的积分值为');
disp(G2_1);
disp('error2=');
disp(abs(G2_1 - G_exact2));

G2_2 = CompGLQuad(@f2_1, a, b, n2);
disp('f2的Gauss积分, n=1000时的积分值为');
disp(G2_2);
disp('error3=');
disp(abs(G2_2 - G_exact2));

G2_3 = QuadFilon(@f2, @df2, a, b, m, n1);
disp('f2的Filon积分, n=10时的积分值为');
disp(G2_3);
disp('error4=');
disp(abs(G2_3 - G_exact2));
