function [VR, Lambda] = UptriangularEigen_stu(R)

n = size(R, 1);
VR = zeros(n);
Lambda = diag(R);

for i = n:-1:1
    fi = Lambda(i) * eye(n) - R;
    for j = i:-1:1
        if j == i
            VR(j,i) = 1;
        else
            temp = 0;
            for k = n:-1:j+1
                temp = temp + fi(j,k) * VR(k,i);
            end
                VR(j,i) = -temp / fi(j,j);
        end
    end
    VR(:,i) = VR(:,i) / norm(VR(:,i));
end