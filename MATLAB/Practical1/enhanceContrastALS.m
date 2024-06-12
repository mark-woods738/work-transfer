function [Iout] = enhanceContrastALS(Iin)
    big = max(Iin, [], "all")
    small = min(Iin, [], "all")
    diff = big - small
    grad = 256.0./double(diff)
    int = 0-double(small)

    output = enhanceContrastLS(Iin, grad, int)
    Iout = output
end