import 'package:Bassify/screens/home_screen.dart';
import 'package:flutter/material.dart';

class EqualizerScreen extends StatefulWidget {
  const EqualizerScreen({Key? key}) : super(key: key);

  @override
  _EqualizerScreenState createState() => _EqualizerScreenState();
}

class _EqualizerScreenState extends State<EqualizerScreen> {
  // Значения уровней для каждой частоты (в децибелах)
  final List<double> _levels = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  final List<String> _frequencies = ['60', '170', '310', '600', '1k', '3k', '6k', '12k', '14k', '16k'];

  // Значения для Bass Boost и 3D Effect
  double _bassBoostValue = 38;
  double _threeDEffectValue = 69;

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
                  // Убрана кнопка "Назад"
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

                      // Регулируемые уровни эквалайзера
                      const Text(
                        'Уровень (дБ)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 200, // Высота области с ползунками
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _frequencies.length,
                          itemBuilder: (context, index) {
                            return _buildEqualizerSlider(_frequencies[index], index);
                          },
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Секция настроек
                      _buildSettingsSection(),
                      const SizedBox(height: 24),

                      // Секция "Bass Boost"
                      const Text(
                        'Bass Boost',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildRotatableCircle(
                        value: _bassBoostValue,
                        onChanged: (value) {
                          setState(() {
                            _bassBoostValue = value;
                          });
                        },
                      ),
                      Text(
                        '${_bassBoostValue.round()}%',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Секция "3D Effect"
                      const Text(
                        '3D Effect',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildRotatableCircle(
                        value: _threeDEffectValue,
                        onChanged: (value) {
                          setState(() {
                            _threeDEffectValue = value;
                          });
                        },
                      ),
                      Text(
                        '${_threeDEffectValue.round()}%',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
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
  Widget _buildEqualizerSlider(String frequency, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Ползунок
          RotatedBox(
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
          const SizedBox(height: 8),
          // Частота
          Text(
            frequency,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'OpenSans',
              color: Colors.white,
            ),
          ),
          // Уровень в децибелах
          Text(
            '${_levels[index].round()}dB',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'OpenSans',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Виджет для отображения секции настроек
  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Секция "По умолчанию" и "Своя настройка"
        const Text(
          'Настройки',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'OpenSans',
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        // Кнопки настроек в два столбика
        GridView.count(
          crossAxisCount: 2, // Два столбика
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Отключаем скролл
          childAspectRatio: 3, // Соотношение сторон кнопок
          children: [
            _buildSettingChip('По умолчанию'),
            _buildSettingChip('Своя настройка'),
            _buildSettingChip('Рок'),
            _buildSettingChip('Поп'),
            _buildSettingChip('Техно'),
            _buildSettingChip('Вечеринка'),
            _buildSettingChip('Классическая'),
            _buildSettingChip('Софт-рок'),
          ],
        ),
      ],
    );
  }

  // Виджет для отображения настроек (чипсы)
  Widget _buildSettingChip(String label) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: 'OpenSans',
          color: _selectedSetting == label ? Colors.white : Colors.white.withOpacity(0.7),
        ),
      ),
      selected: _selectedSetting == label,
      onSelected: (bool selected) {
        setState(() {
          _selectedSetting = label;
        });
      },
      backgroundColor: const Color(0xFF100E1C), // Цвет кнопок #100E1C
      selectedColor: const Color(0xFF6200EE), // Фиолетовый цвет для выбранной кнопки
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.1),
          border: Border.all(
            color: const Color(0xFF6200EE), // Фиолетовая обводка
            width: 2,
          ),
        ),
        child: Center(
          child: Transform.rotate(
            angle: value * 0.01 * 2 * 3.14159,
            child: Icon(
              Icons.arrow_upward,
              size: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}