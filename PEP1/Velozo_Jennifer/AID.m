function [AD, operaciones] = AID(V,F,C,n,tol)
    operaciones = 0;
    identidad = mIdentidad(n);
    AD = [];
    vectorCol = [];
    for j=1:n
        %j
        vectorCol = identidad(:,j);
        %tic
        [solucion,error,operacionesDisp] = LSQRD(V,F,C,vectorCol,tol);
        %tiempoIteracion = toc 
        %operaciones
        operaciones = operaciones + operacionesDisp;
        AD = [AD, solucion];
    end
end