function [m, fm, Sab] = calculoM(f, a, b)
    if a == 0  
        fa = 1;
    else
        fa = f(a);
    end
    if b == 0  
        fb = 1;
    else
        fb = f(b);
    end
    m = (a + b) / 2;
    if m == 0  
        fm = 1;
    else
        fm = f(m);
    end
    Sab = ((b -a)/6) * (fa + fb + 4*fm);
end