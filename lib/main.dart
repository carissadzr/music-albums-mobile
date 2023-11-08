import 'package:flutter/material.dart';
import 'package:music_albums_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Albums',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 132, 201, 63)),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

