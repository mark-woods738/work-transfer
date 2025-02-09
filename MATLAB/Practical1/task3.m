dome = imread('dome256.jpg')
boat = imread('boat256.jpg')
subplot(2, 3, 1)
imshow(boat)
% subplot(2,3,2)
% plot(brightnessLUT(50))
subplot(2,3,4)
histogram(boat, 'BinLimits', [0 256], 'BinWidth', 1)
% manual adjustment
subplot(2,3,2)
boat2 = enhanceContrastLS(boat, 1.5, -30)
imshow(boat2)
subplot(2,3,5)
histogram(boat2, 'BinLimits', [0 256], 'BinWidth', 1)
% auto adjustment
subplot(2,3,3)
boat3 = enhanceContrastALS(boat)
imshow(boat3)
subplot(2,3,6)
histogram(boat3, 'BinLimits', [0 256], 'BinWidth', 1)