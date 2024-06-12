filename = "viptraffic.avi";
filename2 = "shopping_center.mpg";
vid = VideoReader(filename);
vidFrames = read(vid);
size(vidFrames);

% implay(filename)
frame1 = vidFrames(:,:,:,1)
imshow(frame1)
