function prediction = NNTesting(testImage, modelNN)
    for i = 1:size(modelNN.labels, 1)
        distances(i) = EuclideanDistance(testImage, modelNN.neighbours(i, :));
    end
    closest = min(distances);
    ansIndex = find(distances == closest);
    prediction = modelNN.labels(ansIndex);
end