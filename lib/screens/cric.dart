import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(home: CricketGame()));

class CricketGame extends StatefulWidget {
  @override
  _CricketGameState createState() => _CricketGameState();
}

class _CricketGameState extends State<CricketGame> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double ballY = -100;
  double ballX = 0;
  int score = 0;
  bool isGameOver = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..addListener(() {
        setState(() {
          ballY += 7; // Speed of the ball
          if (ballY > MediaQuery.of(context).size.height) {
            _resetBall();
          }
        });
      });
    _controller.repeat();
  }

  void _resetBall() {
    ballY = -50;
    ballX = Random().nextDouble() * 200 - 100; // Randomized pitch line
  }

  void _hitBall() {
    // Check if ball is in the "hitting zone" (near the bottom)
    if (ballY > MediaQuery.of(context).size.height * 0.7 && 
        ballY < MediaQuery.of(context).size.height * 0.85) {
      setState(() {
        score += 4;
        _resetBall();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: GestureDetector(
        onTap: _hitBall,
        child: Stack(
          children: [
            // Pitch
            Center(child: Container(width: 150, color: Colors.orange[200])),
            // Scoreboard
            Positioned(top: 50, left: 20, child: Text("Score: $score", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold))),
            // The Ball
            Positioned(
              top: ballY,
              left: MediaQuery.of(context).size.width / 2 + ballX,
              child: CircleAvatar(radius: 12, backgroundColor: Colors.red),
            ),
            // The Bat (Hitting Zone Marker)
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Container(width: 100, height: 10, color: Colors.brown[400]),
            ),
            Positioned(bottom: 40, left: 0, right: 0, child: Center(child: Text("TAP TO SWING", style: TextStyle(color: Colors.white60)))),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}