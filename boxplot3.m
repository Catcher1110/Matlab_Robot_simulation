function boxplot3(x0,y0,z0,lx,ly,lz,k)
%x0,y0,z0分别为立方体起始坐标；lx,ly,lz分别为长，宽，高；
%k为颜色参数需要加''例：boxplot3(x0,y0,z0,lx,ly,lz,'r')为红色填充图
x=zeros(6,5);y=zeros(6,5);z=zeros(6,5);
x=[x0 x0+lx x0+lx x0 x0;
    x0 x0 x0 x0 x0;
    x0 x0+lx x0+lx x0 x0;
    x0 x0+lx x0+lx x0 x0;
    x0 x0+lx x0+lx x0 x0;
    x0+lx x0+lx x0+lx x0+lx x0+lx];
y=[y0 y0 y0 y0 y0;
    y0 y0 y0+ly y0+ly y0;
    y0 y0 y0+ly y0+ly y0;
    y0 y0 y0+ly y0+ly y0;
    y0+ly y0+ly y0+ly y0+ly y0+ly;
    y0 y0 y0+ly y0+ly y0];
z=[z0 z0 z0+lz z0+lz z0;
    z0 z0+lz z0+lz z0 z0;
    z0+lz z0+lz z0+lz z0+lz z0+lz;
    z0 z0 z0 z0 z0;
    z0 z0 z0+lz z0+lz z0;
    z0 z0+lz z0+lz z0 z0];
plot3(1000,1000,1000) %初始的范围为x:0~1000,y:0~1000,z:0~1000 可以改动设置范围进行调整
hold on
plot3(0,0,0)
%kk=[k k k k k];
for i=1:6                   %进行颜色填充
    fill3(x(i,:),y(i,:),z(i,:),k)
end
hold off
set(gca,'xgrid','on','ygrid','on','zgrid','on');
set(gca,'ZDir','reverse');
set(get(gca,'xLabel'),'String','x轴');%设置坐标轴名称
set(get(gca,'yLabel'),'String','y轴');
set(get(gca,'zLabel'),'String','z轴');
set(gca,'box','on');%设置成网格化，看起来方便，如果不用可以把on改成off
