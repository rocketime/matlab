clear,close all 
r0=input('������Ȧ�뾶 r0='); 
t=input('����ֶ������������ģ� n='); 
n0=input('������Ȧ���� n0=');
d=r0/(t+1);
r(1:2*t+1)=zeros; n(1:2*t+1)=zeros;
r(1,t+1)=r0; n(1,t+1)=n0;
for i=1:t 
   r(1,i+t+1)=sqrt(r0^2-(i*d)^2)
   r(1,t+1-i)=r(1,i+t+1)
end
m=n0/r(1,2*t+1);
for i=1:t
    n(1,i+t+1)=r(2*t+1-i)*m
end