classdef cuberobot < handle
    %定义一个模块的类
    %位置信息（9个点），连接信息
    
    properties
        center%中心位置信息
        apex%顶点位置信息
        connec%连接信息，连接双方的中心点
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
                
                l.connec = zeros(3,6);
                l.num = numberofcube(1);
                numberofcube(1) = [];
            elseif nargin == 2
                l = cell(1,varargin{1}*varargin{2});
                for i = 1:1:varargin{1}
                    for j = 1:1:varargin{2}
                        l{(i-1)*varargin{2}+j} = cuberobot(10*i-5,10*j-5,0);
                    end
                end
            elseif nargin == 3
                l.center = [varargin{1};varargin{2};varargin{3}];
                l.apex = l.center + [-4,-4,-4,-4,4,4,4,4;
                    -4,-4,4,4,-4,-4,4,4;
                    -4,4,-4,4,-4,4,-4,4];
                l.num = numberofcube(1);
                numberofcube(1) = [];
            end
            
        end
        function set.apex(l,apex)
            l.apex = apex;
        end
        function set.center(l,center)
            l.center = center;
        end
    end
end
