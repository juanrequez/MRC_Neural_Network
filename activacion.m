function salida=activacion(arg,red,capa)

M=red.M;

if capa==M
    salida=arg;
else
    salida=1./(1+exp(-arg));
end

% salida=1./(1+exp(-arg));
% 
% 
% salida(salida>0.9)=1;
% salida(salida<0.1)=0;