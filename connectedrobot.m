classdef connectedrobot < handle
    %定义一个连接好的机器人
    %由cuberobot组成
    properties
        nparts%有多少个cuberobot组成
        parts%每个cuberobot的信息，由cell储存
    end
    methods
        function robot = connectedrobot(varargin)
            %CONNECTEDROBOT initialize the whole robot
            %With two types of input
            %connectedrobot(a,b,c,d,...) or connectedrobot(A,a,b,c,d,...)
            %The A is the connectedrobot, and the smallsmall letter is the
            %cuberobot.
            if isa(varargin{1},'cuberobot')
                robot.parts = cell(1,nargin);
                for i = 1:1:nargin
                    robot.parts{i} = varargin{i};
                end
                robot.nparts = length(robot.parts);
            elseif isa(varargin{1},'connectedrobot')
                robot = varargin{1};
                a = robot.nparts;
                for i = 2:1:nargin
                    robot.parts{a+i-1} = varargin{i};
                end
                varargin{1}.nparts = length(varargin{1}.parts);
            else
                disp('The input object may be wrong');
            end                    
        end
        
        function robotplot(robot)
            tempplot = robot.parts;
            tempnum = robot.nparts;
            for i = 1:1:tempnum
                boxplot3(tempplot{i},'r');
            end
            
            for i = 1:1:tempnum-1
                for j = i+1:1:tempnum
                    connecplot(tempplot{i},tempplot{j});
                end
            end
            hold off;
        end
        
        function cubeinrobot = numfindcube(robot,numofcube)
            temp1 = robot.parts;
            temp2 = robot.nparts;
            i = 1;
            while(temp1{i}.num ~= numofcube)
                if i < temp2
                    i = i+1;
                else
                    disp('This cube is not in the robot');
                    return
                end
            end
            cubeinrobot = i;
        end
        
        function robotrotate(rotaterobot,cube1,cube2,fai)
            %ROBOTROTATE 机器人旋转函数
            %旋转有四个输入量，整个机器人，两个相互转动模块，逆时针转动角度
            %旋转轴为模块一中心到模块二中心的向量
            rotatedirection = cube2.center - cube1.center;
            rotatepoint = cube1.center;
            cubecon = findconnection(rotaterobot,cube1.num,cube2.num);
            for i = cubecon
                cubeinrobot = numfindcube(rotaterobot,i);
                rotatecube(rotaterobot.parts{cubeinrobot},rotatepoint,rotatedirection,fai);
            end
        end
        
        function robotrotateplot(rotaterobot,cube1,cube2,fai)
            temp = fai/20;
            for i = 1:1:20
                hold off;
                robotrotate(rotaterobot,cube1,cube2,temp);
                axis([0,50,0,50,0,50]);
                robotplot(rotaterobot);
            end
            rotate3d;
        end
        
        function cubecon = findconnection(robot,cubenum1,cubenum2)
            %CUBECON return the number of cube which is connected to cube2
            cube1inrobot = numfindcube(robot,cubenum1);
            cube2inrobot = numfindcube(robot,cubenum2);
            cube1 = robot.parts{cube1inrobot};
            cube2 = robot.parts{cube2inrobot};
            if whethercon(cube1,cube2)
                temp1 = [];
                temp2 = (cube2.connec(1:6,2:2))';
                temp2 = setdiff(temp2,cubenum1);
                temp2 = unique(temp2);
                temp2 = setdiff(temp2,0);
                
                while(length(temp1)~=length(temp2))
                    temp1 = temp2;
                    temp3 = [];
                    for i = temp2
                        cubeinrobot = numfindcube(robot,i);
                        cube = robot.parts{cubeinrobot};
                        temp3 = [temp3 (cube.connec(1:6,2:2))'];
                        temp3 = setdiff(temp3,cubenum1);
                        temp3 = unique(temp3);
                    end
                    temp2 = [temp2 temp3];
                    temp2 = unique(temp2);
                    temp2 = setdiff(temp2,0);
                end
                temp2 = [temp2 cubenum2];
                temp2 = unique(temp2);
                temp2 = setdiff(temp2,0);
                cubecon = setdiff(temp2,cubenum1);
                
            else
                disp('These two cube have not been connected');
            end
        end
        
    end
end
