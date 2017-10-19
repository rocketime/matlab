M0= 4 * pi *1e-7; %��ʼ��, �������뾶��������ͼ��
I0= 5.0; Rh=1;
C0= M0/( 4* pi) * I0;
Nx= 21; Ny= 21; % �趨�۲��������
x= linspace(-Rh,Rh,Nx) ; %�趨�۲�㷶Χ������
y= linspace(-Rh,Rh,Ny) ;
Nh= 20; %�������ֶ�
T0= linspace(0,2 * pi,Nh + 1); % ����Բ�ܽǷֶ�
T1= T0(1:Nh) ;
yb= Rh * cos(T1);
zb= Rh * sin(T1); % ���û������������������yb, zb
T2= T0(2:Nh + 1);
ye= Rh * cos(T2);
ze= Rh * sin(T2); %���û������������յ�����ye, ze
dlx= 0; dly= ye - yb; dlz= ze - zb; % ���㻷��������dl���������ȷ���
xc= 0; yc=(yb + ye)/2; zc= (zb + ze)/2; %���㻷���������е�������������
for i= 1:Ny%ѭ�������������ϵ�B( x, y)ֵ
for j= 1: Nx
rx= x(j) - xc; ry= y(i) - yc; rz= 0-zc; %�۲����z= 0ƽ����
r3= sqrt( rx.^2+ ry.^2+ rz.^2).^3;
dlXr_x= dly.* rz- dlz.* ry; %�����˻�d lX r��x ��y�ķ���
dlXr_y= dlz.* rx- dlx.* rz;
Bx(i ,j) = sum( C0*dlXr_x./r3) ; %�ѻ����β����Ĵų������ۼ�
By(i, j) = sum( C0*dlXr_y./r3) ;
end
end
Bax= Bx(:,11:21) + Bx(:,1:11) ;
Bay= By(:,11:21) + By(:,1:11) ;
subplot(1,2,1);
mesh(x(11:21),y,Bax);xlabel('x');ylabel('y'); % ������B�ֲ���άͼ
subplot(1,2,2);
plot(y,Bax),grid,xlabel('y');ylabel('Bx');