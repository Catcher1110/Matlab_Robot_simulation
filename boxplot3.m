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
%x0,y0,z0�ֱ�Ϊ�������������ꣻ
%kΪ��ɫ������Ҫ��''����boxplot3(x0,y0,z0,lx,ly,lz,'r')Ϊ��ɫ���ͼ
%��ͼ˳��15621��12431��26842��15731��37843��56875
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
plot3(-5,50,-5,50,-5,50) %��ʼ�ķ�ΧΪx:0~1000,y:0~1000,z:0~1000 ���ԸĶ����÷�Χ���е���

hold on
%plot3(0,0,0)
%kk=[k k k k k];
for i=1:6                   %������ɫ���
    fill3(x(i,:),y(i,:),z(i,:),k)
end
%hold off
set(gca,'xgrid','on','ygrid','on','zgrid','on');
%set(gca,'ZDir','reverse');
set(get(gca,'xLabel'),'String','x��');%��������������
set(get(gca,'yLabel'),'String','y��');
set(get(gca,'zLabel'),'String','z��');
set(gca,'box','on');%���ó����񻯣����������㣬������ÿ��԰�on�ĳ�off
rotate3d;
pause(0.00001);
