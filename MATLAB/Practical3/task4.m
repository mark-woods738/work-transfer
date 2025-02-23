filename = 'shopping_center.mpg';
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
    currentFrameGray = rgb2gray(currentFrame);
    subplot(2,3,1), imshow(currentFrameGray), title(['Frame: ', num2str(t)])
    subplot(2, 3, 2), imshow(medianBkg, [0,255]), title('Background');

    bkgGray = double(bkgGray);
    currentFrameGray = double(currentFrameGray);

    % blobs = abs(currentFrameGray - bkgGray) > 25;
    blobs = abs(currentFrameGray - medianBkg) > 60;
    subplot(2,3,3), imshow(blobs), title('Blobs'), colormap(gray)

    % export blobs as a video
    frame = im2frame(uint8(blobs)*255, MAP);
    writeVideo(outVid, frame);

    % remove noise from blobs
    process1 = imclose(blobs, ones(9));
    process2 = imopen(process1, ones(5));
    process3 = imclose(process2, ones(3));
    finalPostProcess = process3;

    % plot blobs with noise removed
    subplot(2,3,4)
    imshow(finalPostProcess), title('Blobs PostProcessed')

    % label blobs
    labelled = bwlabel(finalPostProcess, 4)
    subplot(2,3,5), imagesc(labelled), title('Labelling');

    NumVehicles = max(max(labelled));
    % highlight detected vehicles

    BBs = [];
    for b = 1:NumVehicles
        [ys xs]=find(labelled == b)

        xmax = max(xs);
        xmin = min(xs);
        ymax = max(ys);
        ymin = min(ys)

        BB =[xmin ymin xmax ymax]
        BBs = [BBs; BB];
    end

    subplot(2,3,6), imshow(currentFrame), title('Detections'), hold on
for b = 1: NumVehicles
rectangle('Position', [BBs(b,1) BBs(b,2) BBs(b,3)-BBs(b,1)+1 BBs(b,4)-BBs(b,2)+1])
end
hold off
;    
    pause(0.005)
end

close(outVid);