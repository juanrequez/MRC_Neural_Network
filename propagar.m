function [salida,salidared]=propagar(red,p)

R=red.R;
M=red.M;
S=red.S;

red.a0=p;
red.a{1}=activacion(red.W{1}*red.a0+red.b{1},red,1);
for m=1:M-1
    red.a{m+1}=activacion(red.W{m+1}*red.a{m}+red.b{m+1},red,m+1);
end
salida=red.a{M};
salidared=red;