function dataOut = preprocessWrapper(dataIn)
    img = dataIn{1};                % görüntü
    label = dataIn{2};              % etiket

    imgProcessed = preprocessCustomImage(img);
    dataOut = {imgProcessed, label}; % çift sütun: {image, label}
end