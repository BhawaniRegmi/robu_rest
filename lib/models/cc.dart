import 'package:flutter/material.dart';

void main() => runApp(CricketApp());

class CricketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1A1A1A),
        scaffoldBackgroundColor: Color(0xFF121212),
      ),
      home: ScoreboardHome(),
    );
  }
}

class ScoreboardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CricStream Live'),
        actions: [IconButton(icon: Icon(Icons.notifications), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Live Now", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            LiveMatchCard(),
            SizedBox(height: 25),
            Text("Upcoming Matches", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(child: MatchList()),
          ],
        ),
      ),
    );
  }
}

class LiveMatchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.blue.shade900, Colors.blue.shade600]),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text("ICC World Cup - Final", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TeamScore(teamName: "IND", score: "342/5", overs: "50.0"),
              Text("vs", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TeamScore(teamName: "AUS", score: "210/3", overs: "32.4"),
            ],
          ),
          Divider(color: Colors.white24, height: 30),
          Text("Australia needs 133 runs in 104 balls", style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class TeamScore extends StatelessWidget {
  final String teamName, score, overs;
  TeamScore({required this.teamName, required this.score, required this.overs});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(backgroundColor: Colors.white24, child: Text(teamName[0])),
        SizedBox(height: 8),
        Text(teamName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(score, style: TextStyle(fontSize: 16)),
        Text("($overs)", style: TextStyle(fontSize: 12, color: Colors.white60)),
      ],
    );
  }
}

class MatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white10,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Icon(Icons.sports_cricket, color: Colors.orange),
            title: Text("ENG vs NZ"),
            subtitle: Text("Tomorrow, 09:30 AM"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }
}