import 'package:Bassify/screens/equalizer_screen.dart';
import 'package:Bassify/screens/library_screen.dart';
import 'package:Bassify/screens/playlist_screen.dart';
import 'package:Bassify/screens/song_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/launch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bassify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LaunchScreen(),
    );
  }
}