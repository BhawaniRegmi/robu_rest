import 'package:flutter/material.dart';

void main() => runApp(const MusicApp());

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool isPlaying = false;
  double songProgress = 0.3; // Representing 30% of the song played

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.keyboard_arrow_down),
        title: const Text('NOW PLAYING', style: TextStyle(fontSize: 14, letterSpacing: 2)),
        centerTitle: true,
        actions: [const Icon(Icons.more_vert), const SizedBox(width: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Album Art
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/300'), // Replace with your art
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 10))
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // Song Info
            const Text(
              "Midnight City",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              "M83 • Hurry Up, We're Dreaming",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Progress Slider
            Slider(
              activeColor: Colors.greenAccent,
              inactiveColor: Colors.white24,
              value: songProgress,
              onChanged: (value) => setState(() => songProgress = value),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("1:12"), Text("4:03")],
              ),
            ),
            const SizedBox(height: 20),

            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: const Icon(Icons.shuffle, color: Colors.grey), onPressed: () {}),
                IconButton(icon: const Icon(Icons.skip_previous, size: 45), onPressed: () {}),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.greenAccent,
                  child: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Colors.black, size: 40),
                    onPressed: () => setState(() => isPlaying = !isPlaying),
                  ),
                ),
                IconButton(icon: const Icon(Icons.skip_next, size: 45), onPressed: () {}),
                IconButton(icon: const Icon(Icons.repeat, color: Colors.grey), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}







