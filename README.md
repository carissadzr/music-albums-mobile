### Carissa Aida Zahra (2206082543) - PBP D
Current README.md : Tugas 7, 8


## Tugas 7
**1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?**
**Stateless Widget**
- Tidak menyimpan keadaan internal dan kontennya tetap konstan. Biasanya digunakan untuk komponen yang statis dan tidak berubah, seperti teks, ikon, atau tampilan yang tidak tergantung pada data yang berubah.
- Lebih efisien karena tidak memerlukan pembaruan berkelanjutan. Dibangun sekali dan tidak mengalami perubahan selama siklus hidup widget.
- Mudah digunakan dan cocok untuk tampilan yang sederhana tanpa interaksi pengguna yang kompleks.

**Stateful Widget**
- Memiliki keadaan internal yang dapat berubah selama siklus hidup widget. Digunakan untuk komponen yang perlu diperbarui secara dinamis, seperti daftar item yang dapat diperbarui atau formulir.
- Memungkinkan pembaruan dinamis dan dapat merespons interaksi pengguna. Misalnya, dapat merespons tindakan seperti ketukan atau gesekan.
- Lebih kompleks karena memerlukan kode tambahan untuk mengelola keadaan dan pemahaman yang lebih mendalam tentang siklus hidup widget.

**2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing**

- MyHomePage: Widget khusus StatelessWidget ini mewakili halaman utama aplikasi. Ini berisi daftar item toko dan menggunakan GridView untuk menampilkan kartu-kartu toko. Tujuannya adalah untuk menampilkan daftar item toko dalam tata letak halaman utama.
- Icon: Widget ini adalah bagian dari Flutter dan digunakan untuk menampilkan ikon dalam aplikasi. Dalam tugas ini, Icon digunakan untuk menampilkan ikon yang sesuai dengan setiap item toko.
- ShopCard: Widget khusus StatelessWidget ini digunakan untuk membuat kartu yang menampilkan item toko. Widget ini memiliki tiga atribut: nama, ikon, dan warna. Tujuannya adalah untuk menampilkan item toko dalam bentuk kartu dengan ikon, teks, dan latar belakang yang sesuai.
- Material: Widget ini adalah bagian dari Flutter dan digunakan untuk mengatur latar belakang kartu dalam ShopCard.
- InkWell: Widget ini adalah bagian dari Flutter dan digunakan untuk menambahkan efek “sentuhan” ke dalam kartu dalam ShopCard. Ketika pengguna mengetuk kartu, efek sentuhan ditampilkan dan tindakan tertentu dapat diambil.
- ShopItem: Kelas data ini mewakili item toko. Ini memiliki tiga atribut: nama, ikon, dan warna. Ini digunakan untuk membuat objek yang mewakili setiap item toko dengan informasi yang sesuai.
- Scaffold: Widget ini adalah bagian dari Flutter dan digunakan untuk membuat tata letak dasar aplikasi, termasuk AppBar dan body. Dalam MyHomePage, Scaffold digunakan untuk membuat tata letak halaman utama aplikasi.
- AppBar: Widget ini digunakan untuk membuat bilah atas (app bar) dalam Scaffold. Ini menampilkan judul aplikasi dan latar belakang yang sesuai.
- Text: Widget ini adalah bagian dari Flutter dan digunakan untuk menampilkan teks dalam aplikasi. Dalam tugas ini, Text digunakan untuk menampilkan judul “Music Albums” dan nama item toko.

**3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)**

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

```
class MyHomePage ... {
    ...
}

class _MyHomePageState ... {
    ...
}

```
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

## Tugas 8
**1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**

**Metode push():** Metode ini digunakan untuk menambahkan sebuah route baru ke dalam tumpukan (stack) route yang diatur oleh Navigator. Ketika metode ini dipanggil, route yang ditambahkan akan ditempatkan di posisi teratas stack. Ini berarti route ini akan langsung ditampilkan kepada pengguna. Metode push() sangat berguna untuk menavigasi ke halaman baru tanpa menghilangkan riwayat navigasi sebelumnya, memungkinkan pengguna untuk kembali ke route sebelumnya jika diperlukan.

