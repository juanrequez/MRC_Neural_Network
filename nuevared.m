function red=nuevared(R,M,S)
%R el es número de entradas
%S el número de neuronas de la capa oculta
%M el es número de capas
red.W{1}=rand(S(1),R); %primera capa
red.b{1}=rand(S(1),1);
for i=2:M
    red.W{i}=rand(S(i),S(i-1));%capas siguientes
    red.b{i}=rand(S(i),1);
end

% red.W{1}=[-0.27;-0.41];
% red.b{1}=[-0.48; -0.13];
% red.W{2}=[0.09 -0.17];
% red.b{2}=0.48;


red.R=R;
red.M=M;
red.S=S;
    