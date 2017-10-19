clear
 
　　rh=2．5；i0=10；mu0=4*pi*1e-7；n=1  
 
　　m=（n+1）/2
 
　　xmax=6；ymax=6；ngrid=40；
 
　　cx（1：ngrid，1：ngrid）=zeros；cy（1：ngrid，1：ngrid）=zeros； 
 
　　c0=mu0/4*pi；
 
　　nh=20；
 
　　ngrid1=nh+1；
 
　　xmax1=0；
 
　　ymax1=2*pi；
 
　　xplot=linspace（-xmax，ymax，ngrid）；  yplot=linspace（-xmax，ymax，ngrid）；
 
　　theta0=linspace（0，2*pi，21）；
 
　　theta1=theta0（1：nh）；
 
　　y1=rh*cos（theta1）；
 
　　z1=rh*sin（theta1）；
 
　　theta2=theta0（2：nh+1）；
 
　　y2=rh*cos（theta2）；
 
　　z2=rh*sin（theta2）；
 
　　dlx=0；dly=y2-y1；dlz=z2-z1；
 
　　xc=[-（n-1）/2：2：（n-1）/2]；yc=（y2+y1）/2；zc=（z2+z1）/2；
 
　　for k=1：m
 
　　for i=1：ngrid
 
　　for j=1：ngrid
 
　　 rx=xplot（j）-xc（k）； 
 
　　ry=yplot（i）-yc；   
 
　　 rz=0-zc；            
 
　　        r3=sqrt（rx．^2+ry．^2+rz．^2）．^3；       
 
　　        dlxr_x=dly．*rz-dlz．*ry； 
 
　　 dlxr_y=dlz．*rx-dlx．*rz；
 
　　        bx（i，j）=sum（c0*i0*dlxr_x．/r3）；      
 
　　        by（i，j）=sum（c0*i0*dlxr_y．/r3）；
 
　　  end
 
　　end
 
　　  cx（1：ngrid，1：ngrid）=cx（1：ngrid，1：ngrid）+bx（1：ngrid，1：ngrid）；
 
　　  cy（1：ngrid，1：ngrid）=cy（1：ngrid，1：ngrid）+by（1：ngrid，1：ngrid）；
 
　　end
 
　　quiver（xplot，yplot，cx，cy）； 
 
　　hold on
 
　　plot（xc，rh，'r*'） 
 
　　hold on
 
　　plot（xc，-rh，'r*'）