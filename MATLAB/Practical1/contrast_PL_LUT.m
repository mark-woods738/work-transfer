function Lut = contrast_PL_LUT(gamma)
    for i = 0:255
        index = i + 1
        ans = double(power(i, gamma)./power(255, gamma-1))
        if ans < 0
            output(index) = 0
        else if ans >= 255
                output(index) = 255
        else output(index) = ans
        end
        end
        Lut=uint8(output);
end