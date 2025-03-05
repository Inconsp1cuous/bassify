import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1B29),
        foregroundColor: Colors.grey,
        title: Center(
          child: Text('Ваш плейлист'),
        ),
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
                  'assets/images/image_plylist.png', // Основное изображение
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
            _buildSong('Coffe', 'Kainbeats', '01:44'),
            _buildSong('raindrops', 'rainyyxx', '02:03'),
            _buildSong('Tokyo', 'SmYang', '01:40'),
            _buildSong('Lullaby', 'iamfinerow', '04:12'),
            _buildSong('Back To Her Men', 'Demien Rice', '03:07'),
            _buildSong('Hoting Bling', 'Bille Elish', '03:00'),
            _buildSong('Antretor', 'yann tiarsen', '02:10'),
            _buildSong('Nightmare', 'Halsey', '01:49'),
          ],
        ),
      ),
    );
  }

  Widget _buildSong(String title, String artist, String duration) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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