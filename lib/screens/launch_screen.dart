import 'package:flutter/material.dart';
import 'home_screen.dart'; // Импортируем HomeScreen

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentFrameIndex = 0;
  final List<String> _framePaths = [
    'assets/images/app_icon1.png',
    'assets/images/app_icon2.png',
    'assets/images/app_icon3.png',
    'assets/images/app_icon4.png',
    'assets/images/app_icon5.png',
  ]; // Пути к изображениям кадров

  @override
  void initState() {
    super.initState();

    // Инициализация AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Запуск анимации
    _startFrameAnimation();

    // Переход на HomeScreen через 3 секунды
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  void _startFrameAnimation() {
    final frameDuration = _controller.duration! ~/ _framePaths.length;
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });

    _controller.addListener(() {
      final frame = (_controller.value * _framePaths.length).floor() % _framePaths.length;
      if (frame != _currentFrameIndex) {
        setState(() {
          _currentFrameIndex = frame;
        });
      }
    });

    _controller.forward(); // Запуск анимации
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1B29),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Анимированный ярлык приложения
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 100), // Плавное переключение между кадрами
              child: Image.asset(
                _framePaths[_currentFrameIndex],
                key: ValueKey<int>(_currentFrameIndex),
                width: 150,
                height: 150,
              ),
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
    );
  }
}