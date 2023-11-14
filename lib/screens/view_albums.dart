import 'package:flutter/material.dart';
import 'package:music_albums_mobile/widgets/shop_card.dart';
//import 'package:music_albums_mobile/screens/shoplist_form.dart';

class ProductListPage extends StatelessWidget {
  final List<ShopItem> products; // Daftar album

  ProductListPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Collections'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ShopCard(products[index]); // GShopCard untuk menampilkan album
        },
      ),
    );
  }
}
