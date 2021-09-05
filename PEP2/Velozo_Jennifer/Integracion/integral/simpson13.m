function integral = simpson13(a,b,Y,n)
    suma1 = 0;
    suma2 = 0;
    for i=2:n-1
        if (mod(i,2) == 0)
            suma1 = suma1 + Y(i);
        else
            suma2 = suma2 + Y(i);
        end
    end
    integral = (b-a) * ((Y(1) + 4*suma1 + 2*suma2 + Y(n))/(3*n));
end
