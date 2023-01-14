%crear e inicializar la red neuronal

%% 
clear
clc
close all

%modificar 
sim('nolineal_closeloop_referencia_yr')
sim('nolineal_closeloop_referencia')


%generaci�n de los datos acomodados en filas, cada fila es una variable, la
%ultima fila es la salida
x=[RREF.data U1.data Y1.data]; %corregir U1.data y Y1.data
[nulo,entradasu]=size(x);
y=YREF.data;
salida=y;
datos=[x'; salida'];
tiempo=U1.Time;

%creaci�n de la red neuronal
%n�mero de entradas
R=entradasu;
%n�mero de capas 
M=2; %1 capa oculta y una de salida
%n�mero de neuronas
S=[100 1]; %dos neuronas en la capa oculta y una en la de salida
%crear la red neuronal
red=nuevared(R,M,S);

%raz�n de entrenamiento
alpha=0.001;
tol=1e-6;

%hacer retropropagacion gradiente en batch
[errorepoca,epocas,red]=gradiente_batch_RMC(red,tiempo,datos,alpha,tol);

%graficar
figure
semilogy(errorepoca,'k')
xlabel('�poca')
ylabel('error cuadr�tico')
figure
loglog(errorepoca,'k')
xlabel('�poca')
ylabel('error cuadr�tico')

p=datos(1:end-1,:);
targets=datos(end,:);
[~,n]=size(p);
for i=1:n
        [uest(i),red]=propagar(red,p(:,i));
end
Uk=[tiempo uest'];
sim('nolineal_closeloop_referencia')
yest=Y1.data(:,1);
figure
plot(tiempo,salida,'k',tiempo,yest,'k-v')
xlabel('tiempo')
ylabel('Presi�n normalizada')
legend('modelo de referencia','sistema de control neuronal')

