A = load('A4225.dat');
b = load('b4225.dat');
tol = 0.000000001;
[n,~] = size(A);

%Se obtiene la solución real del sistema de ecuaciones
Xreal = linsolve(A,b);
invReal = inv(A);


disp('Tiempo AIT')
tic
[AT, operacionesAT] = AIT(A);
tAIT = toc


%Se crea la estructura dispersa para la matriz A
[valor, fila, col] = formarVectores(A);

disp('Tiempo AID')
tic
[AD, operacionesAD] = AID(valor,fila,col,n,tol);
tAID = toc

disp('Tiempo LSQR Disperso')

tic
[solucionLSQRD,errorLSQRD,operacionesLSQRD] = LSQRD(valor,fila,col,b,tol);
tLSQRD = toc

%Errores asociados al obtener la inversa
errorInvAIT = norm(invReal - AT);
errorInvAID = norm(invReal - AD);

%Errores asociados al resolver el sistema de ecuaciones
X1 = b'*AT;
X1 = X1';
errorAT = norm(Xreal -  X1);

X2 = b'*AD;
X2 = X2';
errorAD = norm(Xreal -  X2);



