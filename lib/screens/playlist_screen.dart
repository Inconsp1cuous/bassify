import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:Bassify/screens/home_screen.dart';
import 'package:Bassify/screens/equalizer_screen.dart';
import 'package:Bassify/screens/library_screen.dart';
import 'package:Bassify/screens/song_screen.dart';
import 'dart:convert';

class PlaylistScreen extends StatefulWidget {
  final String playlistName;
  final String? imageUrl;
  final IconData icon;

  const PlaylistScreen({
    Key? key,
    required this.playlistName,
    this.imageUrl,
    required this.icon,
  }) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  List<Map<String, String>> songs = [];

  @override
  void initState() {
    super.initState();
    _loadSongs();
  }

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
                  leading: IconButton(
                    icon: Image.asset(
                      'assets/images/arrow_back_icon.png',
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: widget.imageUrl != null
                              ? Image.asset(
                                  widget.imageUrl!,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return _buildIconPlaceholder(widget.icon);
                                  },
                                )
                              : _buildIconPlaceholder(widget.icon),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Text(
                          widget.playlistName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: songs.length,
                        itemBuilder: (context, index) {
                          final song = songs[index];
                          return _buildSong(
                            context,
                            song['title']!,
                            song['artist']!,
                            song['duration']!,
                            song['imageUrl']!,
                          );
                        },
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
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/home_icon.png'),
                          size: 24,
                          color: Colors.white,
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
                          color: Color(0xFF6200EE),
                        ),
                        label: 'Library',
                      ),
                    ],
                    currentIndex: 2,
                    selectedItemColor: const Color(0xFF6200EE),
                    unselectedItemColor: Colors.white54,
                    onTap: (index) {
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
                          break;
                      }
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

  Widget _buildIconPlaceholder(IconData icon) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 100,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _buildSong(BuildContext context, String title, String artist, String duration, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
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

  Duration _parseDuration(String duration) {
    List<String> parts = duration.split(':');
    int minutes = int.parse(parts[0]);
    int seconds = int.parse(parts[1]);
    return Duration(minutes: minutes, seconds: seconds);
  }
}