dome = imread('dome256.jpg')
boat = imread('boat256.jpg')
image = dome
% original image
subplot(2, 3, 1)
imshow(image)
subplot(2,3,4)
histogram(image, 'BinLimits', [0 256], 'BinWidth', 1)
% image changed based on matlab function
subplot(2,3,2)
image2 = histeq(image, 256)
imshow(image2)
subplot(2,3,5)
histogram(image2, 'BinLimits', [0 256], 'BinWidth', 1)
% image changed based on my function
subplot(2, 3, 3)
image3=enhanceContrastHE(image)
imshow(image3)
subplot(2, 3, 6)
histogram(image3, 'BinLimits', [0 256], 'BinWidth', 1)