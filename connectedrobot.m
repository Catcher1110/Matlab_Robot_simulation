classdef connectedrobot < handle
    %����һ�����ӺõĻ�����
    %��cuberobot���
    properties
        nparts%�ж��ٸ�cuberobot���
        parts%ÿ��cuberobot����Ϣ����cell����
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
            
        end
        
        function robotrotate(rotaterobot,cube1,cube2,fai)
            %ROBOTROTATE ��������ת����
            %��ת���ĸ������������������ˣ������໥ת��ģ�飬��ʱ��ת���Ƕ�
            %��ת��Ϊģ��һ���ĵ�ģ������ĵ�����
            allnum = rotaterobot.nparts;
            allcube = rotaterobot.parts;
            rotatedirection = cube2.center - cube1.center;
            rotatepoint = cube1.center;
            fai = fai*pi/180;
            for i = 1:1:allnum
                
            end
        end
    end
end
