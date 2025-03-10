import 'package:flutter/material.dart';

class RecentTrackItem extends StatelessWidget {
  final String title; // Название трека
  final String artist; // Исполнитель
  final String duration; // Длительность трека
  final VoidCallback onPressed; // Обработчик нажатия
  final String? imageUrl; // URL изображения (если есть)

  const RecentTrackItem({
    Key? key,
    required this.title,
    required this.artist,
    required this.duration,
    required this.onPressed,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Обработчик нажатия
      child: Container(
        margin: const EdgeInsets.only(bottom: 8), // Отступ снизу
        padding: const EdgeInsets.all(16), // Внутренние отступы
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Цвет фона
          borderRadius: BorderRadius.circular(12), // Закругленные углы
        ),
        child: Row(
          children: [
            // Область для изображения
            Container(
              width: 50, // Ширина изображения
              height: 50, // Высота изображения
              decoration: BoxDecoration(
                color: Colors.grey[800], // Цвет фона, если нет изображения
                borderRadius: BorderRadius.circular(8), // Закругленные углы
                image: imageUrl != null
                    ? DecorationImage(
                        image: NetworkImage(imageUrl!), // Загрузка изображения
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: imageUrl == null
                  ? const Icon(
                      Icons.music_note,
                      color: Colors.white, // Иконка, если нет изображения
                    )
                  : null,
            ),
            const SizedBox(width: 16), // Отступ между изображением и текстом
            // Название трека и исполнитель
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4), // Отступ между названием и исполнителем
                  Text(
                    artist,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            // Длительность трека
            Text(
              duration,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}