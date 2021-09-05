function [resultado,puntos] = adaptativo(f, a, fa, b, fb, tol, Sab, m, fm)
    global iter;
    iter = iter+1;
    [lm, flm, Sac] = calculoM(f, a, m);
    [rm, frm, Scb] = calculoM(f, m, b);
    delta = (Sac + Scb - Sab)/15;
    if abs(delta) <= tol
        resultado = Sac + Scb + delta;
        puntos = [a];
        return
    else
        %llamadas 
        %suma lado izquierdo y lado derecho
        [resultadoIzq, puntosIzq] = adaptativo(f, a, fa, m, fm, tol, Sac , lm, flm);
        [resultadoDer, puntosDer] = adaptativo(f, m, fm, b, fb, tol, Scb, rm, frm);
        resultado = resultadoIzq + resultadoDer;
        puntos = [puntosIzq, puntosDer];
    end
end
