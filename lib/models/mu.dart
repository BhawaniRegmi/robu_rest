import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MusicApp());

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const MusicPlayerScreen(),
    );
  }
}

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _player;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  // Placeholder audio URL
  final String url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    // Listen to player state (playing/paused)
    _player.onPlayerStateChanged.listen((state) {
      setState(() => isPlaying = state == PlayerState.playing);
    });

    // Listen to audio duration
    _player.onDurationChanged.listen((newDuration) {
      setState(() => duration = newDuration);
    });

    // Listen to current position
    _player.onPositionChanged.listen((newPosition) {
      setState(() => position = newPosition);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Now Playing")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Album Art Placeholder
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.music_note, size: 100),
            ),
            const SizedBox(height: 32),
            const Text("SoundHelix Song 1", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("Example Artist", style: TextStyle(fontSize: 18, color: Colors.grey)),
            
            // Progress Slider
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await _player.seek(position);
              },
            ),
            
            // Timestamps
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.between,
                children: [
                  Text(_formatDuration(position)),
                  Text(_formatDuration(duration - position)),
                ],
              ),
            ),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(iconSize: 48, icon: const Icon(Icons.skip_previous), onPressed: () {}),
                IconButton(
                  iconSize: 64,
                  icon: Icon(isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
                  onPressed: () async {
                    if (isPlaying) {
                      await _player.pause();
                    } else {
                      await _player.play(UrlSource(url));
                    }
                  },
                ),
                IconButton(iconSize: 48, icon: const Icon(Icons.skip_next), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}