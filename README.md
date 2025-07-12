# Brain Tumor Analysis: A Deep Learning Application for Classification, Detection, and Segmentation

![MATLAB](https://img.shields.io/badge/Platform-MATLAB-orange.svg)

This project, developed for the "Deep Learning" course at Düzce University's Department of Computer Engineering, provides a comprehensive analysis of brain tumors from MRI (Magnetic Resonance Imaging) scans. Developed in MATLAB with the Deep Learning Toolbox, the project features a user-friendly GUI. The analysis is performed in two main stages:
1.  **Classification**: To determine if an MRI scan contains a tumor ("yes") or not ("no").
2.  **Detection & Segmentation**: To locate the tumor in a given image using the YOLOv2 algorithm and then to segment its boundaries using morphological image processing techniques.

---

## İçindekiler
- [Özellikler](#özellikler)
- [Uygulama Görüntüleri](#uygulama-görüntüleri)
- [Kullanılan Teknolojiler ve Modeller](#kullanılan-teknolojiler-ve-modeller)
- [Performans Sonuçları](#performans-sonuçları)
- [Kurulum ve Kullanım](#kurulum-ve-kullanım)
- [Proje Yapısı](#proje-yapısı)
- [Veri Seti](#veri-seti)

---

## Özellikler

* **Tümör Sınıflandırma**: Yüklenen bir beyin MR görüntüsünü, dört farklı derin öğrenme modelinden birini kullanarak sınıflandırır:
    * Özel Tasarım CNN Mimarisi
    * GoogLeNet (Transfer Öğrenme)
    * MobileNetV2 (Transfer Öğrenme)
    * ResNet-50 (Transfer Öğrenme)
* **Tümör Tespiti**: YOLOv2 (Darknet-19) modelini kullanarak görüntü üzerindeki tümörün konumunu sınırlayıcı bir kutu (bounding box) ile gösterir.
* **Tümör Segmentasyonu**: YOLOv2 ile tespit edilen tümör bölgesinin sınırlarını, MATLAB üzerinde geliştirilen morfolojik görüntü işleme teknikleri (eşikleme, erozyon, dilasyon vb.) ile hassas bir şekilde çizer.
* **Grafiksel Kullanıcı Arayüzü (GUI)**: Tüm bu işlemlerin MATLAB App Designer ile geliştirilmiş, kullanımı kolay tek bir arayüz üzerinden yapılmasına olanak tanır.

---

## Uygulama Görüntüleri

| Başlangıç Ekranı | Sınıflandırma Sonucu | YOLOv2 Tespit Sonucu | Morfolojik Segmentasyon |
| :---: | :---: | :---: | :---: |
<img src="https://github.com/user-attachments/assets/5adc3011-2ed9-4322-beb8-87777bda8e16"/> |  <img src=https://github.com/user-attachments/assets/eef85c47-13f4-4a51-b93b-5bced30270e2" width="200"/> | <img src="https://github.com/user-attachments/assets/c86a75fa-b5ba-43f8-bc87-694112cef880" width="200"/> | <img src="https://github.com/user-attachments/assets/49e3d80c-ba2d-43e4-8a43-da0742545581" width="200"/> | 




---

## Kullanılan Teknolojiler ve Modeller

- **Platform**: MATLAB R2024b
- **Araç Kutuları (Toolboxes)**:
    - Deep Learning Toolbox™
    - Image Processing Toolbox™
    - Computer Vision Toolbox™
- **Sınıflandırma Modelleri**: CNN, GoogLeNet, MobileNetV2, ResNet-50
- **Tespit Modeli**: YOLOv2 (Darknet-19 omurgası ile)
- **Segmentasyon Yöntemi**: Klasik morfolojik görüntü işleme operasyonları

---

## Performans Sonuçları

### 1. Sınıflandırma Performansı

Test veri seti üzerinde elde edilen sonuçlar:

| Model | Accuracy | Precision | Recall | F1-Score |
| :--- | :---: | :---: | :---: | :---: |
| **GoogLeNet** | **94.74%** | 0.9130 | **0.9545** | **0.9332** |
| MobileNetV2 | 89.47% | 0.9130 | **0.9545** | **0.9332** |
| Özel CNN | 89.47% | 0.8800 | 0.8800 | 0.8800 |
| ResNet-50 | 86.49% | **0.9500** | 0.8261 | 0.8840 |

### 2. Tespit (YOLOv2) Performansı

Test veri seti üzerinde `IoU=0.5` ve `Güven Eşiği=0.5` ile elde edilen sonuçlar:

| Metrik | Değer |
| :--- | :---: |
| **Precision** | 79.75% |
| **Recall (Sensitivity)** | 84.42% |
| **F1-Skoru** | 82.02% |
| **Tespit Sayıları** | 130 (TP), 33 (FP), 24 (FN) |

---

## Kurulum ve Kullanım

### Gereksinimler
- MATLAB R2024a veya daha yeni bir sürüm.
- MATLAB Deep Learning Toolbox™, Image Processing Toolbox™ ve Computer Vision Toolbox™ eklentilerinin yüklü olması.

### Adımlar
1.  **Depoyu Klonlayın:**
    ```bash
    git clone [https://github.com/your_username/Brain-Tumor-Analysis.git](https://github.com/your_username/Brain-Tumor-Analysis.git)
    cd Brain-Tumor-Analysis
    ```
2.  **Veri Setini İndirin:**
    * [Bu Kaggle linkinden](https://www.kaggle.com/datasets/navoneel/brain-mri-images-for-brain-tumor-detection) veri setini indirin.
    * İndirdiğiniz `brain_tumor_dataset` klasörünü projenin ana dizinindeki `dataset/` klasörünün içine kopyalayın. Yapının `dataset/brain_tumor_dataset/yes` ve `dataset/brain_tumor_dataset/no` şeklinde olduğundan emin olun.
    *(Not: Eğitim kodlarını çalıştırmak için bu adım gereklidir. Sadece uygulamayı kullanmak için gerekli değildir çünkü eğitilmiş modeller depoda mevcuttur.)*

3.  **Uygulamayı Çalıştırın:**
    * MATLAB'i açın ve proje klasörünü mevcut dizin olarak ayarlayın.
    * `src/` klasörü içindeki `BrainTumorAnalysisApp.mlapp` dosyasına çift tıklayarak uygulamayı başlatın.

4.  **Uygulamayı Kullanın:**
    * **Resim Seç** butonuna tıklayarak analiz etmek istediğiniz bir MR görüntüsünü seçin.
    * **Model Tipi** menüsünden bir sınıflandırma modeli seçin.
    * **Sınıflandır** butonuna basarak görüntünün tümörlü olup olmadığını öğrenin.
    * Sınıflandırma sonucu "yes" ise, **YOLOv2 Tespit** ve **Segmentasyon** butonlarına basarak ilgili analizleri görselleştirin.

---

## Proje Yapısı

```
Brain-Tumor-Analysis/
├── dataset/         # Veri setinin yerleştirileceği klasör
├── models/          # Eğitilmiş .mat model dosyaları
│   ├── classification/
│   └── detection/
├── src/             # Kaynak kodlar (.mlapp, .m)
├── .gitignore       # Göz ardı edilecek dosyalar
├── LICENSE          # Proje lisansı
└── README.md        # Bu dosya
```
---

## Veri Seti
Bu çalışmada, [Kaggle üzerinde bulunan "Brain MRI Images for Brain Tumor Detection"](https://www.kaggle.com/datasets/navoneel/brain-mri-images-for-brain-tumor-detection) veri seti kullanılmıştır. Veri seti, tümör içeren ("yes") ve içermeyen ("no") olarak etiketlenmiş toplam 253 adet MR görüntüsünden oluşmaktadır.

| Sınıf | Eğitim | Validasyon | Test | Toplam |
| :--- | :---: | :---: | :---: | :---: |
| **No** | 69 | 15 | 14 | **98** |
| **Yes** | 109 | 23 | 23 | **155** |
| **Toplam** | 178 | 38 | 37 | **253** |

<br>