**Metode pop():** Metode ini digunakan untuk menghapus route paling atas dari stack route. Ini biasanya route yang saat ini ditampilkan pada layar pengguna. Dengan menghapus route ini, Navigator kemudian akan menampilkan route yang berada tepat di bawahnya dalam stack. Metode ini sering digunakan untuk kembali ke halaman sebelumnya, seperti tombol "kembali" pada banyak aplikasi.

**Metode pushReplacement():** Metode ini adalah kombinasi dari push() dan pop(). Ia menghapus route yang saat ini ditampilkan (seperti pop()) dan segera menggantikannya dengan route baru (seperti push()). Ini berguna ketika ingin menavigasi ke halaman baru tetapi tidak ingin pengguna dapat kembali ke halaman saat ini, misalnya setelah menyelesaikan proses atau transaksi.


**2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!**
- **Column dan Row:** Untuk layout linear vertikal dan horizontal. Column mengatur child widgets secara vertikal, sementara Row mengaturnya secara horizontal. Cocok untuk membuat layout yang sederhana dan linear.
- **Stack:** Memungkinkan widget ditumpuk satu di atas yang lain. Berguna untuk membuat overlay atau efek yang membutuhkan posisi widget secara bebas.
- **Container:** Widget serba guna yang dapat dikonfigurasi untuk spacing, padding, border, dan background. Cocok untuk wrapping widget lain dengan karakteristik tertentu.
- **GridView:** Menampilkan item dalam grid. Berguna untuk menampilkan data dalam bentuk grid seperti galeri foto atau kisi produk.
- **ListView:** Menampilkan daftar item yang bisa scroll. Cocok untuk daftar item seperti daftar email atau feed berita.
- **Flex dan Expanded:** Untuk membuat layout yang fleksibel dengan menggunakan konsep flexbox. Expanded mengambil ruang yang tersedia, berguna untuk menyesuaikan child widget dalam Flex.

**3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**

TextFormField digunakan untuk memungkinkan pengguna memasukkan teks serta memberikan fitur tambahan seperti validasi input, yang memudahkan pengelolaan form
- **Album Title:** Untuk judul album
- **Amount of Songs:** Untuk jumlah lagu, dengan validasi untuk memastikan input adalah angka
- **Description:** Untuk deskripsi album

**4. Bagaimana penerapan clean architecture pada aplikasi Flutter?**
Clean Architecture di Flutter melibatkan pemisahan kode menjadi lapisan yang berbeda, yaitu
- **Presentation Layer:** Terdiri dari widgets dan screens. Fokus pada bagaimana aplikasi terlihat dan berinteraksi dengan pengguna.
- **Business Logic Layer (BLL):** Berisi logic aplikasi. Di sini, penggunaan Provider, Bloc, atau MobX dapat membantu dalam mengelola state dan logic aplikasi.
- **Data Layer:** Terdiri dari model data, akses database, dan network calls. Fokus pada pengelolaan data aplikasi.

**5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)**

### Tutorial: Menambahkan Drawer Menu Untuk Navigasi
Pertama, buat berkas baru di dalam direktori baru widgets dengan nama `left_drawer.dart.` lalu ambahkan kode berikut ke dalam berkas `left_drawer.dart.`

```
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
          ),
          // TODO: Bagian routing
        ],
      ),
    );
  }
}
```

Berikutnya, tambahkan impor untuk halaman-halaman yang kita ingin masukkan navigasinya ke dalam Drawer Menu. Pada contoh ini, kita akan menambahkan navigasi ke halaman MyHomePage dan ShopFormPage serta memasukkan routing untuk halaman-halaman yang diimpor

```
import 'package:flutter/material.dart';
import 'package:music_albums_mobile/menu.dart';
// halaman ShortFormPage

...
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Halaman Utama'),
  // Bagian redirection ke MyHomePage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Tambah Produk'),
  // Bagian redirection ke ShopFormPage
  onTap: () {
    /*
    TODO: Buatlah routing ke ShopFormPage di sini,
    setelah halaman ShopFormPage sudah dibuat.
    */
  },
),
...

```

