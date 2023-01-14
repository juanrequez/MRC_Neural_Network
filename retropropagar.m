function salida=retropropagar(red,a,targets)

M=red.M;

red.s{M}=-2*derivactivacion(red.a{M},red,M)*(targets-a);

for m=M-1:-1:1
    red.s{m}=derivactivacion(red.a{m},red,m)*(red.W{m+1})'*red.s{m+1};
end

salida=red;