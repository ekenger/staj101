import 'package:flutter/material.dart';

void main() {
  runApp(InverterApp());
}

class InverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inverter Durum Takibi',
      theme: ThemeData(primarySwatch: Colors.green),
      home: InverterHomePage(),
    );
  }
}

class InverterHomePage extends StatefulWidget {
  @override
  _InverterHomePageState createState() => _InverterHomePageState();
}

class _InverterHomePageState extends State<InverterHomePage> {
  String _selectedMode = 'Normal Mod';

  // SnackBar gösterme fonksiyonu
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }

  // AlertDialog gösterme fonksiyonu
  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Kullanıcı onay verene kadar kapanmasın
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kritik Inverter Alarmı'),
          content: Text(
            'Bu alarm kritik bir durumu işaret ediyor. Devam etmek istiyor musunuz?',
          ),
          actions: <Widget>[
            TextButton(
              child: Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar(context, 'İşlem iptal edildi.');
              },
            ),
            ElevatedButton(
              child: Text('Onayla'),
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar(context, 'Alarm onaylandı.');
              },
            ),
          ],
        );
      },
    );
  }

  // PopupMenuButton seçenekleri
  List<String> _modes = ['Normal Mod', 'Bakım Modu', 'Acil Durum Modu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inverter Durum Takibi'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String mode) {
              setState(() {
                _selectedMode = mode;
              });
              _showSnackBar(context, '$mode seçildi.');
            },
            itemBuilder: (BuildContext context) {
              return _modes.map((String mode) {
                return PopupMenuItem<String>(value: mode, child: Text(mode));
              }).toList();
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seçilen Mod: $_selectedMode',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _showSnackBar(context, 'Inverter alarmı tetiklendi!');
              },
              child: Text('SnackBar Göster (Alarm Uyarısı)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              child: Text('AlertDialog Göster (Kritik Onay)'),
            ),
          ],
        ),
      ),
    );
  }
}
