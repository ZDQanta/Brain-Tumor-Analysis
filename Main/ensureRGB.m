function img = ensureRGB(I)
    if size(I,3) == 1
        img = cat(3, I, I, I);  % Gri → RGB
    else
        img = I;  % Zaten RGB
    end
end