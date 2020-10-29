function t = calculerT(i,j,size,T,FF,h)
if i-1 < 1
    di = T(i+1,j);
else if i+1 > size
        di = T(i-1,j);
    else di = min(T(i-1,j),T(i+1,j));
    end
end
if j-1 < 1
    dj = T(i,j+1);
else if j+1 > size
        dj = T(i,j-1);
    else dj = min(T(i,j-1),T(i,j+1));
    end
end

      
if abs(di-dj) >= h/FF(i,j)
      t = min(di,dj) + h/FF(i,j);
else
      t = (di+dj+sqrt(2*h^2/FF(i,j)^2-2*(di-dj)^2))/2;
end
end


