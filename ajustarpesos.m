function salida=ajustarpesos(red,alpha)

M=red.M;

red.W{1}=red.W{1}-alpha*red.s{1}*(red.a0)';
red.b{1}=red.b{1}-alpha*red.s{1};
for m=2:M
    red.W{m}=red.W{m}-alpha*red.s{m}*(red.a{m-1})';
    red.b{m}=red.b{m}-alpha*red.s{m};
end

salida=red;