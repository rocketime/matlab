M0= 4 * pi *1e-7; %初始化, 给定环半径、电流、图形
I0= 5.0; Rh=1;
C0= M0/( 4* pi) * I0;
Nx= 21; Ny= 21; % 设定观测点网格数
x= linspace(-Rh,Rh,Nx) ; %设定观测点范围及数组
y= linspace(-Rh,Rh,Ny) ;
Nh= 20; %电流环分段
T0= linspace(0,2 * pi,Nh + 1); % 环的圆周角分段
T1= T0(1:Nh) ;
yb= Rh * cos(T1);
zb= Rh * sin(T1); % 设置环各段向量的起点坐标yb, zb
T2= T0(2:Nh + 1);
ye= Rh * cos(T2);
ze= Rh * sin(T2); %设置环各段向量的终点坐标ye, ze
dlx= 0; dly= ye - yb; dlz= ze - zb; % 计算环各段向量dl的三个长度分量
xc= 0; yc=(yb + ye)/2; zc= (zb + ze)/2; %计算环各段向量中点的三个坐标分量
for i= 1:Ny%循环计算各网格点上的B( x, y)值
for j= 1: Nx
rx= x(j) - xc; ry= y(i) - yc; rz= 0-zc; %观测点在z= 0平面上
r3= sqrt( rx.^2+ ry.^2+ rz.^2).^3;
dlXr_x= dly.* rz- dlz.* ry; %计算叉乘积d lX r的x 和y的分量
dlXr_y= dlz.* rx- dlx.* rz;
Bx(i ,j) = sum( C0*dlXr_x./r3) ; %把环各段产生的磁场分量累加
By(i, j) = sum( C0*dlXr_y./r3) ;
end
end
Bax= Bx(:,11:21) + Bx(:,1:11) ;
Bay= By(:,11:21) + By(:,1:11) ;
subplot(1,2,1);
mesh(x(11:21),y,Bax);xlabel('x');ylabel('y'); % 画出其B分布三维图
subplot(1,2,2);
plot(y,Bax),grid,xlabel('y');ylabel('Bx');