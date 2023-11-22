import 'package:flutter/material.dart';
import 'package:music_albums_mobile/widgets/left_drawer.dart';
import 'package:music_albums_mobile/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("View Albums", Icons.checklist, Color.fromARGB(255, 206, 237, 199)), // Ganti warna latar belakang sesuai preferensi Anda
    ShopItem("Add Album", Icons.add_shopping_cart, Color.fromARGB(255, 255, 246, 189)), // Ganti warna latar belakang sesuai preferensi Anda
    ShopItem("Logout", Icons.logout, Color.fromARGB(255, 255, 212, 178)), // Ganti warna latar belakang sesuai preferensi Anda
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Music Albums',
        ),
        backgroundColor: Color.fromARGB(255, 134, 200, 188),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'My Album Shelf',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
