import 'package:flutter/material.dart';
import 'package:Bassify/screens/home_screen.dart'; // Импортируем HomeScreen
import 'package:Bassify/screens/equalizer_screen.dart'; // Импортируем EqualizerScreen
import 'package:Bassify/screens/song_screen.dart'; // Импортируем SongPage

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _selectedIndex = 2; // Индекс выбранной страницы (LibraryScreen)

  // Метод для обработки нажатий на BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Навигация на соответствующую страницу
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D1B29),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок и кнопка поиска
              Row(
                children: [
                  const Text(
                    'Ваша музыка',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.search, size: 50, color: Colors.white),
                    onPressed: () {
                      print("Нажата кнопка поиска");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16), // Отступ перед списком песен
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
      // Полупрозрачный BottomNavigationBar
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
          currentIndex: _selectedIndex, // Активная иконка
          selectedItemColor: const Color(0xFF6200EE), // Цвет выбранной иконки (непрозрачный)
          unselectedItemColor: Colors.white54, // Цвет невыбранной иконки (полупрозрачный)
          onTap: _onItemTapped, // Обработка нажатий
        ),
      ),
    );
  }

  // Метод для создания элемента списка песен
  Widget _buildSong(String title, String artist, String duration, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Переход на SongPage с передачей данных
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongPage(
              songTitle: title,
              artist: artist,
              imageUrl: imagePath,
              duration: _parseDuration(duration), // Преобразуем строку в Duration
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Обложка песни
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 16),
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

  // Метод для преобразования строки в Duration
  Duration _parseDuration(String duration) {
    final parts = duration.split(':');
    final minutes = int.parse(parts[0]);
    final seconds = int.parse(parts[1]);
    return Duration(minutes: minutes, seconds: seconds);
  }
}