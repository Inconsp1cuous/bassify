import 'package:flutter/material.dart';

class PlaylistButton extends StatelessWidget {
  final String text;
  final Color color1;
  final Color color2;
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final String? imageUrl; // URL изображения (если есть)

  const PlaylistButton({
    super.key,
    required this.text,
    required this.color1,
    required this.color2,
    required this.icon,
    required this.onPressed,
    required this.size,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: imageUrl == null
                  ? LinearGradient(
                      colors: [color1, color2],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              image: imageUrl != null
                  ? DecorationImage(
                      image: AssetImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: imageUrl == null
                ? Icon(icon, color: Colors.white, size: 30)
                : null,
          ),
        ),
        const SizedBox(height: 8), // Отступ между картинкой и текстом
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}