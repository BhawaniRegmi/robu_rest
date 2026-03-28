import 'package:flutter/material.dart';

void main() => runApp(const CookingApp());

class CookingApp extends StatelessWidget {
  const CookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: const RecipeListScreen(),
    );
  }
}

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Digital Cookbook'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          RecipeCard(
            title: 'Classic Margherita Pizza',
            cookTime: '20 min',
            rating: '4.8',
            imageUrl: 'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca',
          ),
          SizedBox(height: 16),
          RecipeCard(
            title: 'Avocado Toast Deluxe',
            cookTime: '10 min',
            rating: '4.5',
            imageUrl: 'https://images.unsplash.com/photo-1525351484163-7529414344d8',
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title, cookTime, rating, imageUrl;

  const RecipeCard({
    super.key, 
    required this.title, 
    required this.cookTime, 
    required this.rating, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Image.network(imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.timer, size: 18, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(cookTime),
                    const Spacer(),
                    const Icon(Icons.star, size: 18, color: Colors.amber),
                    Text(rating),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

