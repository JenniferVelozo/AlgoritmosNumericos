function [vq1, vq2, vq3, rmse1, rmse2, rmse3] = aproximacion(X,Y,a,b,N)

    %Si ocupo la misma cantidad de puntos es como un truco
    %porque estoy mapeando en lo que ya sé
    %N = 10;
    xAjuste = a:(b-a)/N:b; %puntos para interpolar

    v = sin(pi*xAjuste)./(pi*xAjuste);
    S1 = find(xAjuste == 0);
    v(1,S1) = 1;

    % Linear
    %figure
    vq1 = interp1(xAjuste,v,X,'linear'); %con xAjuste se interpola, y con xTest se construye la aproximación
    rmse1 = sqrt(mse(Y - vq1));%resta entre f(x) y el polinomio de interpolación
    %plot(xAjuste,v,'o',xTest,vq1,':.');

    % Spline
    %figure
    vq2 = interp1(xAjuste,v,X,'spline'); %con xAjuste se interpola, y con xTest se construye la aproximación
    rmse2 = sqrt(mse(Y - vq2)); %resta entre f(x) y el polinomio de interpolación
    %plot(xAjuste,v,'o',xTest,vq2,':.');

    % Cúbica
    %figure
    vq3 = interp1(xAjuste,v,X,'cubic'); %con xAjuste se interpola, y con xTest se construye la aproximación
    rmse3 = sqrt(mse(Y - vq3)); %resta entre f(x) y el polinomio de interpolación
    %plot(xAjuste,v,'o',xTest,vq3,':.');
end