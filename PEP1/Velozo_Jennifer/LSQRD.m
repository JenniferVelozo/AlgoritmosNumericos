function [x0,error,operaciones] = LSQRD(d,f,c,b,tol)
    operaciones = 0;
    n = length(b);
    x0 = zeros(n,1);
    beta = norm(b);
    u = b./beta;
    At_x_u = matrizxVector(c,f,d,u);
    alpha = norm(At_x_u);
    v = At_x_u./alpha;   
    delta = v;
    fi = beta;
    p = alpha;
    x1 = x0;
    operaciones = operaciones + 6 + n;
    error = 1;
    while error > tol
        A_x_v = matrizxVector(f,c,d,v);
        beta = norm(A_x_v-alpha*u);
        u = (A_x_v-alpha*u)./beta;        
        At_x_u = matrizxVector(c,f,d,u);        
        alpha = norm(At_x_u-beta*v);
        v = (At_x_u-beta*v)./alpha;
        pj = sqrt(p.^2+beta.^2);
        sj = beta./pj;
        cj = p./pj;
        o = sj*alpha;
        p =-cj*alpha;
        fi2 = cj*fi;
        fi = sj*fi;
        x0 = x0 + (fi2./pj) * delta;
        delta = v - (o./pj) * delta;
        error = norm(x0-x1);
        x1=x0;
        operaciones = operaciones + 31*n;
    end  
end
