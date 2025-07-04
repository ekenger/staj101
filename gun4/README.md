# 📘 Staj Günlüğü – 4. Gün  
📅 Tarih: 04.07.2025  
🏢 Firma: Enkur Enerji  
💼 Konu: Firebase Authentication ile Flutter Giriş/Kayıt Uygulaması  

---

### 🎯 Amaç  
Bugünkü çalışmada, mobil uygulamada güvenli kullanıcı yönetimi sağlamak amacıyla Firebase Authentication servisi Flutter üzerinden test ortamında entegre edildi. Kullanıcıların kayıt, giriş ve çıkış işlemlerini yapabileceği basit bir kimlik doğrulama arayüzü geliştirildi.  

---

### 🔐 Firebase Authentication Entegrasyonu  

- Firebase Console üzerinden yeni bir proje oluşturuldu.  
- Email/Password kimlik doğrulama yöntemi etkinleştirildi.  
- Terminal üzerinden FlutterFire CLI aracı projeye entegre edildi.  
  - `dart pub global activate flutterfire_cli` komutu ile CLI aracı yüklendi.  
  - `flutterfire configure` komutu ile Flutter projesi Firebase'e bağlandı.  
- firebase_core ve firebase_auth paketleri projeye eklendi.  
- createUserWithEmailAndPassword, signInWithEmailAndPassword ve signOut metodları kullanılarak temel kimlik doğrulama işlemleri test edildi.  

---

### 💻 Flutter Arayüz Geliştirme  

- Kayıt ve giriş ekranları tasarlandı.  
- TextField widget’ları ile e-posta ve şifre alanları oluşturuldu.  
- hintText, icon ve labelText gibi dekorasyon özellikleri kullanıldı.  
- Her giriş alanı için ayrı TextEditingController tanımlanarak önceki hata giderildi.  

---

### 🔍 Test Edilen Senaryolar  

- Hatalı e-posta formatı ve zayıf şifre girişlerinde SnackBar ile kullanıcı bilgilendirmesi.  
- Oturum açıkken çıkış işlemi sonrası giriş ekranına yönlendirme.  
- Kullanıcı girdilerinde trim() fonksiyonu ile veri temizliği.  
- try/catch blokları ile hata yönetimi ve geri bildirim.  

---

### ✅ Kazanımlar  

- Firebase Authentication servisinin Flutter ile nasıl entegre edileceği öğrenildi.  
- Kullanıcı yönetimi işlemleri pratikte uygulandı.  
- TextField, SnackBar, Navigator gibi widget’ların kimlik doğrulama süreçlerinde kullanımı kavrandı.  
- Hata yönetimi, kullanıcı geri bildirimi ve veri doğrulama pratikleri deneyimlendi.  

---

### 📂 Dosyalar  

- main.dart : Firebase ile giriş ve kayıt işlemlerini yöneten ana dosya  
- login_screen.dart : Giriş ekranı  
- register_screen.dart : Kayıt ekranı
