function [V, Lambda] = BasicQR_stu(A, epsilon)
    k = 0;
    Ak = A;
    Q = eye(size(A,1));
    while norm(Ak-triu(Ak))>epsilon
        k = k + 1;
        [Qk,Rk] = qr(Ak);
        Q = Q * Qk;
        Ak = Rk * Qk;
    end
    [VR, Lambda] = UptriangularEigen_stu(Ak);
    V = Q * VR;
end