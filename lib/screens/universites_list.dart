import 'package:flutter/material.dart';

void main() {
  runApp(const UniversityListApp());
}

// 1. Data Model (defined above)
class University {
  final String name;
  final String location;

  University({required this.name, required this.location});
}

// 2. Sample Data Source
final List<University> universities = [
  University(name: 'Tech University', location: 'City A'),
  University(name: 'State College', location: 'City B'),
  University(name: 'Metropolitan Institute', location: 'City C'),
  University(name: 'Global University', location: 'City D'),
  University(name: 'East Coast School of Arts', location: 'City E'),
  // Add more universities here...
];

// 3. Main Application Widget
class UniversityListApp extends StatelessWidget {
  const UniversityListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'University List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UniversityListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// 4. University List Screen
class UniversityListPage extends StatelessWidget {
  const UniversityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Directory'),
      ),
      // ListView.builder is efficient for long lists
      body: ListView.builder(
        // The number of items in the list
        itemCount: universities.length,
        // The function that builds each item's widget
        itemBuilder: (context, index) {
          final university = universities[index];
          
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: ListTile(
              // Main title is the university name
              title: Text(
                university.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // Subtitle is the university location
              subtitle: Text(university.location),
              // Leading icon for visual appeal
              leading: const Icon(Icons.school, color: Colors.blue),
              // Optional: Handle taps on the list item
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped on ${university.name}'),
                    duration: const Duration(seconds: 1),
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