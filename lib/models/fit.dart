import 'package:flutter/material.dart';

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        cardColor: const Color(0xFF1D1D1D),
      ),
      home: const FitnessDashboard(),
    );
  }
}

class FitnessDashboard extends StatelessWidget {
  const FitnessDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Morning, Alex!'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [IconButton(icon: const Icon(Icons.person_outline), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMainProgress(),
            const SizedBox(height: 30),
            const Text("Activity Status", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Expanded(child: _buildActivityGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainProgress() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Steps", style: TextStyle(color: Colors.grey, fontSize: 16)),
              Text("8,432", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Text("Goal: 10,000", style: TextStyle(color: Colors.greenAccent)),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  value: 0.84,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[800],
                  color: Colors.greenAccent,
                ),
              ),
              const Text("84%"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActivityGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: [
        _activityCard("Heart Rate", "72 bpm", Icons.favorite, Colors.redAccent),
        _activityCard("Sleep", "7h 20m", Icons.bedtime, Colors.blueAccent),
        _activityCard("Calories", "450 kcal", Icons.local_fire_department, Colors.orangeAccent),
        _activityCard("Water", "1.2 L", Icons.water_drop, Colors.cyanAccent),
      ],
    );
  }

  Widget _activityCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: color, size: 30),
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}




