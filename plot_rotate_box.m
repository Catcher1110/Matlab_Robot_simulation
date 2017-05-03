function plot_rotate_box(a,b,c,xt,yt,zt,cuberobot,fai,k)
fai = fai*pi/180;
%faiΪdegree
%a,b,c,xt,yt,zt����ת��((x-xt)/a=(y-yt)/b=(z-zt)/c)
%��������Ϊ��a,b,c��
%x0,y0,z0������������A��faiΪ��ʱ����ת��
%faiΪdegree
trans = [1,0,0,xt;0,1,0,yt;0,0,1,zt;0,0,0,1];
detrans = [1,0,0,-xt;0,1,0,-yt;0,0,1,-zt;0,0,0,1];
center = cuberobot.center;
apex = cuberobot.apex;
%point = cell(1,8);
%for i = 1:1:8
%    point{i} = [apex(:,i)';1];
%end
apex = [apex;1,1,1,1,1,1,1,1];
set.center(cuberobot,trans*CrotC(a,b,c,fai)*detrans*[center;1]);
cuberobot.center = center(1:3,1);
j = 0:0.01:fai;
for i = [j,fai]
    apex = trans*CrotC(a,b,c,i)*detrans*apex;
    set.apex(cuberobot,apex(1:3,:));
    boxplot3(cuberobot,k);
    pause(0.05);
end