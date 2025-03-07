import 'package:flutter/material.dart';
import 'home_screen.dart'; // Импортируем HomeScreen

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();

    // Переход на HomeScreen через 3 секунды
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1B29), // Фон как в HomeScreen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // GIF-изображение ярлыка приложения
            Image.asset(
              'assets/images/app_icon.gif', // Путь к GIF-изображению
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20), // Отступ между иконкой и текстом
            // Название приложения
            const Text(
              'BASSIFY',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
            ),
          ],
        ),
      ),
    );
  }
}