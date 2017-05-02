function rotate_point_plot3(a,b,c,xt,yt,zt,x0,y0,z0,fai,k)
%a,b,c,xt,yt,zt����ת��((x-xt)/a=(y-yt)/b=(z-zt)/c)
%��������Ϊ��a,b,c��
%x0,y0,z0������������A��faiΪ��ʱ����ת��
%faiΪdegree

%����A����ת�ᴹֱ��ƽ�淽��Ϊ:a(x-x0)+b(y-y0)+c(z-z0)=0
%ֱ�߲�������(xt+a*t,yt+b*t,zt+c*t),���t���õ�B
temp1 = a*(x0-xt)+b*(y0-yt)+c*(z0-zt);
temp2 = a^2+b^2+c^2;
t = temp1/temp2;
x1 = xt + a*t;
y1 = yt + b*t;
z1 = zt + c*t;
%B(x1,y1,z1)ΪA����ת�ᴹ�ߺ���ת��Ľ���
length = sqrt((x0-x1)^2+(y0-y1)^2+(z0-z1)^2);
%lengthΪ���������ĵ���ת��ľ���AB
%�򷽳�Ϊ(x-xt)^2+(y-yt)^2+(z-zt)^2 = length^2

%����һ�ּ������ķ���
%temp1 = abs(a*(x0-xt)+b*(y0-yt)+c*(z0-zt));
%temp2 = sqrt(a^2+b^2+c^2);
%temp3 = (x0-xt)^2+(y0-yt)^2+(z0-zt)^2;
%length = sqrt(temp3 - (temp1/temp2)^2);