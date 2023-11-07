Nama : Carissa Aida Zahra
NPM : 2206082543
Kelas : PBP D

## Tugas 7
*1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?*
*Stateless Widget*
- Tidak menyimpan keadaan internal dan kontennya tetap konstan. Biasanya digunakan untuk komponen yang statis dan tidak berubah, seperti teks, ikon, atau tampilan yang tidak tergantung pada data yang berubah.
- Lebih efisien karena tidak memerlukan pembaruan berkelanjutan. Dibangun sekali dan tidak mengalami perubahan selama siklus hidup widget.
- Mudah digunakan dan cocok untuk tampilan yang sederhana tanpa interaksi pengguna yang kompleks.

*Stateful Widget*
- Memiliki keadaan internal yang dapat berubah selama siklus hidup widget. Digunakan untuk komponen yang perlu diperbarui secara dinamis, seperti daftar item yang dapat diperbarui atau formulir.
- Memungkinkan pembaruan dinamis dan dapat merespons interaksi pengguna. Misalnya, dapat merespons tindakan seperti ketukan atau gesekan.
- Lebih kompleks karena memerlukan kode tambahan untuk mengelola keadaan dan pemahaman yang lebih mendalam tentang siklus hidup widget.

*2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing*

- MyHomePage: Widget khusus StatelessWidget ini mewakili halaman utama aplikasi. Ini berisi daftar item toko dan menggunakan GridView untuk menampilkan kartu-kartu toko. Tujuannya adalah untuk menampilkan daftar item toko dalam tata letak halaman utama.
- Icon: Widget ini adalah bagian dari Flutter dan digunakan untuk menampilkan ikon dalam aplikasi. Dalam tugas ini, Icon digunakan untuk menampilkan ikon yang sesuai dengan setiap item toko.
- ShopCard: Widget khusus StatelessWidget ini digunakan untuk membuat kartu yang menampilkan item toko. Widget ini memiliki tiga atribut: nama, ikon, dan warna. Tujuannya adalah untuk menampilkan item toko dalam bentuk kartu dengan ikon, teks, dan latar belakang yang sesuai.
- Material: Widget ini adalah bagian dari Flutter dan digunakan untuk mengatur latar belakang kartu dalam ShopCard.
- InkWell: Widget ini adalah bagian dari Flutter dan digunakan untuk menambahkan efek “sentuhan” ke dalam kartu dalam ShopCard. Ketika pengguna mengetuk kartu, efek sentuhan ditampilkan dan tindakan tertentu dapat diambil.
- ShopItem: Kelas data ini mewakili item toko. Ini memiliki tiga atribut: nama, ikon, dan warna. Ini digunakan untuk membuat objek yang mewakili setiap item toko dengan informasi yang sesuai.
- Scaffold: Widget ini adalah bagian dari Flutter dan digunakan untuk membuat tata letak dasar aplikasi, termasuk AppBar dan body. Dalam MyHomePage, Scaffold digunakan untuk membuat tata letak halaman utama aplikasi.
- AppBar: Widget ini digunakan untuk membuat bilah atas (app bar) dalam Scaffold. Ini menampilkan judul aplikasi dan latar belakang yang sesuai.
- Text: Widget ini adalah bagian dari Flutter dan digunakan untuk menampilkan teks dalam aplikasi. Dalam tugas ini, Text digunakan untuk menampilkan judul “Music Albums” dan nama item toko.

*3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)*

### Instalasi Flutter dan Pembuatan Proyek
Untuk mengimplementasikan tugas ini, pertama saya menginstall flutter di device saya terlebih dahulu. Kemudian saya membuka _command prompt_ pada direktori tempat saya akan menyimpan proyek ini. Lalu, saya membuat proyek dengan perintah berikut

```
flutter create music-albums-mobile
cd music-albums-mobile
flutter run
```

### Merapikan Struktur Proyek
Setelah proyek berhasil dibuat, pada direktori music-albums-mobile/lib saya menambahkan file `main.dart` dan `menu.dart`. Pada `menu.dart` saya menambahkan kode berikut pada baris pertama

```
import 'package:flutter/material.dart';
```

Dari file `main.dart`, pindahkan (cut) kode baris ke-39 hingga akhir yang berisi kedua class di bawah ini:

class MyHomePage ... {
    ...
}

class _MyHomePageState ... {
    ...
}

ke file `menu.dart`.


Sedangkan pada file `menu.dart` saya menambahkan kode berikut pada baris pertamanya

```
import 'package:music-albums-mobile/menu.dart';
```

### Membuat widget sederhana
Selanjutnya saya akan mengubah sifat _widget_ halaman menu menjadi _stateless_.

Pada file `main.dart`, hapus `MyHomePage(title: 'Flutter Demo Home Page')` sehingga menjadi:

```
MyHomePage()
```

Pada file `menu.dart`, saya mengubah bagian `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`. Hapus `final String title;` sampai bawah serta tambahkan Widget build sehingga kode terlihat seperti di bawah serta menghabus fungsi state yang ada dibawah bagian stateless widget.

```
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```
### Menambahkan Teks dan Card
Untuk menambahkan teks dan card dimulai dengan define tipe pada list

```
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```

Lalu dibawah kode `MyHomePage({Key? key}) : super(key: key);``, tambahkan barang-barang yang dijual (nama, harga, dan icon barang tersebut).

```
final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist),
    ShopItem("Tambah Produk", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
];
```

Setelah menambahkan customisasi pewarnaan card di dalam widget build, berikut adalah tampilan akhir dari `menu.dart`.

```
import 'package:flutter/material.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Set the color based on the ShopItem
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!"),
            ));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist, Color.fromARGB(255, 54, 192, 175)),
    ShopItem("Tambah Produk", Icons.add_shopping_cart, Color.fromARGB(255, 228, 210, 8)),
    ShopItem("Logout", Icons.logout, Color.fromARGB(255, 243, 72, 33)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Music Albums',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 54, 192, 175),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Music Albums',
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

```