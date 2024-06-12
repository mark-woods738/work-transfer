function [Iout] = enhanceContrastLS(Iin, m, c)
    lut = contrast_LS_LUT(m, c)
    Iout = intlut(Iin,lut);
end