import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const UniversityApp());

class UniversityApp extends StatelessWidget {
  const UniversityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const UniversityListScreen(),
    );
  }
}

class UniversityListScreen extends StatefulWidget {
  const UniversityListScreen({super.key});

  @override
  State<UniversityListScreen> createState() => _UniversityListScreenState();
}

class _UniversityListScreenState extends State<UniversityListScreen> {
  // Function to fetch data from the Hipo Universities API
  Future<List<dynamic>> fetchUniversities() async {
    const url = 'http://universities.hipolabs.com/search?country=United+States';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load universities');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Universities'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUniversities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No universities found.'));
          }

          final universities = snapshot.data!;

          return ListView.builder(
            itemCount: universities.length,
            itemBuilder: (context, index) {
              final uni = universities[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.school),
                  ),
                  title: Text(
                    uni['name'] ?? 'Unknown University',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(uni['domains']?[0] ?? 'No website domain'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Action when tapping a university
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Selected: ${uni['name']}')),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}