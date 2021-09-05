addpath('integral')
addpath('interpolacion')
%----- PARTE 1 ----- 
N1 = 10;
N2 = 10^2;
N3 = 10^3;
N4 = 10^4;

a = -10;
b = 10;
X10 = a:(b-a)/N1:b;
X100 = a:(b-a)/N2:b;
X1000 = a:(b-a)/N3:b;
X10000 = a:(b-a)/N4:b;
Y10 = sin(pi*X10)./(pi*X10);
Y100 = sin(pi*X100)./(pi*X100);
Y1000 = sin(pi*X1000)./(pi*X1000);
Y10000 = sin(pi*X10000)./(pi*X10000);
S1 = find(X10 == 0);
Y10(1,S1) = 1;
S1 = find(X100 == 0);
Y100(1,S1) = 1;
S1 = find(X1000 == 0);
Y1000(1,S1) = 1;
S1 = find(X10000 == 0);
Y10000(1,S1) = 1;

%Generamos una nube de puntos para evaluar en la función
%en el intervalo [-10,10]
n = 10^5;
X = a:(b-a)/n:b;
%Se evalúan los valores de X en la función
Y = sin(pi*X)./(pi*X);

%Si X = 0, F(0) = 1
S1 = find(X == 0);
Y(1,S1) = 1;
plot(X,Y)
title("Función f(x) con N = 10^5")

[lineal10, spline10, cubic10, rmselineal10, rmsespline10, rmsecubic10] = aproximacion(X,Y,a,b,N1);
[lineal100, spline100, cubic100, rmselineal100, rmsespline100, rmsecubic100] = aproximacion(X,Y,a,b,N2);
[lineal1000, spline1000, cubic1000, rmselineal1000, rmsespline1000, rmsecubic1000] = aproximacion(X,Y,a,b,N3);
[lineal10000, spline10000, cubic10000, rmselineal10000, rmsespline10000, rmsecubic10000] = aproximacion(X,Y,a,b,N4);

% [vq11, vq21, vq31, rmse11, rmse21, rmse31] = aproximacion(X,Y,a,b,N1);
% [vq12, vq22, vq32, rmse12, rmse22, rmse32] = aproximacion(X,Y,a,b,N2);
% [vq13, vq23, vq33,rmse13, rmse23, rmse33] = aproximacion(X,Y,a,b,N3);
% [vq14, vq24, vq34, rmse14, rmse24, rmse34] = aproximacion(X,Y,a,b,N4);
figure
plot(X,Y, 'o',X,lineal10,':.')
%title("Interpolación Lineal con N = 10")

figure
plot(X,Y, 'o',X,spline10,':.')

figure
plot(X,Y, 'o',X,spline10000,':.')
%title("Interpolación con Splines con N = 10^4")

disp("Errores para N=10")
disp("Lineal: "+string(rmselineal10))
disp("Spline: "+string(rmsespline10))
disp("Cúbico: "+string(rmsecubic10))
disp(" ")
disp("Errores para N=10^2")
disp("Lineal: "+string(rmselineal100))
disp("Spline: "+string(rmsespline100))
disp("Cúbico: "+string(rmsecubic100))
disp(" ")
disp("Errores para N=10^3")
disp("Lineal: "+string(rmselineal1000))
disp("Spline: "+string(rmsespline1000))
disp("Cúbico: "+string(rmsecubic1000))
disp(" ")
disp("Errores para N=10^4")
disp("Lineal: "+string(rmselineal10000))
disp("Spline: "+string(rmsespline10000))
disp("Cúbico: "+string(rmsecubic10000))


%----- PARTE 2.a ----- 
%Se utiliza la regla de simpson 1/3, dado que el vector posee N+1
%elementos, por lo tanto hay N trazos, lo cual es un número par.
%El método de interpolación lineal es el que posee un error muy alto,
%mientras que el de Spline posee un error pequeño.

%Se obtiene la integral de la función original
integralO = simpson13(a,b,Y,length(Y));
f = @(x)sin(pi*x)./(pi*x);

