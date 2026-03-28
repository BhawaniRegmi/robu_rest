import 'package:flutter/material.dart';

void main() => runApp(const KitchenApp());

class KitchenApp extends StatelessWidget {
  const KitchenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Digital Kitchen', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("What are we cooking today?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            // Categories
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ['Breakfast', 'Lunch', 'Dinner', 'Desserts'].map((cat) => 
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Chip(label: Text(cat), backgroundColor: Colors.orange.shade50),
                  )
                ).toList(),
              ),
            ),
            const SizedBox(height: 20),
            // Recipe List
            Expanded(
              child: ListView(
                children: [
                  RecipeCard(recipe: Recipe(title: "Garlic Butter Shrimp", duration: "15 min", difficulty: "Easy", image: "https://via.placeholder.com/150")),
                  RecipeCard(recipe: Recipe(title: "Beef Wellington", duration: "2 hours", difficulty: "Hard", image: "https://via.placeholder.com/150")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: const Center(child: Icon(Icons.restaurant, size: 50, color: Colors.white)),
          ),
          ListTile(
            title: Text(recipe.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${recipe.duration} • ${recipe.difficulty}"),
            trailing: const Icon(Icons.favorite_border, color: Colors.red),
          ),
        ],
      ),
    );
  }
}