
# 📘 Staj Günlüğü – 17-20. Günler  
📅 Tarih: 24.07.2025 - 29.07.2025  
🏢 Firma: Enkur Enerji  
💼 Konu: TheMovieDB API Entegrasyonlu Flutter Projesi Geliştirimi  

---

## 🎯 Proje Genel Bakışı
Staj danışmanımın yönlendirmesiyle, dün edindiğim API entegrasyon bilgilerini pratiğe dökebileceğim gerçek bir proje geliştirdim. TheMovieDB API'sini kullanarak film bilgilerini listeleyen, detaylarını gösteren ve favori yönetimi yapabilen kapsamlı bir Flutter uygulaması oluşturdum.

---

## 📅 **17. GÜN - API Entegrasyon ve Model Oluşturma**

### 🚀 **Proje Kurulumu ve Environment Configuration**
- ✅ TheMovieDB API projesi klonlanıp `api-integration` klasörü oluşturuldu
- ✅ `.env.example` → `.env` kopyalanarak API key gizleme altyapısı kuruldu
- ✅ `flutter_dotenv` paketi entegre edildi
- ✅ `pubspec.yaml` güncellenip bağımlılıklar yüklendi

### 🔧 **Service Layer Geliştirimi**
```dart
// lib/services/movie_service.dart
class ApiService<T> {
  static String baseUrl = dotenv.env['API_BASE_URL'] ?? '';
  
  Future<T?> getMethod({
    required String endpoint,
    bool isLoad = true,
  }) async {
    try {
      if (isLoad) Grock.to(LoadingView());
      
      final response = await dio.get('$baseUrl$endpoint');
      
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      print('API Error: $e');
      if (isLoad) Grock.back();
      return null;
    }
  }
}
```

### 📊 **Model Katmanı Oluşturumu**
```dart
// lib/models/movie.dart
class Movie {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final DateTime? releaseDate;
  final double voteAverage;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] != null 
          ? DateTime.tryParse(json['release_date']) 
          : null,
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
    );
  }
}
```

### 🧪 **Testing ve Debugging**
- 📝 `test/sample_movie.json` ile birim testleri yazıldı
- 🔍 Postman ile endpoint testleri yapıldı
- 🐛 VS Code debugger ile adım adım kod izleme gerçekleştirildi

---

## 📅 **18. GÜN - Infinite Scroll ve UI Geliştirimi**

### ♾️ **Infinite Scroll Implementation**
```dart
// lib/screens/home_page.dart
class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  bool _isLoading = false;
  bool _isLastPage = false;
  
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }
  
  void _scrollListener() {
    if (_scrollController.position.pixels == 
        _scrollController.position.maxScrollExtent) {
      _loadMoreMovies();
    }
  }
  
  @override
  void dispose() {
    _scrollController.dispose(); // Critical: Memory leak prevention
    super.dispose();
  }
}
```

### 🚨 **Önemli Hata Düzeltmesi: ScrollController Yönetimi**
**Sorun:** “Denetleyici birden fazla kaydırma görünümüne bağlı” hatası
**Temel Neden:** ScrollController'ın imha edilmemesi
**Çözüm:** Uygun yaşam döngüsü yönetimi ile denetleyici temizliği

### 📱 **Kullanıcı Deneyimi İyileştirmeleri**
- 🔄 Otomatik scroll detection ile sayfa yükleme
- 🎯 "Daha fazla film yükle" manuel butonu eklendi
- ⚡ Loading spinner ve state management optimizasyonu
- 📱 Gerçek cihaz ve emülatör testleri tamamlandı

---

## 📅 **19. GÜN - Film Detayları ve Arama Özellikleri**

### 🎬 **Film Detay Sayfası Geliştirimi**
```dart
// lib/screens/detail_page.dart
class DetailPage extends StatelessWidget {
  final Movie movie;
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Text(movie.title, style: Theme.of(context).textTheme.headlineMedium),
          Text(movie.overview),
          Text('Rating: ${movie.voteAverage}/10'),
        ],
      ),
    );
  }
}
```

### 🔍 **Gerçek Zamanlı Arama Sistemi**
```dart
// lib/screens/search_page.dart
class SearchPage extends StatefulWidget {
  Timer? _debounceTimer;
  
  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(Duration(milliseconds: 500), () {
      _searchMovies(query);
    });
  }
  
  Future<void> _searchMovies(String query) async {
    setState(() => _isSearching = true);
    
    final response = await movieService.searchMovies(query);
    
    setState(() {
      _searchResults = response ?? [];
      _isSearching = false;
    });
  }
}
```

### ❤️ **Favori Yönetim Sistemi**
```dart
// Favorites Management with SharedPreferences
class FavoriteManager {
  static const String _favoritesKey = 'favorite_movies';
  
  static Future<void> toggleFavorite(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];
    
    if (favorites.contains(movieId.toString())) {
      favorites.remove(movieId.toString());
    } else {
      favorites.add(movieId.toString());
    }
    
    await prefs.setStringList(_favoritesKey, favorites);
  }
  
  static Future<bool> isFavorite(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList(_favoritesKey) ?? [];
    return favorites.contains(movieId.toString());
  }
}
```

