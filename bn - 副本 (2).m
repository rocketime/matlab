% (单位：为国际单位)
clear,close all
r0=input('中心线圈半径 r0='); 
t=input('单侧线圈个数（不含中心） t='); 
i0=input('电流 i0=');
d=r0/(t+1);m=2*t+1;mu0=4*pi*1e-7; 
for q=1:m
    disp(['线圈匝数，位置(自左向右)',num2str(q)]);
    n(1,q)=input('匝数=');
end    
r(1:m)=zeros;
r(1,t+1)=r0;
for i=1:t 
   r(1,i+t+1)=sqrt(r0^2-(i*d)^2);
   r(1,t+1-i)=r(1,i+t+1);
end

%rh=0.1;
%d=0.008;
xmax=0.06;ymax=0.06;ngrid=41;
cx(1:ngrid,1:ngrid)=zeros;cy(1:ngrid,1:ngrid)=zeros; 
c0=i0*mu0/4*pi;
nh=20;
ngrid1=nh+1;
xmax1=0;
ymax1=2*pi;
xplot=linspace(-xmax,ymax,ngrid);  yplot=linspace(-xmax,ymax,ngrid);
theta0=linspace(0,2*pi,21);
theta1=theta0(1:nh);
theta2=theta0(2:nh+1);
y1(m,nh)=zeros;z1(m,nh)=zeros;y2(m,nh)=zeros;z2(m,nh)=zeros;
yc(m,nh)=zeros;zc(m,nh)=zeros;dly(m,nh)=zeros;dlz(m,nh)=zeros;
xc=(-(m-1)*d/2:d:(m-1)*d/2);dlx=0;
for z=1:m
    y1(z:z,:)=r(1,z)*cos(theta1);
    z1(z:z,:)=r(1,z)*sin(theta1);
    y2(z:z,:)=r(1,z)*cos(theta2);
    z2(z:z,:)=r(1,z)*sin(theta2);
%y1=rh*cos(theta1);
%z1=rh*sin(theta1);
%y2=rh*cos(theta2);
%z2=rh*sin(theta2);
    dly(z:z,:)=y2(z:z,:)-y1(z:z,:);
    dlz(z:z,:)=z2(z:z,:)-z1(z:z,:);
%dly=y2-y1;dlz=z2-z1;
    yc(z:z,:)=(y2(z:z,:)+y1(z:z,:))/2;
    zc(z:z,:)=(z2(z:z,:)+z1(z:z,:))/2;
%yc=(y2+y1)/2;zc=(z2+z1)/2;
end
for k=1:m
for i=1:ngrid
for j=1:ngrid
    rx=xplot(j)-xc(k); 
    ry=yplot(i)-yc(k:k,:);   
    rz=0-zc(k:k,:);            
    r3=sqrt(rx.^2+ry.^2+rz.^2).^3;       
    dlxr_x=dly(k:k,:).*rz-dlz(k:k,:).*ry; 
    dlxr_y=dlz(k:k,:).*rx-dlx.*rz;
    bx(i,j)=sum(c0*n(1,k)*dlxr_x./r3);
    by(i,j)=sum(c0*n(1,k)*dlxr_y./r3);
    end
end
  cx(1:ngrid,1:ngrid)=cx(1:ngrid,1:ngrid)+bx(1:ngrid,1:ngrid);
  cy(1:ngrid,1:ngrid)=cy(1:ngrid,1:ngrid)+by(1:ngrid,1:ngrid);
end
quiver(xplot,yplot,cx,cy); 
hold on
plot(xc,r,'r.') 
hold on
plot(xc,-r,'rx')