import 'package:flutter/material.dart';
import 'package:Bassify/screens/home_screen.dart'; // Импортируем HomeScreen
import 'package:Bassify/screens/equalizer_screen.dart'; // Импортируем EqualizerScreen
import 'package:Bassify/screens/library_screen.dart'; // Импортируем LibraryScreen
import 'package:Bassify/screens/song_screen.dart'; // Импортируем SongPage

class PlaylistScreen extends StatelessWidget {
  final String playlistName; // Название плейлиста
  final String? imageUrl; // URL изображения плейлиста (может быть null)
  final IconData icon; // Иконка плейлиста

  const PlaylistScreen({
    Key? key,
    required this.playlistName,
    this.imageUrl,
    required this.icon, // Иконка плейлиста
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Стандартные размеры для имитации экрана телефона
    double phoneWidth = 412;
    double phoneHeight = 917;

    return Scaffold(
      backgroundColor: const Color(0xFF1D1B29),
      body: Center(
        child: SizedBox(
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
                    icon: Image.asset(
                      'assets/images/arrow_back_icon.png',
                      color: Colors.white,
                    ), // Кастомная иконка
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
                      // Область под картинку
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20), // Радиус скругления углов
                          child: imageUrl != null
                              ? Image.asset(
                                  imageUrl!, // Используем переданное изображение
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    // Запасное изображение, если основное не загрузилось
                                    return _buildIconPlaceholder(icon);
                                  },
                                )
                              : _buildIconPlaceholder(icon), // Отображаем иконку, если изображение отсутствует
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          playlistName, // Используем переданное название плейлиста
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildSong(context, 'Coffe', 'Kainbeats', '01:44', 'assets/images/song1.png'),
                      _buildSong(context, 'raindrops', 'rainyyxx', '02:03', 'assets/images/song2.png'),
                      _buildSong(context, 'Tokyo', 'SmYang', '01:40', 'assets/images/song3.png'),
                      _buildSong(context, 'Lullaby', 'iamfinerow', '04:12', 'assets/images/song4.png'),
                      _buildSong(context, 'Back To Her Men', 'Demien Rice', '03:07', 'assets/images/song5.png'),
                      _buildSong(context, 'Hoting Bling', 'Bille Elish', '03:00', 'assets/images/song6.png'),
                      _buildSong(context, 'Antretor', 'yann tiarsen', '02:10', 'assets/images/song7.png'),
                      _buildSong(context, 'Nightmare', 'Halsey', '01:49', 'assets/images/song8.png'),
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
                          color: Colors.white, // Цвет иконки (непрозрачный)
                        ),
                        label: 'Equalizer',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/library_icon.png'),
                          size: 24,
                          color: Color(0xFF6200EE), // Цвет иконки (непрозрачный)
                        ),
                        label: 'Library',
                      ),
                    ],
                    currentIndex: 2, // Активная иконка (Library)
                    selectedItemColor: const Color(0xFF6200EE), // Цвет выбранной иконки (непрозрачный)
                    unselectedItemColor: Colors.white54, // Цвет невыбранной иконки (полупрозрачный)
                    onTap: (index) {
                      // Обработка нажатий
                      switch (index) {
                        case 0:
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                          );
                          break;
                        case 1:
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const EqualizerScreen()),
                          );
                          break;
                        case 2:
                          // Уже на LibraryScreen, ничего не делаем
                          break;
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

  // Виджет для отображения иконки, если изображение отсутствует
  Widget _buildIconPlaceholder(IconData icon) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 100,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _buildSong(BuildContext context, String title, String artist, String duration, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          // Переход на SongPage с передачей данных
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SongPage(
                songTitle: title,
                artist: artist,
                imageUrl: imagePath,
                duration: _parseDuration(duration), // Вызываем метод _parseDuration
              ),
            ),
          );
        },
        child: Row(
          children: [
            // Обложка песни
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Закруглённые углы
                border: Border.all(
                  color: Colors.white.withOpacity(0.3), // Светлая рамка
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Закруглённые углы внутри рамки
                child: Image.asset(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Запасное изображение, если основное не загрузилось
                    return Container(
                      color: Colors.grey.withOpacity(0.3), // Фон, если изображение отсутствует
                      child: Icon(
                        Icons.music_note,
                        color: Colors.white.withOpacity(0.5),
                        size: 30,
                      ),
                    );
                  },
                ),
              ),
            ),
            // Название песни и исполнитель
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (artist.isNotEmpty)
                    Text(
                      artist,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
            // Длительность песни
            if (duration.isNotEmpty)
              Text(
                duration,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Метод для преобразования строки длительности в Duration
  Duration _parseDuration(String duration) {
    List<String> parts = duration.split(':');
    int minutes = int.parse(parts[0]);
    int seconds = int.parse(parts[1]);
    return Duration(minutes: minutes, seconds: seconds);
  }
}