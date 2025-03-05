import 'package:flutter/material.dart';

class PlaylistButton extends StatelessWidget {
  final String text;
  final Color color1, color2;
  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  const PlaylistButton({
    Key? key,
    required this.text,
    required this.color1,
    required this.color2,
    required this.icon,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 8),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}