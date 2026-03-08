import 'dart:async';
import 'package:flutter/material.dart';

class WeddingCountdown extends StatefulWidget {
  final DateTime weddingDate;
  const WeddingCountdown({super.key, required this.weddingDate});

  @override
  _WeddingCountdownState createState() => _WeddingCountdownState();
}

class _WeddingCountdownState extends State<WeddingCountdown> {
  late Timer _timer;
  Duration _duration = const Duration();

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateTimeLeft();
    });
  }

  void _calculateTimeLeft() {
    setState(() {
      _duration = widget.weddingDate.difference(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${_duration.inDays} Days to Go",
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
        Text(
          "${_duration.inHours % 24}h : ${_duration.inMinutes % 60}m : ${_duration.inSeconds % 60}s",
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }
}