function voisins = chercherVoisin(point,size)
num = 0;
if point(1)+1 <= size
    num = num+1;
    voisins(:,num) = point+[1,0;];
end
if point(2)+1 <= size
    num = num+1;
    voisins(:,num) = point+[0,1;];
end
if point(2)-1 >= 1
    num = num+1;
    voisins(:,num) = point+[0,-1;];
end
if point(1)-1 >= 1
    num = num+1;
    voisins(:,num) = point+[-1,0;];
end 
end

