import 'package:flutter/material.dart';

class EqualizerScreen extends StatelessWidget {
  const EqualizerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Фиксированные размеры для имитации экрана телефона
    double phoneWidth = 412;
    double phoneHeight = 917;

    return Scaffold(
      backgroundColor: const Color(0xFF1D1B29), // Фон как на home_page
      body: Center(
        child: Container(
          width: phoneWidth,
          height: phoneHeight,
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: const Color(0xFF1D1B29),
                appBar: AppBar(
                  backgroundColor: const Color(0xFF1D1B29),
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Заголовок "Эквалайзер"
                      const Text(
                        'Эквалайзер',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Секция "Полукомандир"
                      const Text(
                        'По умолчанию',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildSettingChip('Рок'),
                      _buildSettingChip('Техно'),
                      _buildSettingChip('Классическая'),
                      const SizedBox(height: 24),

                      // Секция "Свод настройка"
                      const Text(
                        'Своя настройка',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildSettingChip('Поп'),
                      _buildSettingChip('Вечеринка'),
                      _buildSettingChip('Софт-рок'),
                      const SizedBox(height: 24),

                      // Секция "Ваза Boost"
                      const Text(
                        'Ваss Boost 38%',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Slider(
                        value: 38,
                        min: 0,
                        max: 100,
                        onChanged: (value) {
                          // Логика для изменения значения
                        },
                        activeColor: const Color(0xFF6200EE),
                        inactiveColor: Colors.white.withOpacity(0.1),
                      ),
                      const SizedBox(height: 24),

                      // Секция "3D Effect"
                      const Text(
                        '3D Effect 69%',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Slider(
                        value: 69,
                        min: 0,
                        max: 100,
                        onChanged: (value) {
                          // Логика для изменения значения
                        },
                        activeColor: const Color(0xFF6200EE),
                        inactiveColor: Colors.white.withOpacity(0.1),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              // Полупрозрачный BottomNavigationBar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5), // Полупрозрачный черный фон
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent, // Прозрачный фон
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/home_icon.png'),
                          size: 24,
                          color: Colors.white, // Цвет иконки (непрозрачный)
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/equalizer_icon.png'),
                          size: 24,
                          color: Color(0xFF6200EE), // Цвет иконки (непрозрачный)
                        ),
                        label: 'Equalizer',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/library_icon.png'),
                          size: 24,
                          color: Colors.white, // Цвет иконки (непрозрачный)
                        ),
                        label: 'Library',
                      ),
                    ],
                    currentIndex: 1, // Активная иконка "Equalizer"
                    selectedItemColor: const Color(0xFF6200EE), // Цвет выбранной иконки (непрозрачный)
                    unselectedItemColor: Colors.white54, // Цвет невыбранной иконки (полупрозрачный)
                    onTap: (index) {
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Виджет для отображения настроек (чипсы)
  Widget _buildSettingChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ChoiceChip(
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
        ),
        selected: false,
        onSelected: (bool selected) {
          // Логика для выбора настройки
        },
        backgroundColor: Colors.white.withOpacity(0.1),
        selectedColor: const Color(0xFF6200EE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}