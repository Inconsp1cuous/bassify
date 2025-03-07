import 'package:flutter/material.dart';

class SongPage extends StatefulWidget {
  const SongPage({Key? key}) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool isPlaying = false;
  Duration currentPosition = const Duration(minutes: 1, seconds: 28); // Текущее время трека
  Duration totalDuration = const Duration(minutes: 3, seconds: 46); // Общая продолжительность трека

  // Состояния для кнопок "перемешать" и "повторить"
  bool isShuffleActive = false;
  bool isRepeatActive = false;

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  // Метод для обновления текущего времени (можно вызывать извне)
  void updateCurrentPosition(Duration newPosition) {
    setState(() {
      currentPosition = newPosition;
    });
  }

  // Форматирование времени в строку (минуты:секунды)
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

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
                    icon: Image.asset('assets/images/arrow_back_icon.png', color: Colors.white), // Кастомная иконка
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 16), // Сдвиг вниз на 30 пикселей
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Область под картинку 350x350
                      Center(
                        child: Container(
                          width: 360, // Ширина области
                          height: 360, // Высота области
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1), // Фон, если картинки нет
                            borderRadius: BorderRadius.circular(16), // Закругленные углы
                            image: const DecorationImage(
                              image: AssetImage('assets/images/song_image.png'), // Ваше изображение трека
                              fit: BoxFit.cover, // Изображение заполняет контейнер
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.music_note, // Стандартная иконка, если картинки нет
                              size: 100,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24), // Отступ как на home_page

                      // Название трека и исполнитель
                      const Text(
                        'Coffee',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8), // Отступ
                      const Text(
                        'Kainbeats',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'OpenSans',
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 30), // Увеличенный отступ до линии прогресса

                      // Линия прогресса
                      LinearProgressIndicator(
                        value: currentPosition.inSeconds / totalDuration.inSeconds,
                        backgroundColor: Colors.white.withOpacity(0.1),
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      const SizedBox(height: 8), // Отступ между линией и цифрами времени

                      // Время трека (под линией)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatDuration(currentPosition), // Текущее время
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'OpenSans',
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            formatDuration(totalDuration), // Общая продолжительность
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'OpenSans',
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40), // Увеличенный отступ до иконок управления

                      // Иконки управления воспроизведением
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Иконка "перемешать" слева
                          IconButton(
                            icon: Image.asset(
                              'assets/images/shuffle_icon.png',
                              color: isShuffleActive ? const Color(0xFF6200EE) : Colors.white, // Фиолетовый, если активно
                            ),
                            onPressed: () {
                              setState(() {
                                isShuffleActive = !isShuffleActive; // Переключение состояния
                              });
                            },
                          ),
                          // Центральные иконки: назад, пуск/пауза, вперед
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset('assets/images/previous_icon.png', color: Colors.white),
                                onPressed: () {
                                  // Действие для перехода к предыдущему треку
                                },
                              ),
                              IconButton(
                                icon: isPlaying
                                    ? Image.asset('assets/images/pause_icon.png')
                                    : Image.asset('assets/images/play_icon.png'),
                                onPressed: togglePlayPause,
                              ),
                              IconButton(
                                icon: Image.asset('assets/images/next_icon.png', color: Colors.white),
                                onPressed: () {
                                  // Действие для перехода к следующему треку
                                },
                              ),
                            ],
                          ),
                          // Иконка "повтор" справа
                          IconButton(
                            icon: Image.asset(
                              'assets/images/repeat_icon.png',
                              color: isRepeatActive ? const Color(0xFF6200EE) : Colors.white, // Фиолетовый, если активно
                            ),
                            onPressed: () {
                              setState(() {
                                isRepeatActive = !isRepeatActive; // Переключение состояния
                              });
                            },
                          ),
                        ],
                      ),
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
                          color: Color(0xFF6200EE), // Цвет иконки (непрозрачный)
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/equalizer_icon.png'),
                          size: 24,
                          color: Colors.white, // Цвет иконки (непрозрачный)
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
                    currentIndex: 0,
                    selectedItemColor: const Color(0xFF6200EE), // Цвет выбранной иконки (непрозрачный)
                    unselectedItemColor: Colors.white54, // Цвет невыбранной иконки (полупрозрачный)
                    onTap: (index) {
                      // Действие при нажатии на элемент навигации
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
}