import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(const FitnessApp());

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Morning, Alex!", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Card
            _buildProgressCard(),
            const SizedBox(height: 30),
            const Text("Activity Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            // Grid of Workouts
            _buildWorkoutGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Daily Goal", style: TextStyle(color: Colors.white70, fontSize: 16)),
              SizedBox(height: 5),
              Text("1,240 kcal", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text("Left: 450 kcal", style: TextStyle(color: Colors.white60)),
            ],
          ),
          CircularPercentIndicator(
            radius: 50.0,
            lineWidth: 10.0,
            percent: 0.7,
            center: const Text("70%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            progressColor: Colors.greenAccent,
            backgroundColor: Colors.white24,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutGrid() {
    final List<Map<String, dynamic>> activities = [
      {"name": "Yoga", "icon": Icons.self_improvement, "color": Colors.orangeAccent},
      {"name": "Running", "icon": Icons.directions_run, "color": Colors.blueAccent},
      {"name": "Weight", "icon": Icons.fitness_center, "color": Colors.pinkAccent},
      {"name": "Cycling", "icon": Icons.directions_bike, "color": Colors.greenAccent},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(activities[index]['icon'], size: 40, color: activities[index]['color']),
              const SizedBox(height: 10),
              Text(activities[index]['name'], style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        );
      },
    );
  }
}