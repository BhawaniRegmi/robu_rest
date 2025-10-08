import 'package:flutter/material.dart';
import 'data/airplane_data.dart'; // Import your data
import 'models/airplane.dart'; // Import your model

void main() {
  runApp(const AirplaneApp());
}

class AirplaneApp extends StatelessWidget {
  const AirplaneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airplane List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AirplaneListScreen(),
    );
  }
}

class AirplaneListScreen extends StatelessWidget {
  const AirplaneListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('✈️ Global Airplane Fleet'),
      ),
      body: ListView.builder(
        // The itemCount is the length of our data list
        itemCount: airplanes.length,
        
        // The itemBuilder builds each item (widget) as it scrolls into view
        itemBuilder: (context, index) {
          final airplane = airplanes[index];
          
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              // Display the model name as the main title
              title: Text(
                airplane.model,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              
              // Display the manufacturer and capacity as a subtitle
              subtitle: Text(
                'Manufacturer: ${airplane.manufacturer}\nCapacity: ${airplane.capacity} passengers/crew',
              ),
              
              // Add a leading icon for visual appeal
              leading: const Icon(Icons.airplanemode_active, color: Colors.blue),
              
              // Add an arrow to suggest navigaton or detail view
              trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),

              // Handle tap events (optional)
              onTap: () {
                // In a real app, you would navigate to a detail screen here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on ${airplane.model}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}