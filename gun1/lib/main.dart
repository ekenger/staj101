import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// Ana uygulama widget'ı.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Staj Uygulaması 1. Gün',
      home: HomePage(),
    );
  }
}

/// Giriş ekranı (StatelessWidget)
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ana Sayfa')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(username: 'Ahmet'),
              ),
            );
          },
          child: Text('Profil Sayfasına Git'),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  final String username;

  ProfilePage({required this.username});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> items = ['Veri 1', 'Veri 2'];

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Simülasyon
    return "Sunucudan veri geldi.";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Geri tuşuna özel davranış
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Geri tuşuna basıldı")));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('${widget.username}\'in Profili')),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  items.add('Yeni Veri');
                });
              },
              child: Text('Yeni Veri Ekle'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) => ListTile(title: Text(items[index])),
              ),
            ),
            FutureBuilder<String>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return Text(snapshot.data!);
                } else {
                  return Text('Veri alınamadı.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
