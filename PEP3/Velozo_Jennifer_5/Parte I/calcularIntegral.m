function [x1,y1,resultado, tiempoFinal] = calcularIntegral(a,b,X,Y,N,tipo)
    %Se obtiene el valor mínimo y máximo de la función
    minY = min(Y);
    maxY = max(Y);
    
    %Condiciones iniciales
%     multiplicadorX = 13;
%     multiplicadorY = 45;
% 
%     incrementoX = 31;
%     incrementoY = 871;
% 
%     semillaX = 5;
%     semillaY = 13;

    %Condiciones iniciales
    multiplicadorX = 13;
    multiplicadorY = 45;
 
    incrementoX = 17;
    incrementoY = 871;
 
    semillaX = 5;
    semillaY = 71;

    
    
    if (strcmp(tipo,'lineal')==1)
        [x1, tiempoX] = congruencialLineal(multiplicadorX,incrementoX,N,semillaX,a,b);
        [y1, tiempoY] = congruencialLineal(multiplicadorY,incrementoY,N,semillaY,minY,maxY);
    end
    if (strcmp(tipo,'aditivo')==1)
        [x1, tiempoX] = congruencialAditivo(multiplicadorX,incrementoX,N,semillaX,a,b);
        [y1, tiempoY] = congruencialAditivo(multiplicadorY,incrementoY,N,semillaY,minY,maxY);
    end
    if (strcmp(tipo,'multiplicativo')==1)
        [x1, tiempoX] = congruencialMulti(multiplicadorX,incrementoX,N,semillaX,a,b);
        [y1, tiempoY] = congruencialMulti(multiplicadorY,incrementoY,N,semillaY,minY,maxY);
    end
    
    tic
    %Para obtener los puntos bajo la curva
    under = y1 < sin(pi*x1)./(pi*x1);

    %Se genera un vector con y = 0
    ceroAux = zeros(N,1);

    %Se obtiene la cantidad de puntos que están bajo la curva, pero 
    %sobre el eje X
    under = y1 < sin(pi*x1)./(pi*x1);
    underX = y1 > ceroAux;
    underFinal = under & underX;

    %Se obtiene la cantidad de puntos que está sobre la curva, pero 
    %bajo el eje X
    under2 = y1 > sin(pi*x1)./(pi*x1);
    underX2 = y1 < ceroAux;
    underFinal2 = under2 & underX2;


    %Se obtiene la cantidad de puntos totales bajo la curva
    cant1 = 0;
    cant2 = 0;
    for i=1:N
        if (underFinal(i) == 1)
            cant1 = cant1 + 1;
        end
        if (underFinal2(i) == 1)
            cant2 = cant2 +1;
        end
    end
    
    cantFinal = cant1 - cant2;
    
    %Se obtiene el valor de la integral
    resultado = (b - a)*maxY*(cantFinal/N);
    tiempo = toc;
    
    tiempoFinal = tiempo + tiempoX + tiempoY;
    figure
    plot(x1, 0,'k.'); %Para crear una línea en Y = 0
    hold on;
    plot(X,Y); %Se grafica la función original
    hold on;
    plot(x1,y1,'k.');
    hold on;
    plot(x1(underFinal),y1(underFinal),'g.');
    hold on;
    plot(x1(underFinal2),y1(underFinal2),'g.');
end 