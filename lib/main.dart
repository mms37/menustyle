import 'package:flutter/material.dart';

void main() {
  runApp(MenuUygulamasi());
}

class MenuUygulamasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final _horizontalScrollController = ScrollController();
  final _verticalScrollController = ScrollController();

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menü Uygulaması'),
      ),
      drawer: SolMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _horizontalScrollController,
              itemCount: 10,
              itemBuilder: (context, index) {
                return FakeUrunCard();
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _verticalScrollController,
              itemCount: 10,
              itemBuilder: (context, index) {
                return UrunCard(
                  baslik: 'Ürün ${index + 1}',
                  aciklama: 'Açıklama ${index + 1}',
                  resimUrl: 'assets/resim_url_${index + 1}.jpg', // Örnek resim ismi
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SolMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Menü', style: TextStyle(fontSize: 20, color: Colors.white)),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Ürünler', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => UrunlerSayfasi()));
            },
          ),
          ListTile(
            title: Text('Ayarlar', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => AyarlarSayfasi()));
            },
          ),
          ListTile(
            title: Text('Hakkımda', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => HakkimdaSayfasi()));
            },
          ),
        ],
      ),
    );
  }
}

class FakeUrunCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8),
      color: Colors.grey[300],
      child: Center(
        child: Text('Fake Ürün', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class UrunCard extends StatelessWidget {
  final String baslik;
  final String aciklama;
  final String resimUrl;

  UrunCard({required this.baslik, required this.aciklama, required this.resimUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Image.asset(
          resimUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(
          baslik,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          aciklama,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}

class UrunlerSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürünler'),
      ),
      body: Center(
        child: Text('Ürünler Sayfası'),
      ),
    );
  }
}

class AyarlarSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: Center(
        child: Text('Ayarlar Sayfası'),
      ),
    );
  }
}

class HakkimdaSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkımda'),
      ),
      body: Center(
        child: Text('Bu uygulama Mert Mustafa Şen tarafından deneme amacıyla geliştirilmiştir '),
      ),
    );
  }
}
