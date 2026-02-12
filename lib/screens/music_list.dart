import 'package:flutter/material.dart';

void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MusicListPage(),
    );
  }
}

// Define a simple data model for a Song
class Song {
  final String title;
  final String artist;
  final String duration;

  Song({required this.title, required this.artist, this.duration = '3:45'});
}

class MusicListPage extends StatefulWidget {
  const MusicListPage({super.key});

  @override
  State<MusicListPage> createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicListPage> {
  // Sample data for the music list
  final List<Song> _songs = [
    Song(title: 'Stairway to Heaven', artist: 'Led Zeppelin', duration: '8:02'),
    Song(title: 'Bohemian Rhapsody', artist: 'Queen', duration: '5:55'),
    Song(title: 'Imagine', artist: 'John Lennon', duration: '3:04'),
    Song(title: 'Smells Like Teen Spirit', artist: 'Nirvana', duration: '5:01'),
    Song(title: 'Hotel California', artist: 'Eagles', duration: '6:30'),
    Song(title: 'Sweet Child o\' Mine', artist: 'Guns N\' Roses', duration: '5:56'),
    Song(title: 'Wonderwall', artist: 'Oasis', duration: '4:18'),
    Song(title: 'Billie Jean', artist: 'Michael Jackson', duration: '4:54'),
    Song(title: 'Hey Jude', artist: 'The Beatles', duration: '7:11'),
    Song(title: 'Like a Rolling Stone', artist: 'Bob Dylan', duration: '6:13'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Playlist 🎶'),
      ),
      // Use ListView.builder for efficient list rendering
      body: ListView.builder(
        itemCount: _songs.length,
        itemBuilder: (context, index) {
          final song = _songs[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0),
            child: MusicListTile(song: song),
          );
        },
      ),
    );
  }
}

// Custom widget for a single song list item
class MusicListTile extends StatelessWidget {
  final Song song;

  const MusicListTile({super.key, required this.song});

  // Function to handle the tap action (e.g., start playing the song)
  void _onTap() {
    debugPrint('Playing song: ${song.title} by ${song.artist}');
    // In a real app, you would integrate a music player here
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _onTap, // Play song on tap
      // Leading widget (e.g., a music note icon or album art)
      leading: const Icon(
        Icons.music_note,
        color: Colors.blueAccent,
        size: 30.0,
      ),
      // Main title and subtitle
      title: Text(
        song.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      subtitle: Text(
        song.artist,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 14.0,
        ),
      ),
      // Trailing widgets (e.g., duration and a play/more options button)
      trailing: Row(
        mainAxisSize: MainAxisSize.min, // Essential to keep the Row small
        children: <Widget>[
          // Song duration
          Text(
            song.duration,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 14.0,
            ),
          ),
          const SizedBox(width: 15),
          // Placeholder for a play button or more options
          IconButton(
            icon: const Icon(Icons.play_circle_fill, color: Colors.green),
            onPressed: _onTap,
          ),
        ],
      ),
    );
  }
}