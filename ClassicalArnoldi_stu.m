function [mu, U] = ClassicalArnoldi_stu(A, q, m)

q = q / norm(q);
eps = 1;
k = m;

while eps > 1e-6
    I = eye(k);
    ek = I(:, k);
    [Q, H] = ArnoldiIteration_stu(A, q, k);
    Hk = H(1:k,:);
    [V, Lambda] = BasicQR_stu(Hk, eps);
    Q = Q(:,1:k);
    U = Q * V;
    for j = 1 : m
        eps = norm(H(k+1, k)) * norm(ek' * V(:,j));
        if eps > 1e-6
            break;
        end
    end
    k = k + 1;
end
mu = Lambda(1:3);
end