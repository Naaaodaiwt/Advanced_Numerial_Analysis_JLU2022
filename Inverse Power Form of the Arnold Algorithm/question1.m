format long
n = 100;
e = ones(n,1);
A = spdiags([-e 2*e -e], -1 : 1, n, n);  % 生成对应三对角稀疏矩阵
q = rand(n, 1);  % 这里使用 rand 来生成初始向量，效果更好
m = 3;
[lambda, U] = ClassicalArnoldi_inv(A, q, m);
disp('A的3个最小特征值分别为:');
disp(lambda);