Lalu hias drawer dengan potongan kode berikut lalu masukkan drawer tersebut ke halaman yang ingin kamu tambahkan drawer. Dalam hal ini saya memasukkannya ke dalam file `menu.dart.`

```
...
const DrawerHeader(
  decoration: BoxDecoration(
    color: Color.fromARGB(255, 134, 200, 188),
  ),
  child: Column(
    children: [
      Text(
        'Music Albums',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Padding(padding: EdgeInsets.all(10)),
      Text(
        "Keep track of your favorite albums!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
...

// menu.dart

// Impor drawer widget
import 'package:music_albums_mobile/widgets/left_drawer.dart';

...
return Scaffold(
  appBar: AppBar(
    title: const Text(
      'Shopping List',
    ),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
  drawer: const LeftDrawer(),
...
``` 

Tambahkan pula drawer ke halaman ShopFormPage jika halaman tersebut sudah dibuat.

### Tutorial: Menambahkan Form dan Elemen Input
Buat berkas baru pada direktori `lib` dengan nama `shoplist_form.dart` lalu tambahkan potongan kode berikut

```
import 'package:flutter/material.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    @override
    Widget build(BuildContext context) {
        return Placeholder();
    }
}
```

Ubah widget Placeholder dengan potongan kode berikut agar terdapat wadah bagi input field widget dan membuat child widget bisa di scroll.

```
Scaffold(
  appBar: AppBar(
    title: const Center(
      child: Text(
        'Form Tambah Produk',
      ),
    ),
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  ),
  // TODO: Tambahkan drawer yang sudah dibuat di sini
  body: Form(
    child: SingleChildScrollView(),
  ),
);

```

Untuk menambahkan handler dari form state, validasi form, dan penyimpanan form, buat variabel baru bernama `_formKey` lalu tambahkan ke dalam atribut `key` milik widget Form. Setelah itu, buat beberapa variabel untuk menyimpan input dari tiap field yang akan dibuat.


```
...
class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
...

...
body: Form(
     key: _formKey,
     child: SingleChildScrollView(),
),
...

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
...

```

Buatlah widget Column sebagai child dari SingleChildScrollView.

```
...
body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column()
      ),
...
```

Buatlah widget TextFormField yang dibungkus oleh Padding sebagai salah satu children dari widget Column. Setelah itu, tambahkan atribut `crossAxisAlignment` untuk mengatur alignment children dari Column.

```
...
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Album Title",
          labelText: "Album Title",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _name = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Title cannot be empty!";
          }
          return null;
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Amount of Songs",
          labelText: "Amount of Songs",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _amount = int.parse(value!); 
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Harga tidak boleh kosong!";
          }
          if (int.tryParse(value) == null) {
            return "amount value must be a number!";
          }
          return null;
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Description",
          labelText: "Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _description = value!; 
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Description cannot be empty!";
          }
          return null;
        },
      ),
    ),
...
```

Buatlah tombol sebagai child selanjutnya dari Column. Bungkus tombol ke dalam widget Padding dan Align. Kali ini kita tidak akan menyimpan data ke dalam database, namun kita akan memunculkannya pada pop-up yang akan muncul setelah tombol ditekan.

```
...
Align(
  alignment: Alignment.bottomCenter,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Colors.indigo),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
      child: const Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
    ),
  ),
),
...
```

### Tutorial: Memunculkan Data
Untuk memunculkan data, tambahkan fungsi showDialog() pada bagian onPressed() dan munculkan widget AlertDialog pada fungsi tersebut dan tambahkan ke reset form.

```
...
child: ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 212, 178)),
  ),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Album has been successfully added!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Album Title: $_name'),
                  Text('Amount of Songs: $_amount'),
                  Text('Description: $_description'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      _formKey.currentState!.reset();
    }
  },
  child: const Text(
    "Save",
    style: TextStyle(color: Colors.black),
  ),
),
...
```

