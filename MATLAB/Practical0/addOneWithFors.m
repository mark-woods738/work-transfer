function [output] = addOneWithFors(input)
[rows, cols] = size(input)
output = input
for irow = 1:rows
    for icol = 1:cols
        output(irow, icol) = output(irow, icol) +1
    end
end
end
