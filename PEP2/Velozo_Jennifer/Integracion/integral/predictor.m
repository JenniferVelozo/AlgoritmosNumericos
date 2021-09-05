function n = predictor(a,b,N,p)
    %Se utiliza la fórmula vista en clases 
    % Error = h^4 *f''''(Xn - X0)/180
    %Donde se despeja el valor n, recordando que h = (a-b)/n
    tol = 10^(-p);
    L = abs(b-a); 
    n = ceil(L*sqrt(sqrt(L*N/180/tol)));
    if mod(n, 2) == 1
        n = n + 1; 
    end
end