
%************************************************************************%
%  --Title: calcul du taux de compression avec huffman                   %
%  --TP2: Algorithmes de compression de données                          %
%************************************************************************%
%  --File: huffman_taux_comp.m                                           %
%************************************************************************%
%  --Description:Fonction qui calcule le taux de compression avec huffman%
%                et qui prend en arguments le message et le dictionnaire %
%************************************************************************%


%************************************************************************%
%                             MATLAB Program                             %
%************************************************************************%

function y=huffman_taux_comp(x,dict)

code=huffmanenco(x,dict);
k=length(code);
n=length(x);
y=k/n;
