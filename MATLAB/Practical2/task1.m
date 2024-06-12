boat = imread('boatnois.jpg');

% image minipulation
mask = ones(3)/9;
conv_image = round(conv2(mask, boat));
filter_image = filter2(mask, boat);
myconv_image = myconvolution(boat, mask)

% unaltered image
subplot(1,4,1)
image_size = size(boat)
imshow(boat)

% conv2 image
subplot(1,4,2)
conv_image_size = size(conv_image)
imshow(conv_image, [0,255]);

% filter2 image
subplot(1,4,3)
filter_image_size = size(filter_image)
imshow(filter_image, [0,255]);

% myConvolution image
subplot(1,4,4)
myconv_image_size = size(myconv_image)
imshow(myconv_image, [0,255]);
