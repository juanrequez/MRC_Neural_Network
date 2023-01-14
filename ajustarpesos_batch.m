function salida=ajustarpesos_batch(red,alpha,n)

M=red.M;

red.W{1}=red.W{1}-alpha/n*red.acum{1};
red.b{1}=red.b{1}-alpha/n*red.acumb{1};
for m=2:M
    red.W{m}=red.W{m}-alpha/n*red.acum{m};
    red.b{m}=red.b{m}-alpha/n*red.acumb{m};
end

salida=red;