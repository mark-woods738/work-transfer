function  prediction = KNNTesting(testImage, modelNN, k)
    for i = 1:size(modelNN.labels, 1)
        distances(i) = EuclideanDistance(testImage, modelNN.neighbours(i, :));
    end
    sortedDistances = sort(distances, 'ascend');
    if k > size(modelNN.neighbours,1)
        k = size(modelNN.neighbours, 1);
    end
    for i = 1:k
        index = find(distances == sortedDistances(i));
        closestLabels(i) = modelNN.labels(index, :);
    end
    prediction = mode(closestLabels);
end