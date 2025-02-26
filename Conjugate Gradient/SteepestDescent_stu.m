function x = SteepestDescent_stu(A, b, eps)
    k = 0;
    x = 0;
    r = b;

    while norm(r)^2/norm(b)^2 >= eps
        alpha = (r' * r)/((A * r)' * r);
        x = x + alpha * r;
        r = r - alpha * A * r;
        k = k + 1;
    end
    k
end