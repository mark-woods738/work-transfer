filename = 'viptraffic.avi';
vid = VideoReader(filename);
videoFrames = read(vid);

bkg = videoFrames(:, :, :, 120);
bkgGray = rgb2gray(bkg);
bkgGray2 = bkg(:, :, 1)/3 + bkg(:, :, 2)/3 + bkg(:, :, 3)/3;

subplot(1,3,1)
imshow(bkg)
subplot(1, 3, 2)
imshow(bkgGray, [1, 255])
subplot(1,3,3)
imshow(bkgGray2, [1, 255])

outVidName = 'resultTraffic.avi';
outVid = VideoWriter(outVidName);
open(outVid);
MAP=colormap(gray(256));

medianBkg = bckGenerator(videoFrames, 10);
medianBkg = double(medianBkg);

for t = 1:size(videoFrames, 4)
    currentFrame = videoFrames(:, :, :, t);
    currentFrameGray = rgb2gray(currentFrame)
    subplot(2,3,1), imshow(currentFrameGray), title(['Frame: ', num2str(t)])
    subplot(2, 3, 2), imshow(bkgGray, [0,255]), title('Background');

    bkgGray = double(bkgGray);
    currentFrameGray = double(currentFrameGray)

    blobs = abs(currentFrameGray - bkgGray) > 25;
    blobs = abs(currentFrameGray - bkgGray) > 50;
    subplot(2,3,3), imshow(blobs), title('Blobs'), colormap(gray)

    frame = im2frame(uint8(blobs)*255, MAP);
    writeVideo(outVid, frame);
    
    pause(0.03)
end

close(outVid);