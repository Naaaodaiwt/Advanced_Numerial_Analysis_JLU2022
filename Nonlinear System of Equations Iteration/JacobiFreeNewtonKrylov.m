function r = JacobiFreeNewtonKrylov(F, x0, h, eps, eps_gmres)
    r = x0;
    k = 0;
    while norm(F(r)) >= eps
        s = GeneralizedMinimalRES(F, r, h, eps_gmres);
        r = r + s;
        k = k + 1;
    end
    k
end