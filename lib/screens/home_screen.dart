import 'package:flutter/material.dart';
import 'package:Bassify/widget/recent_track_item.dart';
import 'package:Bassify/widget/playlist_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addNewPlaylist() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newPlaylistName = '';
        return AlertDialog(
          title: const Text('Новый плейлист'),
          content: TextField(
            onChanged: (value) {
              newPlaylistName = value;
            },
            decoration: const InputDecoration(
              hintText: 'Введите название плейлиста',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Создать'),
              onPressed: () {
                if (newPlaylistName.isNotEmpty) {
                  // Здесь можно добавить логику для создания нового плейлиста
                  print('Создан новый плейлист: $newPlaylistName');
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Фиксированные размеры для имитации экрана телефона
    double phoneWidth = 412;
    double phoneHeight = 917;

    return Scaffold(
      backgroundColor: const Color(0xFF1D1B29),
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
                      SizedBox(
                        width: 350, // Фиксированная ширина
                        height: 50, // Фиксированная высота
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Искать плейлист',
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                            prefixIcon: const Icon(Icons.search, color: Colors.white),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 12), // Отступы внутри поля
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Контейнер для плейлистов
                      Container(
                        width: 350, // 85% от ширины экрана
                        height: 230, // 30% от высоты экрана
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
                              PlaylistButton(
                                text: 'Любимая',
                                color1: Colors.deepPurple,
                                color2: Colors.blueAccent,
                                icon: Icons.favorite,
                                onPressed: () {},
                                size: 100,
                              ),
                              PlaylistButton(
                                text: 'Рок музыка',
                                color1: Colors.redAccent,
                                color2: Colors.orange,
                                icon: Icons.music_note,
                                onPressed: () {},
                                size: 100,
                              ),
                              PlaylistButton(
                                text: 'Поп музыка',
                                color1: Colors.pinkAccent,
                                color2: Colors.purpleAccent,
                                icon: Icons.music_note,
                                onPressed: () {},
                                size: 100,
                              ),
                              PlaylistButton(
                                text: 'В машину',
                                color1: Colors.green,
                                color2: Colors.teal,
                                icon: Icons.drive_eta,
                                onPressed: () {},
                                size: 100,
                              ),
                              PlaylistButton(
                                text: 'Lo-fi Beats',
                                color1: Colors.blueGrey,
                                color2: Colors.cyan,
                                icon: Icons.music_note,
                                onPressed: () {},
                                size: 100,
                              ),
                              // Кнопка для добавления нового плейлиста
                              PlaylistButton(
                                text: 'Добавить',
                                color1: Colors.grey,
                                color2: Colors.grey,
                                icon: Icons.add,
                                onPressed: _addNewPlaylist,
                                size: 100,
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
                        width: 350, // 85% от ширины экрана
                        height: 340, // 35% от высоты экрана
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D1B29),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListView(
                          padding: const EdgeInsets.all(0),
                          children: [
                            RecentTrackItem(title: 'Swim', artist: 'Chase Atlantic', duration: '03:57', onPressed: () {}),
                            RecentTrackItem(title: 'Time', artist: 'NF', duration: '02:13', onPressed: () {}),
                            RecentTrackItem(title: 'Movies', artist: 'Conan Gray', duration: '03:10', onPressed: () {}),
                            RecentTrackItem(title: 'Lowkey', artist: 'NIKI', duration: '03:00', onPressed: () {}),
                            RecentTrackItem(title: 'Hurt', artist: 'NewJeans', duration: '02:18', onPressed: () {}),
                            RecentTrackItem(title: 'Ocean Eyes', artist: 'Billie Eilish', duration: '03:20', onPressed: () {}),
                            RecentTrackItem(title: 'Blinding Lights', artist: 'The Weeknd', duration: '03:22', onPressed: () {}),
                            RecentTrackItem(title: 'Levitating', artist: 'Dua Lipa', duration: '03:23', onPressed: () {}),
                            RecentTrackItem(title: 'Peaches', artist: 'Justin Bieber', duration: '03:18', onPressed: () {}),
                            RecentTrackItem(title: 'Drivers License', artist: 'Olivia Rodrigo', duration: '04:02', onPressed: () {}),
                            RecentTrackItem(title: 'Good 4 U', artist: 'Olivia Rodrigo', duration: '02:58', onPressed: () {}),
                            RecentTrackItem(title: 'Stay', artist: 'The Kid LAROI & Justin Bieber', duration: '02:21', onPressed: () {}),
                            RecentTrackItem(title: 'Montero (Call Me By Your Name)', artist: 'Lil Nas X', duration: '02:50', onPressed: () {}),
                            RecentTrackItem(title: 'Save Your Tears', artist: 'The Weeknd', duration: '03:35', onPressed: () {}),
                            RecentTrackItem(title: 'Kiss Me More', artist: 'Doja Cat ft. SZA', duration: '03:28', onPressed: () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Градиентный прозрачный бар
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100, // Высота градиентного бара
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent, // Полностью прозрачный
                        Colors.black.withOpacity(0.8), // Полупрозрачный черный
                      ],
                    ),
                  ),
                ),
              ),

              // Полупрозрачный BottomNavigationBar с градиентом
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5), // Полупрозрачный черный
                        Colors.black.withOpacity(0.8), // Более насыщенный черный
                      ],
                    ),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent, // Прозрачный фон
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/home_icon.png'),
                          size: 24,
                          color: Color(0xFF6200EE), // Цвет иконки
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/equalizer_icon.png'),
                          size: 24,
                          color: Colors.white, // Цвет иконки
                        ),
                        label: 'Equalizer',
                      ),
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/library_icon.png'),
                          size: 24,
                          color: Colors.white, // Цвет иконки
                        ),
                        label: 'Library',
                      ),
                    ],
                    currentIndex: 0,
                    selectedItemColor: const Color(0xFF6200EE), // Цвет выбранной иконки
                    unselectedItemColor: Colors.white54, // Цвет невыбранной иконки
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