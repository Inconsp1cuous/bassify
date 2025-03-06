import 'package:flutter/material.dart';
import 'home_screen.dart'; // Импортируем HomeScreen

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Инициализация анимации
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Длительность анимации
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // После завершения анимации переходим на HomeScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      });

    _controller.forward(); // Запуск анимации
  }

  @override
  void dispose() {
    _controller.dispose(); // Освобождаем ресурсы
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1B29), // Фон как в HomeScreen
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Логотип приложения
              Image.asset(
                'assets/images/app_icon.png', // Путь к вашему логотипу
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
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
      ),
    );
  }
}