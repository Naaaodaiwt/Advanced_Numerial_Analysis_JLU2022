format long
N = 10000;  % 本题中步长的选取会影响结果的精确性
% 为保证结果达到所需精度，可以不断增大步长，直至所需精度位数前的数字不再改变
h = 2 / N;  % 确定步长
e = ones(N - 1, 1);
x = zeros(N + 1, 1);
for i = 1 : N + 1
    x(i) = -1 + 2 * (i - 1) / N;
end

A = spdiags([-1/(h^2)*e 2/(h^2)*e -1/(h^2)*e], -1:1, N-1, N-1);

for i = 2 : N
    A(i-1, i-1) = A(i-1, i-1) + cos(x(i));
end

q = rand(N-1, 1);
m = 3;
[lambda, U] = ClassicalArnoldi_inv(A, q, m);  % 反幂法求解最小特征值
disp('最小的3个特征值分别为:');
disp(lambda);