import 'package:flutter/material.dart';

void main() => runApp(const UniversityApp());

class UniversityApp extends StatelessWidget {
  const UniversityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const UniversityListScreen(),
    );
  }
}

class UniversityListScreen extends StatelessWidget {
  const UniversityListScreen({super.key});

  // Mock data based on 2026 World Rankings
  final List<University> universities = [
    University(name: "University of Oxford", location: "United Kingdom", rank: "1", logoUrl: "https://via.placeholder.com/150"),
    University(name: "Massachusetts Institute of Technology (MIT)", location: "United States", rank: "2", logoUrl: "https://via.placeholder.com/150"),
    University(name: "Stanford University", location: "United States", rank: "3", logoUrl: "https://via.placeholder.com/150"),
    University(name: "University of Cambridge", location: "United Kingdom", rank: "4", logoUrl: "https://via.placeholder.com/150"),
    University(name: "Harvard University", location: "United States", rank: "5", logoUrl: "https://via.placeholder.com/150"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Universities 2026"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: universities.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final uni = universities[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Text(uni.rank, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              title: Text(uni.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(uni.location),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // You can add navigation to a detail page here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Selected ${uni.name}")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}