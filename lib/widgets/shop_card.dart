import 'package:flutter/material.dart';
import 'package:music_albums_mobile/screens/shoplist_form.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color backgroundColor;

  ShopItem(this.name, this.icon, this.backgroundColor);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("You selected ${item.name}. Good choice!"),
            ));

          if (item.name == "Add Album") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopFormPage(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                item.icon,
                color: Colors.black,
                size: 48.0,
              ),
              const SizedBox(height: 12),
              Text(
                item.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
