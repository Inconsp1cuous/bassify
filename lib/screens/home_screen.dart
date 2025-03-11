import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:Bassify/widget/recent_track_item.dart';
import 'package:Bassify/widget/playlist_button.dart';
import 'package:Bassify/screens/equalizer_screen.dart';
import 'package:Bassify/screens/library_screen.dart';
import 'package:Bassify/screens/song_screen.dart';
import 'package:Bassify/screens/playlist_screen.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> playlists = [
    {
      'text': 'Любимая',
      'color1': Colors.deepPurple,
      'color2': Colors.blueAccent,
      'icon': Icons.favorite,
      'imageUrl': null,
    },
    {
      'text': 'Рок музыка',
      'color1': Colors.redAccent,
      'color2': Colors.orange,
      'icon': Icons.music_note,
      'imageUrl': null,
    },
    {
      'text': 'Поп музыка',
      'color1': Colors.pinkAccent,
      'color2': Colors.purpleAccent,
      'icon': Icons.music_note,
      'imageUrl': null,
    },
    {
      'text': 'В машину',
      'color1': Colors.green,
      'color2': Colors.teal,
      'icon': Icons.drive_eta,
      'imageUrl': null,
    },
    {
      'text': 'Lo-fi Beats',
      'color1': Colors.blueGrey,
      'color2': Colors.cyan,
      'icon': Icons.music_note,
      'imageUrl': null,
    },
  ];

  List<Map<String, String>> recentTracks = [];

  @override
  void initState() {
    super.initState();
    _loadMp3Files();
  }

  Future<void> _loadMp3Files() async {
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
        recentTracks = mp3Files.map((file) {
          String fileName = file.split('/').last;
          return {
            'title': fileName.replaceAll('.mp3', ''),
            'artist': 'Unknown Artist',
            'duration': '00:00',
            'path': file,
          };
        }).toList();
      });
    } catch (e) {
      print('Ошибка загрузки MP3-файлов: $e');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const EqualizerScreen()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LibraryScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                ),
                body: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Плейлисты',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 350,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Искать плейлист',
                            hintStyle:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.white),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D1B29),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            alignment: WrapAlignment.center,
                            children: [
                              for (var playlist in playlists)
                                PlaylistButton(
                                  text: playlist['text'],
                                  color1: playlist['color1'],
                                  color2: playlist['color2'],
                                  icon: playlist['icon'],
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlaylistScreen(
                                          playlistName: playlist['text'],
                                          imageUrl: playlist['imageUrl'],
                                          icon: playlist['icon'],
                                        ),
                                      ),
                                    );
                                  },
                                  size: 100,
                                  imageUrl: playlist['imageUrl'],
                                  
                                ),
                                PlaylistButton(
                                  text: 'Добавить',
                                  color1: Colors.grey,
                                  color2: Colors.grey,
                                  icon: Icons.add,
                                  onPressed: _addNewPlaylist,
                                  size: 100,
                                  imageUrl: null,
                                )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Недавние треки',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans',
                          color: Color(0xFF999595),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 350,
                        height: 340,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D1B29),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListView.builder(
                          itemCount: recentTracks.length,
                          itemBuilder: (context, index) {
                            final track = recentTracks[index];
                            return RecentTrackItem(
                              title: track['title']!,
                              artist: track['artist']!,
                              duration: track['duration']!,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SongPage(
                                      songTitle: track['title']!,
                                      artist: track['artist']!,
                                      imageUrl:
                                          'assets/images/default_song_image.png',
                                      duration: const Duration(
                                          minutes: 3, seconds: 30),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/home_icon.png'),
                          size: 24,
                          color: Color(0xFF6200EE),
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/equalizer_icon.png'),
                          size: 24,
                          color: Colors.white,
                        ),
                        label: 'Equalizer',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/library_icon.png'),
                          size: 24,
                          color: Colors.white,
                        ),
                        label: 'Library',
                      ),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: const Color(0xFF6200EE),
                    unselectedItemColor: Colors.white54,
                    onTap: _onItemTapped,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addNewPlaylist() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newPlaylistName = '';
        return Dialog(
          backgroundColor: Colors.black.withOpacity(0.85), // Полупрозрачный фон
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Закругленные углы
          ),
          child: Container(
            width: 320, // Ширина диалогового окна
            height: 450, // Высота диалогового окна
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Минимальный размер по высоте
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Центрирование по горизонтали
              children: [
                // Поле для загрузки изображения (по центру)
                GestureDetector(
                  onTap: () {
                    // Логика для выбора изображения
                    print('Выбрать изображение');
                  },
                  child: Container(
                    width: 172, // Ширина контейнера для изображения
                    height: 172, // Высота контейнера для изображения
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add_photo_alternate,
                        color: Colors.white70,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Заголовок "Новый плейлист" (по центру и под картинкой)
                const Text(
                  'Новый плейлист',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                ),
                const SizedBox(height: 16),

                // Поле для ввода названия плейлиста
                TextField(
                  onChanged: (value) {
                    newPlaylistName = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Напишите название плейлиста',
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    filled: true,
                    fillColor: Colors.transparent, // Прозрачный фон
                    border: InputBorder.none, // Убираем границу
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center, // Текст по центру
                ),
                const SizedBox(height: 8),

                // Линия под полем ввода
                Container(
                  height: 1, // Высота линии
                  color: Colors.white.withOpacity(0.5), // Цвет линии
                  margin: const EdgeInsets.symmetric(vertical: 8), // Отступы
                ),
                const SizedBox(height: 24),

                // Кнопки "Отменить" и "Создать"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Закрыть диалоговое окно
                      },
                      child: const Text(
                        'Отменить',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (newPlaylistName.isNotEmpty) {
                          setState(() {
                            playlists.add({
                              'text': newPlaylistName,
                              'color1': Colors.grey,
                              'color2': Colors.grey,
                              'icon': Icons.music_note,
                              'imageUrl': null,
                            });
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF6200EE), // Фиолетовый цвет кнопки
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(50), // Закругление углов 50
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      child: const Text(
                        'Создать',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
