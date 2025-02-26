load A

n = size(A, 1);
q = ones(n, 1);
k = 4;
m = 3;

[Q, H] = ArnoldiIteration_stu(A, q, k);

H

norm(Q'*Q-eye(k+1))
Qk = Q(:,1:k);
norm(A*Qk-Q*H)



[mu, U] = ClassicalArnoldi_stu(A, q, m);
mu