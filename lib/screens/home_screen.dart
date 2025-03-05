import 'package:flutter/material.dart';
import 'package:Bassify/widget/recent_track_item.dart';
import 'package:Bassify/widget/playlist_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
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
                      TextField(
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
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: const Color(0xFF1D1B29),
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
                  currentIndex: 0,
                  selectedItemColor: const Color(0xFF6200EE),
                  unselectedItemColor: Colors.white54,
                  onTap: (index) {
                    // Действие при нажатии на элемент навигации
                  },
                ),
              ),

              // Градиентный черный бар
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
            ],
          ),
        ),
      ),
    );
  }
}