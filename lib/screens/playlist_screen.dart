import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1B29), // Устанавливаем фон для всего экрана
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 16), // Сдвиг вниз на 30 пикселей
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок, кнопка "Назад" и кнопка поиска
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 28, color: Colors.white), // Кнопка "Назад"
                    onPressed: () {
                      Navigator.pop(context); // Возврат на предыдущий экран
                    },
                  ),
                  Spacer(), // Растягиваем пространство между элементами
                  Text(
                    'Ваш плейлист',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(), // Растягиваем пространство между элементами
                  IconButton(
                    icon: Icon(Icons.search, size: 28, color: Colors.white), // Кнопка поиска
                    onPressed: () {
                      print("Нажата кнопка поиска");
                    },
                  ),
                ],
              ),
              SizedBox(height: 16), // Отступ между заголовком и картинкой

              // Квадратная картинка плейлиста с закруглёнными углами
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Радиус скругления углов
                  child: Image.asset(
                    'assets/images/image_playlist.png', // Основное изображение
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Запасное изображение, если основное не загрузилось
                      return Image.asset(
                        'assets/images/load_playlist_error.png', // Путь к запасному изображению
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Поп музыка',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _buildSong('Coffe', 'Kainbeats', '01:44', 'assets/images/song1.png'),
                    _buildSong('raindrops', 'rainyyxx', '02:03', 'assets/images/song2.png'),
                    _buildSong('Tokyo', 'SmYang', '01:40', 'assets/images/song3.png'),
                    _buildSong('Lullaby', 'iamfinerow', '04:12', 'assets/images/song4.png'),
                    _buildSong('Back To Her Men', 'Demien Rice', '03:07', 'assets/images/song5.png'),
                    _buildSong('Hoting Bling', 'Bille Elish', '03:00', 'assets/images/song6.png'),
                    _buildSong('Antretor', 'yann tiarsen', '02:10', 'assets/images/song7.png'),
                    _buildSong('Nightmare', 'Halsey', '01:49', 'assets/images/song8.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
    );
  }

  Widget _buildSong(String title, String artist, String duration, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Обложка песни
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(right: 16),
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (artist.isNotEmpty)
                  Text(
                    artist,
                    style: TextStyle(
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
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
        ],
      ),
    );
  }
}