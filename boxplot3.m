function boxplot3(varargin)
narginchk(4,7);
if nargin == 4
    x0 = varargin{1};
    y0 = varargin{2};
    z0 = varargin{3};
    k = varargin{4};
    lx = 4;
    ly = 4;
    lz = 4;
elseif nargin == 7
    x0 = varargin{1};
    y0 = varargin{2};
    z0 = varargin{3};
    lx = varargin{4};
    ly = varargin{5};
    lz = varargin{6};
    k = varargin{7};
end
%x0,y0,z0�ֱ�Ϊ�������������ꣻ
%lx,ly,lz�ֱ�Ϊ�߳���һ�룻
%kΪ��ɫ������Ҫ��''����boxplot3(x0,y0,z0,lx,ly,lz,'r')Ϊ��ɫ���ͼ
x=zeros(6,5);y=zeros(6,5);z=zeros(6,5);
x=[x0-lx x0+lx x0+lx x0-lx x0-lx;
    x0-lx x0-lx x0-lx x0-lx x0-lx;
    x0-lx x0+lx x0+lx x0-lx x0-lx;
    x0-lx x0+lx x0+lx x0-lx x0-lx;
    x0-lx x0+lx x0+lx x0-lx x0-lx;
    x0+lx x0+lx x0+lx x0+lx x0+lx];
y=[y0-ly y0-ly y0-ly y0-ly y0-ly;
    y0-ly y0-ly y0+ly y0+ly y0-ly;
    y0-ly y0-ly y0+ly y0+ly y0-ly;
    y0-ly y0-ly y0+ly y0+ly y0-ly;
    y0+ly y0+ly y0+ly y0+ly y0+ly;
    y0-ly y0-ly y0+ly y0+ly y0-ly];
z=[z0-lz z0-lz z0+lz z0+lz z0-lz;
    z0-lz z0+lz z0+lz z0-lz z0-lz;
    z0+lz z0+lz z0+lz z0+lz z0+lz;
    z0-lz z0-lz z0-lz z0-lz z0-lz;
    z0-lz z0-lz z0+lz z0+lz z0-lz;
    z0-lz z0+lz z0+lz z0-lz z0-lz];
plot3(0,50,0,50,0,50) %��ʼ�ķ�ΧΪx:0~1000,y:0~1000,z:0~1000 ���ԸĶ����÷�Χ���е���
hold on
%plot3(0,0,0)
%kk=[k k k k k];
for i=1:6                   %������ɫ���
    fill3(x(i,:),y(i,:),z(i,:),k)
end
hold off
set(gca,'xgrid','on','ygrid','on','zgrid','on');
%set(gca,'ZDir','reverse');
set(get(gca,'xLabel'),'String','x��');%��������������
set(get(gca,'yLabel'),'String','y��');
set(get(gca,'zLabel'),'String','z��');
set(gca,'box','on');%���ó����񻯣����������㣬������ÿ��԰�on�ĳ�off
pause(0.05);
