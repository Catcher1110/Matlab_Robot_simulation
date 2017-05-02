function rotate_point_plot3(a,b,c,xt,yt,zt,x0,y0,z0,fai,k)
%a,b,c,xt,yt,zt是旋转轴((x-xt)/a=(y-yt)/b=(z-zt)/c)
%方向向量为（a,b,c）
%x0,y0,z0是正方体中心A，fai为逆时针旋转角
%fai为degree

%过点A与旋转轴垂直的平面方程为:a(x-x0)+b(y-y0)+c(z-z0)=0
%直线参数方程(xt+a*t,yt+b*t,zt+c*t),解出t，得点B
temp1 = a*(x0-xt)+b*(y0-yt)+c*(z0-zt);
temp2 = a^2+b^2+c^2;
t = temp1/temp2;
x1 = xt + a*t;
y1 = yt + b*t;
z1 = zt + c*t;
%B(x1,y1,z1)为A与旋转轴垂线和旋转轴的交点
length = sqrt((x0-x1)^2+(y0-y1)^2+(z0-z1)^2);
%length为正方体中心到旋转轴的距离AB
%球方程为(x-xt)^2+(y-yt)^2+(z-zt)^2 = length^2

%另外一种计算距离的方法
%temp1 = abs(a*(x0-xt)+b*(y0-yt)+c*(z0-zt));
%temp2 = sqrt(a^2+b^2+c^2);
%temp3 = (x0-xt)^2+(y0-yt)^2+(z0-zt)^2;
%length = sqrt(temp3 - (temp1/temp2)^2);