### Tutorial: Menambahkan Fitur Navigasi pada Tombol
Pada widget ShopItem pada file `menu.dart` yang sudah dibuat, tambahkan kode ScaffoldMessenger yang menampilkan snackbar agar kode yang terletak pada atribut onTap dari InkWell dapat melakukan navigasi ke route lain. Gunakan Navigator.push() agar pengguna dapat menekan tombol Back untuk kembali ke halaman menu dan Navigator.pop() agar membuat kode dalam program untuk kembali ke halaman menu.

```
...
  onTap: () {
    // Memunculkan SnackBar ketika diklik
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text("Kamu telah menekan tombol ${item.name}!")));

    // Navigate ke route yang sesuai (tergantung jenis tombol)
    if (item.name == "Tambah Produk") {
      // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
    }

  },
...
```

## Tugas 9
**1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**
Mengambil data JSON tanpa membuat model terlebih dahulu adalah sebuah pendekatan yang bisa dilakukan dalam pengembangan aplikasi. Pendekatan ini memungkinkan kita untuk menguraikan data JSON langsung ke dalam struktur data dasar seperti Map atau List di Dart, tanpa perlu mendefinisikan kelas model terlebih dahulu. Ini bisa sangat berguna untuk prototyping cepat atau dalam situasi di mana struktur JSON sering berubah, sehingga mengurangi kebutuhan untuk terus menerus mengupdate model data.Namun, tanpa model, kode bisa menjadi kurang terstruktur dan lebih sulit untuk dibaca. Membuat model data membantu dalam validasi data, mengurangi kesalahan saat runtime, dan memudahkan dalam pemahaman struktur data yang digunakan. Model juga memfasilitasi refactor atau perubahan dalam aplikasi dengan lebih mudah. Secara umum, menggunakan model adalah praktek yang lebih baik untuk aplikasi yang lebih besar dan kompleks, di mana kejelasan kode dan kemudahan maintenance menjadi penting.

**2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter**
CookieRequest di Flutter adalah kelas yang digunakan untuk menangani cookie dalam permintaan HTTP. Kelas ini memiliki peran penting dalam menyimpan, mengirim, dan menerima cookie saat berkomunikasi dengan server. Penggunaan cookie sangat penting dalam aplikasi web dan mobile untuk mengelola sesi pengguna, menyimpan preferensi, dan melaksanakan proses autentikasi.

**3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter**
- Fetch Data: Gunakan paket seperti http untuk melakukan request HTTP ke server yang mengembalikan data JSON.
- Parse JSON: Uraikan respons JSON menjadi struktur data Dart menggunakan `json.decode().`
- Display Data: Gunakan data yang diuraikan untuk membangun widget di Flutter, seperti ListView atau Text.

**4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**
- Input Data Akun: Pengguna memasukkan data akun (misalnya, username dan password) di Flutter.
- Kirim ke Django: Data dikirim ke server Django melalui request HTTP POST.
- Proses di Django: Django memproses data, melakukan autentikasi, dan mengembalikan respons (misalnya, token autentikasi).
- Tampil menu di Flutter: Setelah autentikasi berhasil, Flutter menerima respons dan menampilkan menu atau navigasi selanjutnya.

**5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**
- **MaterialApp:** Widget ini membungkus sejumlah widget yang membentuk aplikasi yang menggunakan material design. Di sini, ia menetapkan tema aplikasi dan halaman awal.
-**Scaffold:** Menyediakan kerangka dasar untuk tata letak visual material design, seperti appbars, body, floating action buttons, drawers, dan lainnya.
- **AppBar:** Widget ini menampilkan bar di bagian atas layar, biasanya menampilkan judul dan sering digunakan untuk navigasi.
- **Container:** Menyediakan kotak yang dapat di-styling untuk elemen-elemen lain. Di sini, digunakan untuk padding di halaman login.
- **Column:** Memungkinkan Anda menyusun sejumlah widget secara vertikal.
- **TextField:** Widget input teks, digunakan untuk memasukkan username dan password.
- **ElevatedButton:** Sebuah tombol yang sedikit terangkat dari permukaannya yang menyediakan feedback visual ketika ditekan.
- **ListView:** Menyediakan daftar yang dapat discroll. Di sini, digunakan di dalam Drawer.
- **Drawer:** Panel slide-out menu yang biasanya berisi list dari menu atau navigasi.
- **DrawerHeader:** Bagian atas drawer yang biasanya menampilkan informasi penting seperti judul.
- **ListTile:** Baris dengan ikon dan teks yang biasanya digunakan dalam ListView, seperti dalam drawer di aplikasi ini.
- **GridView:** Menampilkan widget dalam grid dua dimensi. Di sini, digunakan untuk menampilkan item-item dalam format grid.
- **ShopCard:** Custom widget (asumsi berdasarkan konteks), kemungkinan digunakan untuk menampilkan informasi dalam format kartu.
- **Form:** Mengelompokkan beberapa FormField widget dan bertindak sebagai container untuk form.
- **TextFormField:** Sebuah TextField khusus yang digunakan dalam form untuk memasukkan data.
- **Padding:** Widget yang menambahkan padding di sekitar child widget-nya.
- **Align:** Menyelaraskan child widget-nya dalam dirinya sendiri.
- **Text:** Menampilkan string teks dengan berbagai styling.

