import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1B29),
        foregroundColor: Colors.white,
        title: Text('Ваш плейлист'),
        centerTitle: true,
        titleSpacing: 50, // Сдвигаем элементы ближе к центру
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 28), // Увеличенный размер иконки
          onPressed: () {
            Navigator.pop(context);
          },
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.search, size: 56), // Увеличенный размер иконки
      onPressed: () {
        print("Нажата кнопка поиска");
      },
    ),
  ],
),

      body: Container(
        color: Color(0xFF1D1B29),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
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