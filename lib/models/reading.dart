import 'package:flutter/material.dart';

class FutureReadingExample extends StatefulWidget {
  const FutureReadingExample({super.key});

  @override
  State<FutureReadingExample> createState() => _FutureReadingExampleState();
}

class _FutureReadingExampleState extends State<FutureReadingExample> {
  // 1. Define the Future variable
  late Future<String> _dataFuture;

  @override
  void initState() {
    super.initState();
    // 2. Initialize it in initState to prevent unnecessary re-runs
    _dataFuture = _fetchMockData();
  }

  // A mock function simulating an API call
  Future<String> _fetchMockData() async {
    await Future.delayed(const Duration(seconds: 2));
    // Uncomment the next line to test error handling:
    // throw Exception("Failed to load data!");
    return "Data loaded successfully!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Future Reading")),
      body: Center(
        child: FutureBuilder<String>(
          future: _dataFuture,
          builder: (context, snapshot) {
            // 3. Handle the "Loading" state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } 
            
            // 4. Handle the "Error" state
            else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } 
            
            // 5. Handle the "Data" state
            else if (snapshot.hasData) {
              return Text(
                snapshot.data!,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            }

            return const Text("No data found");
          },
        ),
      ),
    );
  }
}