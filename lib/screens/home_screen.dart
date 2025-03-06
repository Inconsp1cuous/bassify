import 'package:flutter/material.dart';
import 'package:Bassify/widget/recent_track_item.dart';
import 'package:Bassify/widget/playlist_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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

                      // Поле поиска с закругленными углами
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
                                imageUrl: null, // Нет фото, будет стандартный вид
                              ),
                              PlaylistButton(
                                text: 'Рок музыка',
                                color1: Colors.redAccent,
                                color2: Colors.orange,
                                icon: Icons.music_note,
                                onPressed: () {},
                                size: 100,
                                imageUrl: null,
                              ),
                              PlaylistButton(
                                text: 'Поп музыка',
                                color1: Colors.pinkAccent,
                                color2: Colors.purpleAccent,
                                icon: Icons.music_note,
                                onPressed: () {},
                                size: 100,
                                imageUrl: null, // Нет фото, будет стандартный вид
                              ),
                              PlaylistButton(
                                text: 'В машину',
                                color1: Colors.green,
                                color2: Colors.teal,
                                icon: Icons.drive_eta,
                                onPressed: () {},
                                size: 100,
                                imageUrl: null, // Нет фото, будет стандартный вид
                              ),
                              PlaylistButton(
                                text: 'Lo-fi Beats',
                                color1: Colors.blueGrey,
                                color2: Colors.cyan,
                                icon: Icons.music_note,
                                onPressed: () {},
                                size: 100,
                                imageUrl: null, // Нет фото, будет стандартный вид
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
                      const SizedBox(height: 65),

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
                            RecentTrackItem(title: 'Swim', artist: 'Chase Atlantic', duration: '03:57', onPressed: () {}),
                            RecentTrackItem(title: 'Time', artist: 'NF', duration: '02:13', onPressed: () {}),
                            RecentTrackItem(title: 'Movies', artist: 'Conan Gray', duration: '03:10', onPressed: () {}),
                            RecentTrackItem(title: 'Lowkey', artist: 'NIKI', duration: '03:00', onPressed: () {}),
                            RecentTrackItem(title: 'Hurt', artist: 'NewJeans', duration: '02:18', onPressed: () {}),
                            RecentTrackItem(title: 'Swim', artist: 'Chase Atlantic', duration: '03:57', onPressed: () {}),
                            RecentTrackItem(title: 'Time', artist: 'NF', duration: '02:13', onPressed: () {}),
                            RecentTrackItem(title: 'Movies', artist: 'Conan Gray', duration: '03:10', onPressed: () {}),
                            RecentTrackItem(title: 'Lowkey', artist: 'NIKI', duration: '03:00', onPressed: () {}),
                            RecentTrackItem(title: 'Hurt', artist: 'NewJeans', duration: '02:18', onPressed: () {}),
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
                    currentIndex: 0,
                    selectedItemColor: const Color(0xFF6200EE), // Цвет выбранной иконки (непрозрачный)
                    unselectedItemColor: Colors.white54, // Цвет невыбранной иконки (полупрозрачный)
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