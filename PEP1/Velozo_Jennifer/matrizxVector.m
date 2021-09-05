function resultado = matrizxVector(fila,columna,valor,vector)
    stop = size(fila);
    stop = stop(2);
    n = size(vector);
    n = n(1);
    resultado = zeros(n,1);
    for k=1:stop
        pos = fila(k);
        i = columna(k);
        sum = valor(k)*vector(i);
        resultado(pos) = resultado(pos)+sum;
    end
end

