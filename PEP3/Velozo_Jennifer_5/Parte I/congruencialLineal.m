%a es el factor de multiplicacion
%c es el factor aditivo y es primo
%n es el numero de datos a generar 
%s es la semilla o valor de inicio, que se sugiere sea impar
function [r, tiempo] = congruencialLineal(a,c,n,s,inf,sup)
    tic
    i = 1;
    while n > 2^i
        i = i + 1;
    end
    m = 2^i;
    for I=1:n
        u = a*s+c;
        x(I) = mod(u,m);
        r(I) = inf + (sup-inf)*(x(I)/(m - 1));
        s = x(I);
    end
    r = r';
    tiempo = toc;
end