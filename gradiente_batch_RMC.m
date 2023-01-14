function [er,epocas,red]=gradiente_batch_RMC(red,tiempo,datos,alpha,tol)

p=datos(1:end-1,:);
targets=datos(end,:);
[~,n]=size(p);

M=red.M;


%hacer retropropagacion gradiente batch para control por modelo de
%referencia
epoca=1;
errorepoca=1;

while and(errorepoca(end)>tol,epoca<400)
    error=zeros(1,n);
    red.acum{1}=0*red.W{1};
    red.acumb{1}=0*red.b{1};
    for m=2:M
        red.acum{m}=0*red.W{m};
        red.acumb{m}=0*red.b{m};
    end
    
    for i=1:n
        [u(i),red]=propagar(red,p(:,i));
    end
    %las salidas de la red deben ser aplicadas al modelo de simulink
    Uk=[tiempo,u'];
    
    Simout=sim('nolineal_closeloop_referencia','SrcWorkspace','current');
    Y1=Simout.get('Y1');
    U1=Simout.get('U1');
    ys=Y1.data(:,1);
  
    paux=p';
    paux=[paux(:,1) U1.data Y1.data];
    p=paux';
    for i=1:n
         error(i)=(targets(i)-ys(i))^2;
        
        red=retropropagar(red,ys(i),targets(i));
        
        red.acum{1}=red.acum{1}+red.s{1}*(red.a0)';
        red.acumb{1}=red.acumb{1}+red.s{1};
        
        for m=2:M
            red.acum{m}=red.acum{m}+red.s{m}*(red.a{m-1})';
            red.acumb{m}=red.acumb{m}+red.s{m};
            
        end
        
        
    end
    red=ajustarpesos_batch(red,alpha,n);
    errorepoca(epoca)=1/n*sum(error);
    errorepoca(epoca)
    epoca=epoca+1
    
end

epocas=epoca;
er=errorepoca(2:end);