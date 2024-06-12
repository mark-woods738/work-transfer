function distance = EuclideanDistance(sample1, sample2)
% numerator = abs(sample1-sample2)    
denominator = 0;
    for i = 1:size(sample1, 2)
        diff = sample1(1, i) - sample2(1, i);
        denominator = denominator + power(diff, 2);
    end
    distance = denominator;
end