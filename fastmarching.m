function T = fastmarching(borne,x,y,F,h)
size = floor(borne/h) + 1;
departX = floor(x/h)+1;
departY = floor(y/h)+1;
T = ones(size)*inf;
accepted = -ones(size);
for i =1:size
    for j = 1:size
        FF(i,j) = F(h*(j-1),h*(i-1));
    end
end
T(departY,departX) = 0;
accepted(departY,departX) = 1;
voisins = chercherVoisin([departY,departX],size);
for v = voisins
    accepted(v(1),v(2)) = 0;
    T(v(1),v(2))=h/FF(v(1),v(2));
end
while 1
    NB = find(accepted==0);
    if isempty(NB)
        break;
    end
    [tn,post] = min(T(NB));
    tnPost = NB(post);
    accepted(tnPost) = 1;
    [nouveauPoint(:,1),nouveauPoint(:,2)] = ind2sub(size,tnPost);
    voisins = chercherVoisin([nouveauPoint(1),nouveauPoint(2)],size);
    for v = voisins
        if accepted(v(1),v(2)) == -1
            accepted(v(1),v(2)) = 0;
            T(v(1),v(2)) = calculerT(v(1),v(2),size,T,FF,h);
        end
    end
end
end
