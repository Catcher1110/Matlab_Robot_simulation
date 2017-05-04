classdef cuberobot < handle
    %定义一个模块的类
    %位置信息（9个点），连接信息
    
    properties
        center%中心位置信息
        apex%顶点位置信息
        connec%连接信息，连接双方的模块编号
        cube_l = 4%模块边长的一半
        num%模块编号
    end
    
    methods
        function l = cuberobot(varargin)
            global numberofcube;
            if nargin == 0
                l.center = zeros(3,1);
                l.apex = [-4,-4,-4,-4, 4, 4, 4,4;
                    -4,-4, 4, 4,-4,-4, 4,4;
                    -4, 4,-4, 4,-4, 4,-4,4];
                l.num = numberofcube(1);
                numberofcube(1) = [];
                
            elseif nargin == 3
                l.center = [varargin{1};varargin{2};varargin{3}];
                l.apex = l.center + [-4,-4,-4,-4,4,4,4,4;
                    -4,-4,4,4,-4,-4,4,4;
                    -4,4,-4,4,-4,4,-4,4];
                l.num = numberofcube(1);
                numberofcube(1) = [];
                
            end
            l.connec = [l.num,0;l.num,0;l.num,0;l.num,0;l.num,0;l.num,0];
        end
        
        function connectcube(a,b)
            %CONNECTCUBE connect two cuberobots
            %connect(a,b)
            %a and b must be the cuberobot
            %The function will tell you whether it can be connected or not
            temp1 = a.center - b.center;
            temp2 = (temp1.*temp1)';
            length = sqrt(norm(temp2,1));
            if abs(length - 10) > 0.1
                disp('These two parts cannot be connected');
            else
                disp('These two parts can be connected');
                i = 1;
                while(a.connec(i,2) ~= 0)
                    i = i+1;
                end
                a.connec(i,2) = b.num;
                j = 1;
                while(b.connec(j,2) ~= 0)
                    j = j+1;
                end
                b.connec(j,2) = a.num;
            end
        end
        
        function disconectcube(a,b)
            %DISCONNECTCUBE connect two cuberobots
            %disconnect(a,b)
            %a and b must be the cuberobot
            %The function will tell you whether it can be disconnected or not
            if whethercon(a,b) == 0
                disp('These two parts haven''t been connected');
            else
                i = 1;
                while(a.connec(i,2) ~= b.num)
                    i = i+1;
                end
                a.connec(i,2) = 0;
                
                j = 1;
                while(b.connec(j,2) ~= a.num)
                    j = j+1;
                end
                b.connec(j,2) = 0;
            end
        end
                
        function cubeplot(varargin)
            %CUBEPLOT draw the cuberobot and the connect parts
            %cubeplot(a,b,c,...) or 
            %a,b,c,... must be the cuberobot
            %The function will judge whether any two paets are connected or
            %not,if not,it will not draw the connect part
            
            cubenum = nargin;
            tempplot = cell(1,cubenum);
            for i = 1:1:cubenum
                tempplot{i} = varargin{i};
            end
            
            for i = 1:1:cubenum
                boxplot3(tempplot{i},'r');
            end
            
            for i = 1:1:cubenum-1
                for j = i+1:1:cubenum
                    connecplot(tempplot{i},tempplot{j});
                end
            end
            rotate3d;         
        end
        
        function connecplot(a,b)
            %CONNECPLOT judge the connection and draw it
            %connecplot(a,b) a,b must be the cuberobot
            rotate3d;
            if whethercon(a,b)
                cylinder3(a.center,b.center,0.5,50,'k',1,0);
            else
                return
            end
        end
        
        function wh = whethercon(a,b)
           i = 1;
           while(a.connec(i,2)~=b.num)
               if i < 6
                    i = i+1;
               else
                   wh = 0;
                   return;
               end
           end
           wh = 1;
        end
    end
end
