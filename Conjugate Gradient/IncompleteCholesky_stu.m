function L = IncompleteCholesky_stu(A)
n = size(A, 1);
L = sparse(n, n);

for j = 1 : n 
    for k = 1 : j - 1
        L(j, j) = L(j, j) - (L(j, k) ^ 2);
    end
    L(j, j) = sqrt(A(j, j) + L(j, j));
    
    for i = j + 1 : n
        if A(i, j) ~= 0    
            for k = 1 : j - 1
                L(i, j) = L(i, j) - L(i, k) * L(j, k);
            end
            L(i, j) = (A(i, j) + L(i, j)) / L(j, j);
        end 
    end
end