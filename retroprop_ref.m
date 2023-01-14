function salida=retroprop_ref(red,a,targets,error)

M=red.M;

red.s{M}=-2*derivactivacion(red.a{M},red,M)*(error);

for m=M-1:1
    red.s{m}=derivactivacion(red.a{m},red,m)*(red.W{m+1})'*red.s{m+1};
end

red.sentrada=red.W{1}'*red.s{1};

salida=red;