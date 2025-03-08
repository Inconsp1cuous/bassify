import 'package:flutter/material.dart';
//import 'dart:async'; // Для таймера
import 'screens/playlist_screen.dart'; // Экран плейлиста
import 'screens/library_screen.dart'; // Экран библиотеки
import 'screens/home_screen.dart'; // Экран Главная
import 'screens/launch_screen.dart'; // Экран запуска

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(), // Сначала запускаем экран загрузки
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    PlaylistScreen(), // Добавлен PlaylistScreen
    LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/home_icon.png'),
                size: 24,
                color: _currentIndex == 0 ? Color(0xFF6200EE) : Colors.white,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/equalizer_icon.png'),
                size: 24,
                color: _currentIndex == 1 ? Color(0xFF6200EE) : Colors.white,
              ),
              label: 'Equalizer',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/library_icon.png'),
                size: 24,
                color: _currentIndex == 2 ? Color(0xFF6200EE) : Colors.white,
              ),
              label: 'Library',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Color(0xFF6200EE),
          unselectedItemColor: Colors.white54,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}