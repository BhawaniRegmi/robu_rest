import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimalListScreen(),
    );
  }
}

class AnimalListScreen extends StatelessWidget {
  const AnimalListScreen({super.key});

  final List<String> animals = const [
    'Lion 🦁',
    'Tiger 🐅',
    'Elephant 🐘',
    'Giraffe 🦒',
    'Zebra 🦓',
    'Kangaroo 🦘',
    'Penguin 🐧',
    'Panda 🐼',
    'Dolphin 🐬',
    'Monkey 🐒',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: const Icon(Icons.pets), // A generic icon for all animals
              title: Text(
                animals[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('An awesome creature'),
              onTap: () {
                // Handle the tap event, for example, navigate to a new screen.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You tapped on ${animals[index]}'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}