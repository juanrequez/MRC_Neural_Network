function salida=derivactivacion(arg,red,capa)

M=red.M;

if capa==M
    salida=ones(size(arg));
else
    salida=(1-arg).*arg;
end
%  salida=(1-arg).*arg;
salida=diag(salida);