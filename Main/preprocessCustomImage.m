function out = preprocessCustomImage(img)
    % Griye çevir (zaten gri olabilir)
    if size(img,3) == 3
        img = rgb2gray(img);
    end

    % Kanal 1: Normalleştirilmiş gri görüntü
    channel1 = im2double(imresize(img, [128 128]));

    % Kanal 2: Sobel kenar (normalize)
    edge = imgradient(channel1, 'sobel');
    channel2 = mat2gray(imresize(edge, [128 128]));

    % Kanal 3: CLAHE (normalize)
    claheImg = adapthisteq(channel1);
    channel3 = im2double(imresize(claheImg, [128 128]));

    % 3 kanallı birleştir
    out = cat(3, channel1, channel2, channel3);
end