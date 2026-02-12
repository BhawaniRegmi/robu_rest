import 'package:flutter/material.dart';

// --- Data Model ---
class Song {
  final String title;
  final String artist;
  final Duration duration;

  Song({required this.title, required this.artist, required this.duration});

  String get formattedDuration {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}

// --- Sample Data ---
final List<Song> _musicList = [
  Song(title: "Starlight", artist: "Muse", duration: const Duration(minutes: 4, seconds: 00)),
  Song(title: "Bohemian Rhapsody", artist: "Queen", duration: const Duration(minutes: 5, seconds: 55)),
  Song(title: "Smells Like Teen Spirit", artist: "Nirvana", duration: const Duration(minutes: 5, seconds: 01)),
  Song(title: "Imagine", artist: "John Lennon", duration: const Duration(minutes: 3, seconds: 04)),
  Song(title: "Hotel California", artist: "Eagles", duration: const Duration(minutes: 6, seconds: 30)),
  Song(title: "Billie Jean", artist: "Michael Jackson", duration: const Duration(minutes: 4, seconds: 54)),
];

// --- Main Application Widget ---
class MusicListApp extends StatelessWidget {
  const MusicListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music List Example',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark, // A dark theme suits a music player well
      ),
      home: const MusicListPage(),
    );
  }
}

// --- Music List Page Widget ---
class MusicListPage extends StatelessWidget {
  const MusicListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Playlist 🎵'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: _musicList.length,
        itemBuilder: (context, index) {
          final song = _musicList[index];
          return SongTile(song: song, trackNumber: index + 1);
        },
      ),
    );
  }
}

// --- Custom Song ListTile Widget ---
class SongTile extends StatelessWidget {
  final Song song;
  final int trackNumber;

  const SongTile({
    super.key,
    required this.song,
    required this.trackNumber,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // Leading widget (Track number)
      leading: Text(
        '$trackNumber',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      
      // Title (Song name)
      title: Text(song.title),
      
      // Subtitle (Artist name)
      subtitle: Text(song.artist),
      
      // Trailing widget (Duration and Play icon)
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(song.formattedDuration),
          const SizedBox(width: 10),
          const Icon(Icons.play_arrow, color: Colors.green),
        ],
      ),
      
      // Action when the tile is tapped
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Now playing: ${song.title}')),
        );
      },
    );
  }
}
