function Iout = enhanceContrastPL(Iin, gamma)
    Iout = uint8(double(Iin).^gamma)
end