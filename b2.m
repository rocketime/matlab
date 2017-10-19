clear,close all 
Rh=input('°ë¾¶Rh='); 
I0=input('µçÁ÷I0=');
n=input('ÔÑÊýn=');
mu0=4*pi*exp(-7); 
NGx=51;NGy=51;C0=n*mu0*I0/(4*pi); 
x=linspace(-0.06, 0.06, 51); 
y=x; Nh=50;            
 
      theta0=linspace(0, 2*pi, Nh+1);   
      theta1=theta0(1: Nh);              
      x1=Rh*cos(theta1);     
      z1=Rh*sin(theta1);  
      theta2=theta0(2: Nh+1);  
      x2=Rh*cos(theta2);    
      z2=Rh*sin(theta2);   
      dly=0;dlx=x2-x1;dlz=z2-z1;     
      yc=0;xc=(x2+x1)/2;zc=(z2+z1)/2;  
for i=1:NGy 
  
for j=1:NGx        
        rx=x(j)-xc;ry=y(i)-yc; rz=0-zc; 
        r3=sqrt(rx.^2+ry.^2+rz.^2).^3;  
        dlXr_x=dly.*rz-dlz.*ry; 
        dlXr_y=dlz.*rx-dlx.*rz;     
        Bx(i,j)=sum(C0*dlXr_x./r3);     
     
By(i,j)=sum(C0*dlXr_y./r3);   
   end 
  end 
 % clf;quiver(x, y, Bx, By);

