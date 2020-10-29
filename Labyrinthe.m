%Solution d'un labyrinthe

%lecture de l'image
global M;
M = rgb2gray(imread("maze4.jpg"));
M = fliplr(M');
global lx ;
global ly ;
[lx,ly]= size(M);
global pas;
pas = 1/max(lx,ly);
h = 0.005;
% pour maze 1 :
% entree_x = 100*pas;
% entree_y = 902*pas;
% sortie_x = 1650*pas;
% sortie_y = 12*pas;
% pour maze 2 :
% entree_x = 10*pas;
% entree_y = 541*pas;
% sortie_x = 832*pas;
% sortie_y = 711*pas;
% pour maze 3 :
% entree_x = 10*pas;
% entree_y = 81*pas;
% sortie_x = 516*pas;
% sortie_y = 441*pas;
% pour maze 4 :
entree_x = 125*pas;
entree_y = 506*pas;
sortie_x = 384*pas;
sortie_y = 6*pas;
F = @Map;
T = fastmarching(1,entree_x,entree_y,F,h);
x = 0:h:lx*pas;
y = 0:h:ly*pas;
lengthx = length(x);
lengthy = length(y);
TT = zeros(lengthy,lengthx);
for i = 1:lengthy
    for j = 1:lengthx
        TT(i,j) = T(i,j);
    end
end
contourf(x,y,TT,150,'LineStyle','none');
hold on;
[xx,yy] = meilleurChemin(1,sortie_x,sortie_y,entree_x,entree_y,T',h);
plot(xx,yy,'k');
hold off;

function z = Map (x,y)
    global lx ;
    global ly ;
    global M ;
    global pas;
    z = 0.001;               
    if (floor(x/pas)+1<lx && floor(y/pas)+1<ly)
    if (M(floor(x/pas)+1,floor(y/pas)+1)>200)
        z = 1;
    end
    end
end
