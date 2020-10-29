function [dTx,dTy]=interpolation(Fx,Fy,h,xAct,yAct)
    xPost = floor(xAct/h)+1;
    yPost = floor(yAct/h)+1;
    dx = xAct - xPost*h + h;
    dy = yAct - yPost*h + h;

    dTx1 = Fx(xPost,yPost) * (h-dx)/h + Fx(xPost+1,yPost) * dx/h;
    dTx2 = Fx(xPost,yPost+1)*(h-dx)/h + Fx(xPost+1,yPost+1)*dx/h;

    dTy1 = Fy(xPost,yPost) * (h-dx)/h + Fy(xPost+1,yPost) * dx/h;
    dTy2 = Fy(xPost,yPost+1)*(h-dx)/h + Fy(xPost+1,yPost+1)*dx/h;

    dTx = dTx1 * (h-dy)/h + dTx2 * dy/h;
    dTy = dTy1 * (h-dy)/h + dTy2 * dy/h;

    norme = (dTx^2 + dTy^2)^0.5;
    dTx= dTx/norme;
    dTy= dTy/norme;