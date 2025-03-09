import 'package:Bassify/screens/home_screen.dart';
import 'package:Bassify/screens/library_screen.dart'; // Импортируем LibraryScreen
import 'package:flutter/material.dart';

class EqualizerScreen extends StatefulWidget {
  const EqualizerScreen({Key? key}) : super(key: key);

  @override
  _EqualizerScreenState createState() => _EqualizerScreenState();
}

class _EqualizerScreenState extends State<EqualizerScreen> {
  // Значения уровней для каждой частоты (в децибелах)
  final List<double> _levels = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  // Значения для Bass Boost и 3D Effect
  double _bassBoostValue = 0;
  double _threeDEffectValue = 0;

  // Выбранная настройка
  String _selectedSetting = 'Рок';

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

                      // Фрейм для регулирования эквалайзера
                      Container(
                        width: 350,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Color(0xFF1D1B29),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _levels.length,
                          itemBuilder: (context, index) {
                            return _buildEqualizerSlider(index);
                          },
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Секция настроек
                      _buildSettingsSection(),
                      const SizedBox(height: 24),

                      // Секция "Bass Boost" и "3D Effect" в одной строке
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Bass Boost
                          Column(
                            children: [
                              _buildRotatableCircle(
                                value: _bassBoostValue,
                                onChanged: (value) {
                                  setState(() {
                                    _bassBoostValue = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Bass Boost',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal, // Regular шрифт
                                  fontFamily: 'OpenSans',
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${_bassBoostValue.round()}%',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal, // Regular шрифт
                                  fontFamily: 'OpenSans',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          // 3D Effect
                          Column(
                            children: [
                              _buildRotatableCircle(
                                value: _threeDEffectValue,
                                onChanged: (value) {
                                  setState(() {
                                    _threeDEffectValue = value;
                                  });
                                },
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '3D Effect',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal, // Regular шрифт
                                  fontFamily: 'OpenSans',
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${_threeDEffectValue.round()}%',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal, // Regular шрифт
                                  fontFamily: 'OpenSans',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                      // Действие при нажатии на элемент навигации
                      if (index == 0) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      } else if (index == 2) {
                        // Переход на страницу библиотеки
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LibraryScreen()),
                        );
                      }
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

  // Виджет для отображения ползунка эквалайзера
  Widget _buildEqualizerSlider(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8), // Расстояние между линиями 8 пикселей
      child: Container(
        width: 19,
        child: RotatedBox(
          quarterTurns: 3, // Поворачиваем ползунок на 90 градусов
          child: Slider(
            value: _levels[index],
            min: -12,
            max: 12,
            onChanged: (value) {
              setState(() {
                _levels[index] = value; // Обновляем уровень
              });
            },
            activeColor: Colors.white, // Белый цвет ползунка
            inactiveColor: Colors.white.withOpacity(0.1),
            thumbColor: Colors.white, // Белый цвет бегунка
            overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
          ),
        ),
      ),
    );
  }

  // Виджет для отображения секции настроек
  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        // Кнопки настроек в два столбика
        GridView.count(
          crossAxisCount: 2, // Два столбика
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Отключаем скролл
          crossAxisSpacing: 30, // Расстояние между столбиками 30 пикселей
          mainAxisSpacing: 10, // Расстояние между строками 10 пикселей
          childAspectRatio: 4, // Соотношение сторон кнопок
          children: [
            _buildSettingButton('По умолчанию'),
            _buildSettingButton('Своя настройка'),
            _buildSettingButton('Рок'),
            _buildSettingButton('Поп'),
            _buildSettingButton('Техно'),
            _buildSettingButton('Вечеринка'),
            _buildSettingButton('Классическая'),
            _buildSettingButton('Софт-рок'),
          ],
        ),
      ],
    );
  }

  // Виджет для отображения настроек (кнопки)
  Widget _buildSettingButton(String label) {
    return SizedBox(
      width: 120, // Фиксированная ширина кнопок
      height: 30, // Фиксированная высота кнопок
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedSetting = label;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _selectedSetting == label ? const Color(0xFF6200EE) : const Color(0xFF100E1C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Без обводки
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'OpenSans',
            color: _selectedSetting == label ? Colors.white : Colors.white.withOpacity(0.7),
          ),
        ),
      ),
    );
  }

  // Виджет для отображения вращающегося круга
  Widget _buildRotatableCircle({
    required double value,
    required Function(double) onChanged,
  }) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          double newValue = value + details.delta.dy;
          if (newValue < 0) newValue = 0;
          if (newValue > 100) newValue = 100;
          onChanged(newValue);
        });
      },
      child: Container(
        width: 150, // Размер круга 100x100
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, // Белый фон круга
          border: Border.all(
            color: const Color(0xFF6200EE), // Фиолетовая обводка
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6200EE).withOpacity(0.5),
              spreadRadius: value * 0.01, // Фиолетовое свечение
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Transform.rotate(
            angle: value * 0.01 * 2 * 3.14159,
            child: Container(
              width: 2,
              height: 10,
              margin: const EdgeInsets.only(bottom: 130), // Линия ближе к краю круга
              color: const Color(0xFF6200EE), // Фиолетовая линия вместо стрелки
            ),
          ),
        ),
      ),
    );
  }
}