### 📦 **Yeni Paket Entegrasyonları**
- 🖼️ `cached_network_image`: Görsel önbellekleme
- 💾 `shared_preferences`: Lokal veri saklama
- 🔍 Debounce mantığı ile performans optimizasyonu

---

## 📅 **20. GÜN - Testing, Optimizasyon ve Proje Tamamlama**

### 🧪 **Comprehensive Testing Strategy**

#### **Uçtan Uca Manuel Testler**
```dart
// Test Scenarios Covered:
✅ Çevrimdışı mod yönetimi
✅ Yavaş ağ performansı
✅ Sonsuz kaydırma kararlılığı
✅ Arama gecikme mekanizması
✅ Uygulama yeniden başlatıldığında favorilerin korunması
```

#### **Unit ve Widget Testleri**
```dart
// test/movie_model_test.dart
void main() {
  group('Movie Model Tests', () {
    test('should create Movie from JSON correctly', () {
      final movieJson = {
        'id': 123,
        'title': 'Test Movie',
        'overview': 'Test Overview',
        'poster_path': '/test.jpg',
        'release_date': '2023-01-01',
        'vote_average': 7.5
      };
      
      final movie = Movie.fromJson(movieJson);
      
      expect(movie.id, 123);
      expect(movie.title, 'Test Movie');
      expect(movie.voteAverage, 7.5);
    });
  });
}

// test/movie_card_widget_test.dart
void main() {
  testWidgets('MovieCard should render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MovieCard(movie: testMovie),
      ),
    );
    
    expect(find.text(testMovie.title), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
```

### ⚡ **Performans Optiminazyonları**

#### **Render Performansı**
```dart
// Const widgets for preventing unnecessary rebuilds
const MovieCard({
  Key? key,
  required this.movie,
}) : super(key: key);

// Optimized setState usage
void _updateFavoriteStatus() {
  setState(() {
    // Only update specific state, not entire widget tree
    _isFavorite = !_isFavorite;
  });
}
```

#### **Ağ Performansı**
```dart
// CachedNetworkImage optimization
CachedNetworkImage(
  imageUrl: imageUrl,
  placeholder: (context, url) => const SizedBox(
    height: 200,
    child: Center(child: CircularProgressIndicator()),
  ),
  errorWidget: (context, url, error) => const Icon(Icons.broken_image),
  memCacheWidth: 300, // Memory optimization
  memCacheHeight: 450,
)
```

### 📊 **Ağ Test Sonuçları**
- 🌐 **EDGE Network:** 3-5 saniye yükleme süresi
- 📶 **4G Network:** 1-2 saniye yükleme süresi
- ❌ **Offline Mode:** Graceful error handling ile UX korundu

### 📋 **Final Proje Mimari Tasarımı**
```
lib/
├── models/
│   └── movie.dart                 # Data models
├── services/
│   ├── api_service.dart          # HTTP client
│   └── movie_service.dart        # Movie-specific API calls
├── screens/
│   ├── home_page.dart           # Movie listing with infinite scroll
│   ├── detail_page.dart         # Movie details view
│   └── search_page.dart         # Search functionality
├── widgets/
│   └── movie_card.dart          # Reusable movie card component
└── utils/
    └── favorite_manager.dart     # Local storage utilities
```

---

## 🏆 **Proje Kazanımları ve Teknik Öğrenmeler**

### 💡 **API Entegrasyonu Uzmanlığı**
- ✅ RESTful API consumption ve error handling
- ✅ Environment variables ile güvenli configuration
- ✅ Dio HTTP client ile advanced interceptors
- ✅ Response parsing ve model transformation

### 🎨 **Gelişmiş Flutter Geliştirme**
- ✅ ScrollController yaşam döngüsü yönetimi
- ✅ Performans optimizasyon teknikleri
- ✅ Durum yönetimi en iyi uygulamaları
- ✅ Widget testi ve birim testi

### 📱 **Kullanıcı Deneyimi Tasarımı**
- ✅ Sonsuz kaydırma uygulaması
- ✅ Debouncing ile gerçek zamanlı arama
- ✅ Yerel veri kalıcılığı
- ✅ Çevrimdışı öncelikli tasarım modelleri

### 🧪 **Kalite Güvencesi**
- ✅ Kapsamlı manuel testler
- ✅ Birim test kapsamı
- ✅ Performans profili oluşturma
- ✅ Cihazlar arası uyumluluk

---

## 🔗 **Proje Reposu**
📂 **GitHub:** [movie-app](https://github.com/ekenger/movie-app)
📄 **API Docs:** TheMovieDB API documentation referansları  

---

## 🎉 **Sonuç**

17-20. günler boyunca TheMovieDB API entegrasyonlu kapsamlı bir Flutter projesi geliştirdim. Bu süreçte hem backend entegrasyonu hem de advanced Flutter development tekniklerini pratik olarak uyguladım. Proje, infinite scroll, gerçek zamanlı arama, favori yönetimi ve kapsamlı test coverage ile production-ready seviyede tamamlandı.

**Staj sürecinin bu final projesi**, edindiğim tüm bilgilerin pratiğe dökülmesi ve gerçek bir mobil uygulama geliştirme deneyimi yaşamam açısından son derece değerli oldu.