%------ Lineal ------
integralLineal10 = simpson13(a,b,lineal10,length(lineal10));
integralLineal100 = simpson13(a,b,lineal100,length(lineal100));
integralLineal1000 = simpson13(a,b,lineal1000,length(lineal1000));
integralLineal10000 = simpson13(a,b,lineal10000,length(lineal10000));

%------ Spline ------
integralSpline10 = simpson13(a,b,spline10,length(spline10));
integralSpline100 = simpson13(a,b,spline100,length(spline100));
integralSpline1000 = simpson13(a,b,spline1000,length(spline1000));
integralSpline10000 = simpson13(a,b,spline10000,length(spline10000));

% %------ Integral de la función original ------
% integral10 = simpson13(a,b,Y10,length(Y10));
% integral100 = simpson13(a,b,Y100,length(Y100));
% integral1000 = simpson13(a,b,Y1000,length(Y1000));
% integral10000 = simpson13(a,b,Y10000,length(Y10000));
% 
%------ Obtención de error Lineal------
error10L = sqrt(mse(integralO - integralLineal10));
error100L = sqrt(mse(integralO  - integralLineal100));
error1000L = sqrt(mse(integralO  - integralLineal1000));
error10000L = sqrt(mse(integralO  - integralLineal10000));

%------ Obtención de error Spline------
error10S = sqrt(mse(integralO  - integralSpline10));
error100S = sqrt(mse(integralO  - integralSpline100));
error1000S = sqrt(mse(integralO  - integralSpline1000));
error10000S = sqrt(mse(integralO  - integralSpline10000));
disp(" ")
disp("Comparación entre integral original y método lineal (error)")
disp("N = 10: "+string(error10L))
disp("N = 10^2: "+string(error100L))
disp("N = 10^3: "+string(error1000L))
disp("N = 10^4: "+string(error10000L))
disp(" ")
disp("Comparación entre integral original y método spline (error)")
disp("N = 10: "+string(error10S))
disp("N = 10^2: "+string(error100S))
disp("N = 10^3: "+string(error1000S))
disp("N = 10^4: "+string(error10000S))
disp(" ")

%----- PARTE 2.b ----- 
disp("Predictor de puntos")
syms x
f = sin(pi*x)/(pi*x);
%df = diff(f,x,4) %Se obtiene la 4ta derivada de la función
df = (4*pi^2*cos(pi*X))./X.^2 - (12*pi*sin(pi*X))./X.^3 - (24*cos(pi*X))./X.^4 + (pi.^3*sin(pi*X))./X + (24*sin(pi*X))./(X.^5*pi);
%Se obtiene el punto máximo de la 4ta derivada en [a,b]
M = max(df);
%plot(df)
a = -10;
b = 10;
p = 9;
tic
NPred = predictor(a,b,M,p) %Se obtiene la cantidad de puntos
tiempoPred = toc;

%Se crea un vector con la cantidad de puntos obtenidos en el predictor
XPred = a:(b-a)/NPred:b;
YPred = sin(pi*XPred)./(pi*XPred);
S1 = find(XPred == 0);
YPred(1,S1) = 1;
figure
plot(XPred,YPred, ':.')
title("Función f(x) con N = 4448")
integralPred = simpson13(a,b,YPred,length(YPred));
rmsePred = sqrt(mse(integralO - integralPred));

%----- PARTE 2.c ----- 
global iter;
iter = 0;
tol = 10^(-9);
f = @(x) sin(pi*x)./(pi*x);
a = -10;
b = 10;
tic
fa = f(a);
fb = f(b);
[m, fm, Sab] = calculoM(f, a, b);
[resultado, puntos] = adaptativo(f, a, fa, b, fb, tol, Sab, m, fm);
puntos = [puntos,b];
tiempoAdap = toc;

YAdap = sin(pi*puntos)./(pi*puntos);
S1 = find(puntos == 0);
YAdap(1,S1) = 1;
%figure
%plot(puntos, YAdap)
figure
plot(puntos,YAdap,':.')
%title("Función f(x) con puntos del Adaptativo")

save('datos')