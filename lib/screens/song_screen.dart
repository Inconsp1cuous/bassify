import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  const SongPage({Key? key}) : super(key: key);

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
                  // Убрана кнопка поиска
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Область под картинку 350x350
                      Center(
                        child: Container(
                          width: 350, // Ширина области
                          height: 350, // Высота области
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
                      const Center(
                        child: Text(
                          'Coffee',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), // Отступ
                      const Center(
                        child: Text(
                          'Kainbeats',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'OpenSans',
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16), // Отступ как на home_page

                      // Время трека
                      const Center(
                        child: Text(
                          '1:28 / 3:46',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'OpenSans',
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24), // Отступ как на home_page
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