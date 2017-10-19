function [a44] = fluxgate_core_curve(Bs,Ur,D,M,L)
%                                          d厚度 m宽度 l 长
%Ur=60000; %磁芯材料、形状参数
%Bs=0.75;
%L=0.04;
%H=0.00002;
%HD=0.00005;
U0=4*pi*10E-7
k=4-0.732*(1-exp(-1*(5.5*D)/M));
N=((4*D*M)/(pi*L^2))*(log((k*L)/(D+M))-1);
Ut=Ur/(1+(Ur-1)*N)
a=2*Bs/pi;
b=(Ut*U0)/a;

 for i=-1000:1000;
      t(i+1001)=i/10;
      y(i+1001)=a*atan(b*i/10);
 end

 for i=0:500;
     a44.t(i+1)=i;
     a44.y(i+1)=a*atan(b*i);
 end
 plot(t,y,'r');
 title('B-H Curve'); grid;
 xlabel('Magnetic field intensity (A/m)');
 ylabel('Magnetic inducion intensity (T)');
end