classdef User
    %USER Representation of a User Equipment Terminal
    
    properties
        x % Horizontal location in cell
        y % Vertical location in cell
        id % Unique identifier
        d2d %Specifies if the user is d2d user
        head = false %Specifies if the user is a head of d2d
        neighbor = 0 %Specifies the users neigbor id if d2d
        blocks %Vector of blocks in use by a users
        nrOfBlocks = 0 %Amount of resource blocks held by user
        sinr = 0
        recievedPower = 0
        interferencePowerD2D = 0
        interferencePowerBS = 0
        throughput = 0
    end
    
    methods
        %Constructor
        function obj = User(id, x, y, d2d)
            obj.id = id;
            obj.x = x;
            obj.y = y;
            obj.d2d = d2d;
        end
        
        function obj = setD2DProperties(obj, isHead, neighborId)
            obj.head = isHead;
            obj.neighbor = neighborId;
        end
        
        function obj = addBlock(obj, blockId)
            obj.blocks(obj.nrOfBlocks + 1) = blockId;
            obj.nrOfBlocks = obj.nrOfBlocks + 1;
        end
        
        function obj = calculateSINR(obj)
            if (obj.nrOfBlocks ~= 0)
            obj.sinr = obj.recievedPower - pow2db(db2pow(obj.interferencePowerD2D-30) + db2pow(obj.interferencePowerBS-30))+ 30;
            else 
                obj.sinr = 0;
            end
        end
        
        function obj = calculateThroughput(obj)
           obj.throughput = log2(1+ db2pow(obj.sinr-30));
        end
    end
    
end

