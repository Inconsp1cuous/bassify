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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x1D1B29), // Пример цвета
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Действие при нажатии на поиск
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Плейлисты',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Искать плейлист',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                PlaylistButton(
                  text: 'Любимая',
                  color1: const Color(0xFF6200EE),
                  color2: const Color(0xFF03DAC6),
                  icon: Icons.favorite,
                  onPressed: () {},
                ),
                PlaylistButton(
                  text: 'Рок музыка',
                  color1: const Color(0xFF6200EE),
                  color2: const Color(0xFF03DAC6),
                  icon: Icons.music_note,
                  onPressed: () {},
                ),
                PlaylistButton(
                  text: 'Поп музыка',
                  color1: const Color(0xFF6200EE),
                  color2: const Color(0xFF03DAC6),
                  icon: Icons.music_note,
                  onPressed: () {},
                ),
                PlaylistButton(
                  text: 'В машину',
                  color1: const Color(0xFF6200EE),
                  color2: const Color(0xFF03DAC6),
                  icon: Icons.drive_eta,
                  onPressed: () {},
                ),
                PlaylistButton(
                  text: 'Lo-fi Beats',
                  color1: const Color(0xFF6200EE),
                  color2: const Color(0xFF03DAC6),
                  icon: Icons.music_note,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Недавние треки',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            RecentTrackItem(
              title: 'Swim',
              artist: 'Chase Atlantic',
              duration: '03:57',
              onPressed: () {},
            ),
            RecentTrackItem(
              title: 'Time',
              artist: 'NF',
              duration: '02:13',
              onPressed: () {},
            ),
            RecentTrackItem(
              title: 'Movies',
              artist: 'Conan Gray',
              duration: '03:10',
              onPressed: () {},
            ),
            RecentTrackItem(
              title: 'Lowkey',
              artist: 'NIKI',
              duration: '03:00',
              onPressed: () {},
            ),
            RecentTrackItem(
              title: 'Hurt',
              artist: 'NewJeans',
              duration: '02:18',
              onPressed: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            label: 'Equalizer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFF6200EE),
        onTap: (index) {
          // Действие при нажатии на элемент
        },
      ),
    );
  }
}