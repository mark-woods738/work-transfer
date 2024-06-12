function Iout = noiseReduction(I, N)

mask = ones(N)/power(N, 2);
Iout = conv2(mask, I);

end
