function img = convertTo3Channel(I)
    if size(I,3) == 1
        img = cat(3, I, I, I);  % Gri → RGB
    elseif size(I,3) == 3
        img = I;               % Zaten RGB
    else
        error("Image has unsupported channel size: %d", size(I,3));
    end
end