**6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)**

### Tutorial: Integrasi Autentikasi Django-Flutter
#### Setup Autentikasi pada Django untuk Flutter

1. Buatlah django-app bernama `authentication` pada project Django yang telah buat sebelumnya.
2. Tambahkan `authentication` ke `INSTALLED_APPS` pada main project `settings.py` aplikasi Django.
3. Jalankan perintah `pip install django-cors-headers` untuk menginstal library yang dibutuhkan.
4. Tambahkan corsheaders ke `INSTALLED_APPS` pada main project `settings.py` aplikasi Django dan tambahkan `corsheaders.middleware.CorsMiddleware` pada main project `settings.py` aplikasi Django kamu.
5. Tambahkan beberapa variabel berikut ini pada main project settings.py aplikasi Django kamu.

```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

Buatlah sebuah metode view untuk login pada `authentication/views.py.`

```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

Buat file `urls.py` pada folder `authentication` dan tambahkan URL routing terhadap fungsi yang sudah dibuat dengan endpoint login/.

```
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]

```

Terakhir, tambahkan `path('auth/', include('authentication.urls')),` pada file `music_albums_mobile/urls.py`.

#### Integrasi Sistem Autentikasi pada Flutter
Pertama, instal package yang disediakan oleh tim asisten dosen dengan menjalankan perintah berikut di Terminal.

```
flutter pub add provider
flutter pub add pbp_django_auth
```

Modifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider. Ubahlah menjadi:

```
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Flutter App',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                    useMaterial3: true,
                ),
                home: MyHomePage()),
            ),
        );
    }
}
```

Buatlah file baru pada folder `screens` dengan nama `login.dart.` lalu isi file dengan kode berikut.

```
import 'package:music_albums_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://<APP_URL_KAMU>/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```

Pada file `main.dart`, pada `Widget MaterialApp(...)`, ubah `home: MyHomePage()` menjadi `home: LoginPage()`

#### Pembuatan Model Kustom
1. Pertama, buka endpoint JSON yang sudah dibuat sebelumnya lalu salin data JSON dan buka situs web Quicktype
2. Pada situs web Quicktype, ubahlah setup name menjadi Product, source type menjadi JSON, dan language menjadi Dart
3. Tempel data JSON yang telah disalin sebelumnya ke dalam textbox yang tersedia pada Quicktype
4. Klik pilihan Copy Code pada Quicktype
5. Setelah mendapatkan kode model melalui Quicktype, buka kembali proyek Flutter, buatlah file baru pada folder lib/models dengan nama product.dart, dan tempel kode yang sudah disalin dari Quicktype

### Penerapan Fetch Data dari Django Untuk Ditampilkan ke Flutter
#### Menambahkan Dependensi HTTP

1. Jalankan `flutter pub add http` pada terminal proyek Flutter untuk menambahkan package http.

2. Pada file `android/app/src/main/AndroidManifest.xml`, tambahkan kode berikut untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat.

```
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```

#### Melakukan Fetch Data dari Django
1. Buatlah file baru pada folder `lib/screens` dengan nama `list_product.dart`
2. Pada file `list_product.dart`, impor library yang dibutuhkan 

