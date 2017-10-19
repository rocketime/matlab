% (单位m) r=0.04 r1=3.4e-2 r2=3.67e-2 r3=3.2e-2 r4=2.4e-2
clear
r0=input('中心线圈半径 r0='); 
t=input('单侧分段数（不含中心） n='); 
d=r0/(t+1);m=2*t+1;
r(1:m)=zeros;
r(1,t+1)=r0;
for i=1:t 
   r(1,i+t+1)=sqrt(r0^2-(i*d)^2)
   r(1,t+1-i)=r(1,i+t+1)
end

rh=0.1;i0=5;mu0=4*pi*1e-7; 
%d=0.008;
xmax=0.2;ymax=0.2;ngrid=41;
cx(1:ngrid,1:ngrid)=zeros;cy(1:ngrid,1:ngrid)=zeros; 
c0=mu0/4*pi;
nh=20;
ngrid1=nh+1;
xmax1=0;
ymax1=2*pi;
xplot=linspace(-xmax,ymax,ngrid);  yplot=linspace(-xmax,ymax,ngrid);
theta0=linspace(0,2*pi,21);
theta1=theta0(1:nh);
theta2=theta0(2:nh+1);
y1(m,nh)=zeros;z1(m,nh)=zeros;y2(m,nh)=zeros;z2(m,nh)=zeros;
yc(m,nh)=zeros;zc(m,nh)=zeros;
xc=(-(m-1)*d/2:d:(m-1)*d/2);
for z=1:m
    y1(z:z,:)=r(1,z)*cos(theta1);
    z1(z:z,:)=r(1,z)*sin(theta1);
    y2(z:z,:)=r(1,z)*cos(theta2);
    z2(z:z,:)=r(1,z)*sin(theta2);
%y1=rh*cos(theta1);
%z1=rh*sin(theta1);

y2=rh*cos(theta2);
z2=rh*sin(theta2);
dlx=0;dly=y2-y1;dlz=z2-z1;
yc=(y2+y1)/2;zc=(z2+z1)/2;
end
for k=1:m
for i=1:ngrid
for j=1:ngrid
    rx=xplot(j)-xc(k); 
    ry=yplot(i)-yc;   
    rz=0-zc;            
    r3=sqrt(rx.^2+ry.^2+rz.^2).^3;       
    dlxr_x=dly.*rz-dlz.*ry; 
    dlxr_y=dlz.*rx-dlx.*rz;
    bx(i,j)=sum(c0*i0*dlxr_x./r3);
    by(i,j)=sum(c0*i0*dlxr_y./r3);
    end
end
  cx(1:ngrid,1:ngrid)=cx(1:ngrid,1:ngrid)+bx(1:ngrid,1:ngrid);
  cy(1:ngrid,1:ngrid)=cy(1:ngrid,1:ngrid)+by(1:ngrid,1:ngrid);
end
quiver(xplot,yplot,cx,cy); 
hold on
plot(xc,rh,'r.') 
hold on
plot(xc,-rh,'rx')