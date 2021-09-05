function [matrizIdentidad] = mIdentidad(n)
    matrizIdentidad = zeros(n);
    for i=1:n
        matrizIdentidad(i,i) = 1;
    end
end