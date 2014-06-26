function [IsD2D] = isD2D(size, ratio);
    IsD2D = zeros(size, 1);
    r = rand(size, 1);
        for i=1:size
                if (r(i,1) < ratio)
                    IsD2D(i, 1) = 1;
                end
        end
end