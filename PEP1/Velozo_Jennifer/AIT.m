%Obtiene la inversa de la matriz A utilizando el método LU
function [AT, operaciones] = AIT(A)
    [n,~] = size(A);
    % Inicialización
    U = zeros(n,n); 
    L = zeros(n,n);
    B = zeros(n,n); 
    AT = zeros(n,n);
    operaciones = 0;
    for i = 1:n
        L(i,i) = 1;
    end
    for i = 1:n
        %i
        for j = i:n
            %j
            sum = 0;
            for k = 1:i-1
                sum = sum + L(i,k)*U(k,j);
                operaciones = operaciones + 2;
            end
                U(i,j) = A(i,j)-sum;
                operaciones = operaciones + 1;
             sum = 0;
             for k = 1:i-1
                sum = sum + L(j,k)*U(k,i);
                operaciones = operaciones + 2;
             end
                L(j,i) = (A(j,i)-sum)/U(i,i);
                operaciones = operaciones + 2;
         end  
    end

    %Sustitución progresiva para resolver LB = I
    %Matriz identidad
    b = zeros(n);
    for i=1:n
        b(i,i) = 1;
    end
    for i = 1:n
        B(1,i) = b(1,i)/L(1,1);
        for k = 2:n
            sum = 0;
                for j = k-1:-1:1
                  sum = sum + L(k,j)*B(j,i);
                  operaciones = operaciones + 2;
                end
            B(k,i) = (b(k,i)- sum)/L(k,k);
            operaciones = operaciones + 2;
        end
    end
    %Sustitución regresiva para resolver U*AT = B
    for i = 1:n
          AT(n,i) = B(n,i)/U(n,n);
          for k = n-1:-1:1
            sum = 0;
            for j = k+1:n
               sum = sum + U(k,j)*AT(j,i);
               operaciones = operaciones + 2;
            end
            AT(k,i) = (B(k,i)- sum)/U(k,k);
            operaciones = operaciones + 2;
          end
    end
end