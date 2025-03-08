import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1B29),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок и кнопка поиска
              Row(
                children: [
                  Text(
                    'Ваша музыка',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.search, size: 28, color: Colors.white),
                    onPressed: () {
                      print("Нажата кнопка поиска");
                    },
                  ),
                ],
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
                    _buildSong('Хайпим', 'Yanix', '03:34', 'assets/images/song8.png'),
                    _buildSong('Треп хата', 'Yanix', '01:49', 'assets/images/song8.png'),
                    _buildSong('Pimpin', 'Yanix', '01:49', 'assets/images/song8.png'),
                    _buildSong('Алкоголь', 'Yanix', '01:49', 'assets/images/song8.png'),
                    _buildSong('Не говори им', 'Yanix', '01:49', 'assets/images/song8.png'),
                    _buildSong('Ye', 'PIKA', '02:00', 'assets/images/song8.png'),
                    _buildSong('Не отпускай меня', 'Нейромонах Феофан feat. oldpianogirl', '04:43', 'assets/images/song8.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSong(String title, String artist, String duration, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.withOpacity(0.3),
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