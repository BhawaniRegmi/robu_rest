import 'package:flutter/material.dart';

void main() => runApp(const BusApp());

class BusApp extends StatelessWidget {
  const BusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const BusListScreen(),
    );
  }
}

class Bus {
  final String routeNumber;
  final String destination;
  final String arrivalTime;
  final double capacity; // 0.0 to 1.0

  Bus(this.routeNumber, this.destination, this.arrivalTime, this.capacity);
}

class BusListScreen extends StatelessWidget {
  const BusListScreen({super.key});

  final List<Bus> buses = const [
    // Mock Data
    Bus('24B', 'Central Station', '5 mins', 0.8),
    Bus('101', 'Airport Terminal 1', '12 mins', 0.3),
    Bus('55', 'Downtown Square', '18 mins', 0.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Bus Tracker'),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: () {})],
      ),
      body: Column(
        children: [
          // Simulated Map Area
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.grey[300],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map, size: 50, color: Colors.grey),
                  Text("Map View Placeholder"),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("Nearby Buses", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: buses.length,
              itemBuilder: (context, index) {
                final bus = buses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Text(bus.routeNumber, style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(bus.destination),
                    subtitle: Text("Crowd level: ${(bus.capacity * 100).toInt()}%"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(bus.arrivalTime, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                    onTap: () {
                      // Navigate to details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}