```
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:music_albums_mobile/models/product.dart';
...

```

3. Salinlah potongan kode berikut pada `screens/list_product.dart` dan mengimpor file yang diperlukan.

```
...
import 'package:music_albums_mobile/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    var url = Uri.parse(
        'http://localhost:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}
```

4. Tambahkan halaman `list_product.dart` ke `widgets/left_drawer.dart` dengan menambahkan kode berikut.

```
// Kode ListTile Menu
...
ListTile(
    leading: const Icon(Icons.shopping_basket),
    title: const Text('Daftar Produk'),
    onTap: () {
        // Route menu ke halaman produk
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductPage()),
        );
    },
),
...

```

5. Ubah fungsi tombol `View Albums` pada halaman utama agar mengarahkan ke halaman `ProductPage`. Lakukan redirection dengan menambahkan else if setelah kode `if(...){...}` di bagian akhir `onTap: () { }` yang ada pada file `widgets/shop_card.dart`

```
...
else if (item.name == "View Albums") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductPage()));
      }
...

```

6. Impor file yang dibutuhkan saat menambahkan ProductPage ke `left_drawer.dart` dan `shop_card.dart`.
7. Jalankan aplikasi dan cobalah untuk menambahkan beberapa Product di situs web

### Integrasi Form Flutter Dengan Layanan Django
Buatlah sebuah fungsi view baru pada `main/views.py` aplikasi Django dengan potongan kode berikut.

```
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        
        data = json.loads(request.body)

        new_product = Product.objects.create(
            user = request.user,
            name = data["name"],
            price = int(data["price"]),
            description = data["description"]
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)

```

Tambahkan path baru pada `main/urls.py` dengan kode berikut.

```
path('create-flutter/', create_product_flutter, name='create_product_flutter'),
```

#### Langkah-langkah berikut akan dilakukan pada kode proyek Flutter.
Hubungkan halaman `shoplist_form.dart` dengan `CookieRequest` dengan menambahkan kode berikut.

```
...
@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
...

```

Ubahlah perintah pada `onPressed: ()` button tambah menjadi kode berikut.

```
...
onPressed: () async {
    if (_formKey.currentState!.validate()) {
        // Kirim ke Django dan tunggu respons
        final response = await request.postJson(
        "http://localhost:8000/create-flutter/",
        jsonEncode(<String, String>{
            'name': _name,
            'amount': _amount.toString(),
            'description': _description,
        }));
        if (response['status'] == 'success') {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
            content: Text("Produk baru berhasil disimpan!"),
            ));
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
            );
        } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
                content:
                    Text("Terdapat kesalahan, silakan coba lagi."),
            ));
        }
    }
},
...

```

Lakukan quick fix pada baris-baris yang bermasalah untuk mengimpor file yang dibutuhkan lalu jalankan ulang aplikasi dan coba untuk menambahkan transaksi baru dari aplikasi Flutter.

### Implementasi Fitur Logout
Buatlah sebuah metode view untuk logout pada `authentication/views.py`.

```
from django.contrib.auth import logout as auth_logout
...
@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)

```

Tambahkan path baru pada `authentication/urls.py` dengan kode berikut.

```
path('logout/', logout, name='logout'),
```

#### Langkah-langkah berikut akan dilakukan pada kode proyek Flutter.

Buka file `lib/widgets/shop_card.dart`` dan tambahkan potongan kode berikut.

```
...
@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
...
```

Ubahlah perintah `onTap: () {...}` pada widget `Inkwell` menjadi `onTap: () async {...}` agar widget `Inkwell` dapat melakukan proses logout secara asinkronus.

Tambahkan kode berikut ke dalam `async {...}` di bagian akhir

```
...
// statement if sebelumnya
// tambahkan else if baru seperti di bawah ini
else if (item.name == "Logout") {
        final response = await request.logout(
            "http://localhost:8000/auth/logout/");
        String message = response["message"];
        if (response['status']) {
          String uname = response["username"];
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message Sampai jumpa, $uname."),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$message"),
          ));
        }
      }
...
```

Jalankan ulang aplikasi dan coba untuk lakukan logout.