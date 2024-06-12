function [Bkg] = bckGenerator(videoStream, sampling)
    buffer=[];
    counter=0;
    for t = 1:sampling:size(videoStream,4)
        counter = counter +1;
        frame = videoStream(:,:,:,t);
        buffer(:,:,counter)= rgb2gray(frame);
    end

    buffer = double(buffer);
    Bkg = median(buffer,3);
end