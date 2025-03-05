import 'package:flutter/material.dart';
import 'screens/playlist_screen.dart'; // Импортируем экран плейлиста

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bassify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlaylistScreen(), // Устанавливаем PlaylistScreen как стартовую страницу
    );
  }
}