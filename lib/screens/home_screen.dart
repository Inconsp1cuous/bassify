import 'package:flutter/material.dart';
import 'package:Bassify/widget/recent_track_item.dart';
import 'package:Bassify/widget/playlist_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class PlaylistButton extends StatelessWidget {
  final String text;
  final Color color1;
  final Color color2;
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final String? imageUrl; // Делаем imageUrl nullable

  const PlaylistButton({
    Key? key,
    required this.text,
    required this.color1,
    required this.color2,
    required this.icon,
    required this.onPressed,
    required this.size,
    this.imageUrl, // imageUrl теперь необязательный параметр
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Если imageUrl не null, показываем изображение, иначе иконку
              imageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
        child: SizedBox(
          width: phoneWidth,
          height: phoneHeight,
          child: Scaffold(
            backgroundColor: const Color(0xFF1D1B29),
            appBar: AppBar(
              backgroundColor: const Color(0xFF1D1B29),
              elevation: 0,
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
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Искать плейлист',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        prefixIcon: const Icon(Icons.search, color: Colors.white),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Контейнер для плейлистов
                  Container(
                    width: 350,
                    height: 230,
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 65),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}