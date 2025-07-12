function dataOut = readAndConvert(dataIn)
% dataIn = { I , bbox }  (combine(imds,blds) çıktısı)
% dataOut = { I_RGB , bbox , classLabel }

I    = dataIn{1};          % görüntü
bbox = dataIn{2};          % M‑by‑4

% Gri ise 3 kanala kopyala
if size(I,3)==1
    I = cat(3,I,I,I);
end

% Etiket sütunu – yalnızca tek sınıf var
label = repelem("tumor",size(bbox,1),1);   % M‑by‑1 string vektör

dataOut = {I , bbox , label};
end