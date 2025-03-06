import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/song_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BASSIFY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SongPage(),
    );
  }
}