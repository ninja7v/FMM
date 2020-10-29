function [xx,yy] = meilleurChemin(borne,DestinationX,DestinationY,departX,departY,T,h)
xAct = DestinationX;
yAct = DestinationY;
size = floor(borne/h)+1;
xx = [xAct];
yy = [yAct];
Fx= zeros(size);
Fx(1,:)     = (T(2,:) - T(1,:))/h;
Fx(2:size-1,:) = (T(3:size,:) - T(1:size-2,:))/2/h;
Fx(size,:)     = (T(size,:) - T(size-1,:))/h;

Fy= zeros(size);
Fy(:,1)     = (T(:,2) - T(:,1))/h;
Fy(:,2:size-1) = (T(:,3:size) - T(:,1:size-2))/2/h;
Fy(:,size)     = (T(:,size) - T(:,size-1))/h;

i=0;
while (((xAct-departX)^2 + (yAct-departY)^2)> h*h/4 && i<=100000)
    i = i+1;
    [x,y]   = interpolation(Fx,Fy,h,xAct,yAct);
    xAct  = xAct - h*x;
    yAct =  yAct - h*y;
    xx = [xx;xAct];
    yy = [yy;yAct];
end
end

