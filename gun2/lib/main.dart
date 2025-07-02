import 'package:flutter/material.dart';

void main() {
  runApp(StajWidgetDemo());
}

class StajWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Staj 2. Gün Widget Demo',
      home: WidgetDemoHomePage(),
    );
  }
}

class WidgetDemoHomePage extends StatefulWidget {
  @override
  _WidgetDemoHomePageState createState() => _WidgetDemoHomePageState();
}

class _WidgetDemoHomePageState extends State<WidgetDemoHomePage> {
  bool _switchValue = false;
  bool _checkboxValue = false;
  int _radioValue = 0;
  double _sliderValue = 0.0;
  String _textFieldValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Staj 2. Gün Widget Çalışması')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('FAB Tıklandı!')));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1- Text Widget',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Bu bir basit Text widget örneğidir.'),

            SizedBox(height: 20),

            Text(
              '2- Elevated Button',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Tıkla')),

            SizedBox(height: 20),

            Text(
              '3- TextField',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Bir şey yazın',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _textFieldValue = value;
                });
              },
            ),
            Text('Girdi: $_textFieldValue'),

            SizedBox(height: 20),

            Text(
              '4- Switch',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),

            SizedBox(height: 20),

            Text(
              '5- Checkbox',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text("Kullanım şartlarını kabul ediyorum."),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checkboxValue,
              onChanged: (value) {
                setState(() {
                  _checkboxValue = value!;
                });
              },
            ),

            SizedBox(height: 20),

            Text(
              '6- Radio Buttons',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value as int;
                    });
                  },
                ),
                Text('Seçenek 1'),
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = value as int;
                    });
                  },
                ),
                Text('Seçenek 2'),
              ],
            ),

            SizedBox(height: 20),

            Text(
              '7- Slider',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              min: 0,
              max: 100,
            ),
            Text('Slider Değeri: ${_sliderValue.toStringAsFixed(2)}'),

            SizedBox(height: 20),

            Text(
              '8- Progress Bar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            LinearProgressIndicator(value: _sliderValue / 100),

            SizedBox(height: 20),

            Text(
              '9- Lokal Resim',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/images/lenovo.png',
              height: 100,
              errorBuilder: (_, __, ___) => Text('Lokal resim bulunamadı.'),
            ),

            SizedBox(height: 20),

            Text(
              '10- İnternet Resim',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image.network('https://picsum.photos/200', height: 100),

            SizedBox(height: 20),

            Text(
              '11- GestureDetector',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Resme Tıklandı!')));
              },
              child: Container(
                color: Colors.amber,
                height: 50,
                width: 200,
                child: Center(child: Text('Tıklanabilir Alan')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
