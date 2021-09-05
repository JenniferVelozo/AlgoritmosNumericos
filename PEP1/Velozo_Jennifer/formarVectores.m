%Crea una estructura de datos dispersos donde
%vector valor almacena los datos distintos de 0
%vector fila almacena la posición en fila del valor
%vector columna almacena la posición en columna del valor
function [valor, fila, columna] = formarVectores(A)
    [n,m] = size(A);
    valor = [];
    fila = [];
    columna = [];
    for i=1:n
       for j=1:m
          if A(i,j) ~= 0
              valor = [valor,A(i,j)];
              fila = [fila, i];
              columna = [columna, j];
          end
       end
    end
end