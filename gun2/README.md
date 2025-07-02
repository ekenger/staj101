# Staj Günlüğü – 2. Gün  
📅 **Tarih:** 02.07.2025  
🏢 **Firma:** Enkur Enerji  
💼 **Konu:** Web Uygulaması UX Testleri ve Flutter Widget Çalışmaları

---

## 📌 Amaç

Bugünkü staj sürecinde, Enkur Enerji’nin kullanıcı deneyimini artırmaya yönelik web platformunda UX testleri gerçekleştirdim. Ardından mobil uygulamada kullanılacak temel Flutter widget’ları üzerinde detaylı çalışmalar yaparak projeye katkı sağlamak için hazırlık yaptım.

---

## 🧪 UX Test Çalışmaları

### 🔎 **Test Edilen Modül:** Ay Sonu Endeks ve Alarm Sistemi

- Platformdaki sayaç alarm bildirimlerinin doğruluğunu kontrol etmek için test senaryoları hazırladım.
- Gerçek tüketim farkları ile alarm farklarının uyumlu olup olmadığını tespit ettim.

### 🗂️ **Tespit Edilen Hatalar:**

| Sayaç Adı | Türü | Alarm Farkı | Gerçek Fark |
|-----------|------|--------------|--------------|
| SAYAÇ 1 | Çekiş | 226.80 | 7.56 |
| SAYAÇ 2 | Veriş | 3,811,477.95 | 9.45 |
| ... | ... | ... | ... |

📌 **Not:** Bazı sayaçlarda alarm tetikleme değerlerinin gerçek değerlerle tutarsız olduğu görüldü. Örneğin, gerçek fark 7.56 olmasına rağmen alarm 226.80 olarak bildiriliyor. Bu tespitler staj sorumluma rapor şeklinde sunuldu.

---

## ✅ **Ek Hata Analizi**

- Endüktif Reaktif & Kapasitif Reaktif ceza alarm verilerinde de sapmalar bulundu.
- UX test sonuçları, veri doğrulama modüllerinde güncellemeye ihtiyaç olduğunu gösteriyor.

---

## 💻 Flutter Widget Çalışmaları

Öğleden sonra, mobil uygulama arayüzünde sık kullanılacak temel widget bileşenlerine hakimiyet kazandım.

### 📚 **Bugün Detaylı Çalışılan Widget’lar:**

1. **Temel Bileşenler:**  
   - Text, TextField, ElevatedButton, TextButton

2. **Özelleştirmeler:**  
   - Text stilleri, renk, font ayarları  
   - TextField input tipi, hint text, ikon kullanımı

3. **Kullanıcı Etkileşimi:**  
   - Switch, ToggleButtons, CheckBox, RadioButton, Slider

4. **Layout & Görsel:**  
   - Image.asset(), Image.network(), FadeInImage.assetNetwork()
   - ScrollView kullanımı
   - FloatingActionButton, GestureDetector

5. **Tarih ve Zaman Seçimi:**  
   - TimePicker, DatePicker

6. **DropDown ve ProgressBar:**  
   - DropDownButton ile seçim işlemleri
   - LinearProgressIndicator

7. **Web İçeriği:**  
   - WebView widget ile platform bağımsız içerik gösterimi

---

## 🎯 **Kazançlarım**

- UX testleri sayesinde Enkur Enerji’nin web platformundaki olası yanlış alarm bildirimlerini erken aşamada tespit ettim.
- Flutter’da kullanıcı etkileşimini artıracak temel widget’ların hem tasarım hem de işlevsel yönlerini kod örnekleriyle pekiştirdim.

---

## ✏️ **Notlar**

UX test raporu sorumluya teslim edilerek gerekli aksiyonların planlanması sağlandı. Flutter tarafında ilerleyen günlerde bu widget’lar gerçek sayaç verisiyle entegre edilerek canlı projeye dahil edilecek.
