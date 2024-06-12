function Lut = brightnessLUT(c)

%Task 2, Step 1

% Lut = zeros(1, 255)

for index = 0:255
    if index < -c
        output(index+1) = 0
    else if index > 255 - c 
            output(index+1) = 255
    else output(index+1) = index + c
    end
    end


Lut=uint8(output);
end