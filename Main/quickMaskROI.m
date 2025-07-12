function mask = quickMaskROI(roi)
    % ROI içinden morfolojik maske üretir (2-B gri bekler)
    % NOT: Eşik ve morfoloji boyutları elle ayarlanabilir!

    % 1) Griye çevir
    if size(roi,3) == 3
        roi = rgb2gray(roi);
    end
    roi = im2uint8(roi);   % uint8 yap

    % 2) Kontrast artırma (isteğe bağlı)
    roiEq = adapthisteq(roi);

    % 3) Eşikleme: Elle threshold uygula (test et, 0.3 ile 0.5 arası dene)
    threshold = 0.4;    % <- BURAYI elle değiştirerek test et!
    bw = imbinarize(roiEq, threshold);

    % 4) Morfolojik temizlik
    bw = bwareafilt(bw, 1);              % Sadece en büyük alanı al (genellikle tümör)
    bw = imfill(bw, 'holes');            % Delikleri doldur
    bw = imopen(bw, strel('disk', 2));   % Gürültü temizle + maskeyi incelt
    bw = imdilate(bw, strel('disk', 3)); % Maskeyi biraz büyüt

    % DEBUG: Maskeyi gözle kontrol etmek için aşağıdaki satırı açabilirsin:
    % figure; imshow(bw); title('Segmentasyon Maskesi (quickMaskROI çıkışı)');

    mask = bw;
end