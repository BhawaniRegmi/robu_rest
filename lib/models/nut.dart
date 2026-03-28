import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

void main() => runApp(const NutritionApp());

class NutritionApp extends StatelessWidget {
  const NutritionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Daily Intake")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Calorie Progress Section
            Card(
              elevation: 0,
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 10.0,
                      percent: 0.7,
                      center: const Text("1,400\nkcal", textAlign: TextAlign.center),
                      progressColor: Colors.green,
                      backgroundColor: Colors.white,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Goal: 2,000", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Carbs: 150g", style: TextStyle(color: Colors.blueGrey)),
                        Text("Protein: 80g", style: TextStyle(color: Colors.blueGrey)),
                        Text("Fat: 45g", style: TextStyle(color: Colors.blueGrey)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Today's Meals", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            
            // Food List
            const FoodItemTile(name: "Oatmeal & Blueberries", calories: "320 kcal", time: "8:00 AM"),
            const FoodItemTile(name: "Grilled Chicken Salad", calories: "450 kcal", time: "1:30 PM"),
            const FoodItemTile(name: "Protein Shake", calories: "180 kcal", time: "4:00 PM"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class FoodItemTile extends StatelessWidget {
  final String name;
  final String calories;
  final String time;

  const FoodItemTile({super.key, required this.name, required this.calories, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.fastfood_outlined, color: Colors.green),
      title: Text(name),
      subtitle: Text(time),
      trailing: Text(calories, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}


class MainClass extends StatefulWidget{
  const MainClass();
  int value;
  String name;
  
} 