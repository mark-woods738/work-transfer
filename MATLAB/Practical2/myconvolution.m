function Iout = myconvolution(Iin,B)

Iin=double(Iin);
B=double(B);
Iout = zeros(size(Iin, 1)-size(B, 1)+1, size(Iin, 2)-size(B, 2)+1);

%Task1 Step 5

end_row = size(Iin, 1)-size(B, 1)+1;
end_col = size(Iin, 2)-size(B, 2)+1;

for row = 1:end_row
    for col = 1:end_col
        sum=0;
        for mat_row = 1:size(B, 1)
            for mat_col = 1:size(B, 2)
                test_row = row+mat_row-1;
                test_col = col+mat_col-1;

                sum = sum + Iin(test_row, test_col)*B(mat_row, mat_col);
            end
        end
        Iout(row, col) = sum;
    end
end










end
 