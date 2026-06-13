import 'package:flutter/material.dart';

void main() => runApp(const AnimalApp());

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const AnimalGallery(),
    );
  }
}

class AnimalGallery extends StatelessWidget {
  const AnimalGallery({super.key});

  // Sample Data
  final List<Animal> animals = [
    Animal(
      name: 'Bengal Tiger',
      species: 'Panthera tigris tigris',
      imageUrl: 'https://images.unsplash.com/photo-1557800636-894a64c1696f',
      description: 'The Bengal tiger is a tiger from a specific population of the Panthera tigris tigris subspecies.',
    ),
    Animal(
      name: 'African Elephant',
      species: 'Loxodonta',
      imageUrl: 'https://images.unsplash.com/photo-1557050543-4d5f4e07ef46',
      description: 'African elephants are the largest land animals on Earth.',
    ),
    // Add more animals here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal Kingdom'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: animals.length,
          itemBuilder: (context, index) {
            final animal = animals[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      animal.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animal.name,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          animal.species,
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}