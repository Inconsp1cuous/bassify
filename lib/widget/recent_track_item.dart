import 'package:flutter/material.dart';

class RecentTrackItem extends StatelessWidget {
  final String title;
  final String artist;
  final String duration;
  final VoidCallback onPressed;
  final String? imageUrl; // URL изображения (если есть)

  const RecentTrackItem({
    super.key,
    required this.title,
    required this.artist,
    required this.duration,
    required this.onPressed,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50, // Ширина квадрата
        height: 50, // Высота квадрата
        decoration: BoxDecoration(
          color: Colors.grey[800], // Цвет фона, если нет изображения
          borderRadius: BorderRadius.circular(8), // Закругленные углы
          image: imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: imageUrl == null
            ? const Icon(Icons.music_note, color: Colors.white) // Иконка, если нет изображения
            : null,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      subtitle: Text(
        artist,
        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
      ),
      trailing: Text(
        duration,
        style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14),
      ),
      onTap: onPressed,
    );
  }
}