%cuberobot.boxplot Draw a picture of the cuberobot
function boxplot3(cuberobot,k)
%center = cuberobot.center;
%x0 = center(1);
%y0 = center(2);
%z0 = center(3);
apex = cuberobot.apex;
point = cell(1,8);
for i = 1:1:8
    point{i} = apex(:,i)';
end
%x0,y0,z0分别为正方体中心坐标；
%k为颜色参数需要加''例：boxplot3(x0,y0,z0,lx,ly,lz,'r')为红色填充图
%绘图顺序15621，12431，26842，15731，37843，56875
x=[point{1}(1) point{5}(1) point{6}(1) point{2}(1) point{1}(1);
   point{1}(1) point{2}(1) point{4}(1) point{3}(1) point{1}(1);
   point{2}(1) point{6}(1) point{8}(1) point{4}(1) point{2}(1);
   point{1}(1) point{5}(1) point{7}(1) point{3}(1) point{1}(1);
   point{3}(1) point{7}(1) point{8}(1) point{4}(1) point{3}(1);
   point{5}(1) point{6}(1) point{8}(1) point{7}(1) point{5}(1)];
y=[point{1}(2) point{5}(2) point{6}(2) point{2}(2) point{1}(2);
   point{1}(2) point{2}(2) point{4}(2) point{3}(2) point{1}(2);
   point{2}(2) point{6}(2) point{8}(2) point{4}(2) point{2}(2);
   point{1}(2) point{5}(2) point{7}(2) point{3}(2) point{1}(2);
   point{3}(2) point{7}(2) point{8}(2) point{4}(2) point{3}(2);
   point{5}(2) point{6}(2) point{8}(2) point{7}(2) point{5}(2)];
z=[point{1}(3) point{5}(3) point{6}(3) point{2}(3) point{1}(3);
   point{1}(3) point{2}(3) point{4}(3) point{3}(3) point{1}(3);
   point{2}(3) point{6}(3) point{8}(3) point{4}(3) point{2}(3);
   point{1}(3) point{5}(3) point{7}(3) point{3}(3) point{1}(3);
   point{3}(3) point{7}(3) point{8}(3) point{4}(3) point{3}(3);
   point{5}(3) point{6}(3) point{8}(3) point{7}(3) point{5}(3)];
plot3(-5,50,-5,50,-5,50) %初始的范围为x:0~1000,y:0~1000,z:0~1000 可以改动设置范围进行调整

hold on
%plot3(0,0,0)
%kk=[k k k k k];
for i=1:6                   %进行颜色填充
    fill3(x(i,:),y(i,:),z(i,:),k)
end
%hold off
set(gca,'xgrid','on','ygrid','on','zgrid','on');
%set(gca,'ZDir','reverse');
set(get(gca,'xLabel'),'String','x轴');%设置坐标轴名称
set(get(gca,'yLabel'),'String','y轴');
set(get(gca,'zLabel'),'String','z轴');
set(gca,'box','on');%设置成网格化，看起来方便，如果不用可以把on改成off
rotate3d;
pause(0.00001);
