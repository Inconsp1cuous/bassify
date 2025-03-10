import 'package:flutter/material.dart';
import 'package:Bassify/widget/recent_track_item.dart';
import 'package:Bassify/widget/playlist_button.dart';
import 'package:Bassify/screens/equalizer_screen.dart'; // Импортируем EqualizerScreen
import 'package:Bassify/screens/library_screen.dart'; // Импортируем LibraryScreen
import 'package:Bassify/screens/song_screen.dart'; // Импортируем SongPage

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Индекс выбранной страницы
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

  // Метод для обработки нажатий на BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Навигация на соответствующую страницу
    switch (index) {
      case 0:
        // Уже на HomeScreen, ничего не делаем
        break;
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
                      // Заголовок "Плейлисты"
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

                      // Поле поиска
                      Container(
                        width: 350, // Фиксированная ширина
                        height: 50, // Фиксированная высота
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20), // Закругленные углы
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Искать плейлист',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            prefixIcon: const Icon(Icons.search, color: Colors.white),
                            border: InputBorder.none, // Убираем стандартную границу
                            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Отступы внутри поля
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Контейнер для плейлистов
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
                                  onPressed: () {},
                                  size: 100,
                                  imageUrl: playlist['imageUrl'],
                                ),
                              // Кнопка для добавления нового плейлиста
                              PlaylistButton(
                                text: 'Добавить',
                                color1: Colors.grey,
                                color2: Colors.grey,
                                icon: Icons.add,
                                onPressed: _addNewPlaylist,
                                size: 100,
                                imageUrl: null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Заголовок "Недавние треки"
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

                      // Контейнер для списка треков
                      Container(
                        width: 350,
                        height: 340,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D1B29),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            RecentTrackItem(
                              title: 'Swim',
                              artist: 'Chase Atlantic',
                              duration: '03:57',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SongPage(
                                      songTitle: 'Swim',
                                      artist: 'Chase Atlantic',
                                      imageUrl: 'assets/images/swim_image.png',
                                      duration: const Duration(minutes: 3, seconds: 57),
                                    ),
                                  ),
                                );
                              },
                            ),
                            RecentTrackItem(
                              title: 'Time',
                              artist: 'NF',
                              duration: '02:13',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SongPage(
                                      songTitle: 'Time',
                                      artist: 'NF',
                                      imageUrl: 'assets/images/time_image.png',
                                      duration: const Duration(minutes: 2, seconds: 13),
                                    ),
                                  ),
                                );
                              },
                            ),
                            RecentTrackItem(
                              title: 'Movies',
                              artist: 'Conan Gray',
                              duration: '03:10',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SongPage(
                                      songTitle: 'Movies',
                                      artist: 'Conan Gray',
                                      imageUrl: 'assets/images/movies_image.png',
                                      duration: const Duration(minutes: 3, seconds: 10),
                                    ),
                                  ),
                                );
                              },
                            ),
                            RecentTrackItem(
                              title: 'Lowkey',
                              artist: 'NIKI',
                              duration: '03:00',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SongPage(
                                      songTitle: 'Lowkey',
                                      artist: 'NIKI',
                                      imageUrl: 'assets/images/lowkey_image.png',
                                      duration: const Duration(minutes: 3, seconds: 0),
                                    ),
                                  ),
                                );
                              },
                            ),
                            RecentTrackItem(
                              title: 'Hurt',
                              artist: 'NewJeans',
                              duration: '02:18',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SongPage(
                                      songTitle: 'Hurt',
                                      artist: 'NewJeans',
                                      imageUrl: 'assets/images/hurt_image.png',
                                      duration: const Duration(minutes: 2, seconds: 18),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
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
              crossAxisAlignment: CrossAxisAlignment.center, // Центрирование по горизонтали
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
                        backgroundColor: const Color(0xFF6200EE), // Фиолетовый цвет кнопки
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Закругление углов 50
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