function [output] = searchingZeros(input)
output = 0
[rows, cols] = size(input)
for irow =1:rows
    for icol = 1:cols
        if input(irow, icol) == 0
            output=output+1
        end
    end
end
end