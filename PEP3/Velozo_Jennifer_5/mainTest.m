addpath('Parte I')
clear
clc
%Se define la función original
a = -5;
b = 5;
N = 10000;
X = a:(b-a)/N:b;
Y = sin(pi*X)./(pi*X);
S1 = find(X == 0);
Y(1,S1) = 1;

[x1,y1,resultadoLineal, tiempoLineal] = calcularIntegral(a,b,X,Y,N,'lineal');
[x2,y2,resultadoAditivo, tiempoAditivo] = calcularIntegral(a,b,X,Y,N,'aditivo');
[x3,y3,resultadoMultiplicativo, tiempoMultiplicativo] = calcularIntegral(a,b,X,Y,N,'multiplicativo');

%Se obtiene el valor real de la integral en el intervalo [a, b]
fun = @(x) sin(pi*x)./(pi*x);
qI = integral(fun, a, b);

%Se obtiene la integral utilizando el método de Simpson 1/3
tic
integralSimpson = simpson13(a,b,Y,N);
tiempoSimpson = toc;
rmseSimpson = sqrt(mse(qI - integralSimpson));

%Generador congruencial lineal
rmseLineal = sqrt(mse(qI - resultadoLineal));

%Generador congruencial aditivo
rmseAditivo = sqrt(mse(qI - resultadoAditivo));

%Generador congruencial multiplicativo
rmseMultiplicativo = sqrt(mse(qI - resultadoMultiplicativo));
