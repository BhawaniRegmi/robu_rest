import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MaterialApp(home: MusicPlayer()));

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  // Request storage permissions for Android/iOS
  void requestPermission() async {
    await Permission.storage.request();
    setState(() {});
  }

  // Play a specific song by its URI
  void playSong(String? uri) {
    try {
      if (uri != null) {
        _player.setAudioSource(AudioSource.uri(Uri.parse(uri)));
        _player.play();
      }
    } catch (e) {
      debugPrint("Error playing song: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gemini's Jams"),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
          sortType: null,
          orderType: OrderType.ASC_ALPHABETIC,
          uriType: UriType.EXTERNAL,
          ignoreCase: true,
        ),
        builder: (context, item) {
          if (item.data == null) return const Center(child: CircularProgressIndicator());
          if (item.data!.isEmpty) return const Center(child: Text("No Songs Found"));

          return ListView.builder(
            itemCount: item.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(item.data![index].displayNameWOExt),
                subtitle: Text("${item.data![index].artist}"),
                trailing: const Icon(Icons.play_arrow),
                leading: QueryArtworkWidget(
                  id: item.data![index].id,
                  type: ArtworkType.AUDIO,
                ),
                onTap: () => playSong(item.data![index].uri),
              );
            },
          );
        },
      ),
      // Simple Mini Player at the bottom
      bottomNavigationBar: Container(
        color: Colors.deepPurple.shade50,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.skip_previous), onPressed: () {}),
            StreamBuilder<PlayerState>(
              stream: _player.playerStateStream,
              builder: (context, snapshot) {
                final playing = snapshot.data?.playing ?? false;
                return IconButton(
                  icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                  onPressed: playing ? _player.pause : _player.play,
                );
              },
            ),
            IconButton(icon: const Icon(Icons.skip_next), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}



class MainDart {

}