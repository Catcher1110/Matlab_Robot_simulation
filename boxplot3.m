function boxplot3(x0,y0,z0,lx,ly,lz,k)
%x0,y0,z0�ֱ�Ϊ��������ʼ���ꣻlx,ly,lz�ֱ�Ϊ�������ߣ�
%kΪ��ɫ������Ҫ��''����boxplot3(x0,y0,z0,lx,ly,lz,'r')Ϊ��ɫ���ͼ
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
plot3(1000,1000,1000) %��ʼ�ķ�ΧΪx:0~1000,y:0~1000,z:0~1000 ���ԸĶ����÷�Χ���е���
hold on
plot3(0,0,0)
%kk=[k k k k k];
for i=1:6                   %������ɫ���
    fill3(x(i,:),y(i,:),z(i,:),k)
end
hold off
set(gca,'xgrid','on','ygrid','on','zgrid','on');
set(gca,'ZDir','reverse');
set(get(gca,'xLabel'),'String','x��');%��������������
set(get(gca,'yLabel'),'String','y��');
set(get(gca,'zLabel'),'String','z��');
set(gca,'box','on');%���ó����񻯣����������㣬������ÿ��԰�on�ĳ�off
