function [Lut] = contrast_LS_LUT(m, c)
for i = 0:255
    index = i+1
    ans = m*i+c
    if ans < 0
        output(index) = 0
    else if ans >= 255
            output(index) = 255
    else 
        output(index) = ans
       
    end
    end
    Lut=uint8(output);
end