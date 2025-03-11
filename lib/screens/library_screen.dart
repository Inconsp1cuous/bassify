import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:Bassify/screens/home_screen.dart';
import 'package:Bassify/screens/equalizer_screen.dart';
import 'package:Bassify/screens/song_screen.dart';
import 'dart:convert';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int _selectedIndex = 2; // Индекс выбранной страницы (LibraryScreen)
  List<Map<String, String>> songs = []; // Список песен

  @override
  void initState() {
    super.initState();
    _loadSongs(); // Загружаем песни при инициализации
  }

  // Метод для загрузки песен из assets
  Future<void> _loadSongs() async {
    try {
      // Загружаем AssetManifest.json
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      // Фильтруем только MP3-файлы в assets/images/
      final List<String> mp3Files = manifestMap.keys
          .where((String key) =>
              key.startsWith('assets/images/') && key.endsWith('.mp3'))
          .toList();

      setState(() {
        songs = mp3Files.map((file) {
          String fileName = file.split('/').last;
          return {
            'title': fileName.replaceAll('.mp3', ''),
            'artist': 'Unknown Artist',
            'duration': '00:00',
            'path': file,
            'imageUrl': 'assets/images/default_song_image.png', // Заглушка для изображения
          };
        }).toList();
      });
    } catch (e) {
      print('Ошибка загрузки MP3-файлов: $e');
    }
  }

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
    // Фиксированные размеры для имитации экрана телефона
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
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.search, size: 30, color: Colors.white),
                              onPressed: () {
                                print("Нажата кнопка поиска");
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16), // Отступ перед списком песен
                        Expanded(
                          child: ListView.builder(
                            itemCount: songs.length,
                            itemBuilder: (context, index) {
                              final song = songs[index];
                              return _buildSong(
                                song['title']!,
                                song['artist']!,
                                song['duration']!,
                                song['imageUrl']!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
                    currentIndex: _selectedIndex, // Активная иконка
                    selectedItemColor: const Color(0xFF6200EE), // Цвет выбранной иконки (непрозрачный)
                    unselectedItemColor: Colors.white54, // Цвет невыбранной иконки (полупрозрачный)
                    onTap: _onItemTapped, // Обработка нажатий
                  ),
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
                duration: _parseDuration(duration),
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

  // Метод для преобразования строки длительности в Duration
  Duration _parseDuration(String duration) {
    List<String> parts = duration.split(':');
    int minutes = int.parse(parts[0]);
    int seconds = int.parse(parts[1]);
    return Duration(minutes: minutes, seconds: seconds);
  }
}