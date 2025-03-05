import 'package:flutter/material.dart';

class RecentTrackItem extends StatelessWidget {
  final String title;
  final String artist;
  final String duration;
  final VoidCallback onPressed;

  const RecentTrackItem({
    Key? key,
    required this.title,
    required this.artist,
    required this.duration,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.music_note, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: Text(artist, style: const TextStyle(fontSize: 14)),
      trailing: Text(duration, style: const TextStyle(fontSize: 14)),
      onTap: onPressed,
    );
  }
}