function [tDiff] = compComparrison()
inMat = ones(100, 100)
% tic 
% addOne(inMat)
% toc
tic
addOneWithFors(inMat)
toc
end
