boat = imread('boat256.jpg')
% uneddited boat image and histogram
subplot(2,2,1)
imshow(boat)
subplot(2,2,3)
histogram(boat, 'BinLimits', [0 256], 'BinWidth', 1)
% eddited boat image and histogram
subplot(2,2,2)
boat2 = enhanceContrastPL(boat, 1.1)
imshow(boat2)
subplot(2,2,4)
histogram(boat2, 'BinLimits', [0 256], 'BinWidth', 1)