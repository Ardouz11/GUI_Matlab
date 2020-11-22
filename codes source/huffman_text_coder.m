
%************************************************************************%
%  --Title: codage huffman                                               %
%  --TP2: Algorithmes de compression de données                          %
%************************************************************************%
%  --File: Entropy.m                                                     %
                                          
%************************************************************************%
%  --Description: Fonction qui code un texte avec huffman                %
%************************************************************************%


%************************************************************************%
%                             MATLAB Program                             %
%************************************************************************%


function huffman_text_coder(text,x)
fid=fopen(text,'r');%ouverture du fichier
msg=fread(fid,'*char'); %lecture 
fclose(fid);%fermeture du fichier

for i=1:length(msg)     % Boucle pour convertir le les
    X(i)=uint8(msg(i)); % caracteres en code decimal correspondant
end 
[F,C]=imhist(X); % permey de definir les symboles C et leurs frequences C
y=find(F~=0);%on affecte a y la position des frequences existantes (~=0)
L=length(X); % calcul de la longueur du message
P=F(y)/L; % calcul des probabilités
for i=1:length(y)
   symbols(i)=C(y(i));% Boucle qui affecte les symboles
end

disp('Voici le dictionnaire.')
dict=huffmandict(symbols,P)
disp('Voici le code du messsage')
hcode=huffmanenco(X,dict)

if x==1 
    disp('Voici le décodage')
    dhcode=char(huffmandeco(hcode,dict))
end