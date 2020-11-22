
%************************************************************************%
%  --Title: taux et redondance du codage RLE                             %
%  --TP2: Algorithmes de compression de données                          %
%************************************************************************%
%  --File: RLE_stat.m                                                    %

%************************************************************************%
%  --Description: Fonction des statistiques du codage RLE                %
%************************************************************************%


%************************************************************************%
%                             MATLAB Program                             %
%************************************************************************%

function RLE_stat(m)

m_code=RLE_enco(m);
disp('Taux de compression')
taux=8*length(m_code)/length(m)
disp('Redondance');
redondance=1-taux/8