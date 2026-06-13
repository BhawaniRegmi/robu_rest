import 'package:flutter/material.dart';

void main() {
  runApp(const TimetableApp());
}

class TimetableApp extends StatelessWidget {
  const TimetableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const TimetableScreen(),
    );
  }
}

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of days for the TabBar
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

    return DefaultTabController(
      length: days.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Weekly Schedule'),
          bottom: TabBar(
            isScrollable: false,
            tabs: days.map((day) => Tab(text: day)).toList(),
          ),
        ),
        body: TabBarView(
          children: days.map((day) => DayScheduleList(day: day)).toList(),
        ),
      ),
    );
  }
}

class DayScheduleList extends StatelessWidget {
  final String day;
  const DayScheduleList({super.key, required this.day});

  // Mock data - In a real app, fetch this from a provider or database
  List<Map<String, String>> getEvents(String day) {
    return [
      {'time': '09:00 AM', 'subject': 'Mathematics', 'room': 'Room 302'},
      {'time': '10:30 AM', 'subject': 'Computer Science', 'room': 'Lab 1'},
      {'time': '01:00 PM', 'subject': 'Physics', 'room': 'Room 105'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final events = getEvents(day);

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: events.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Text(
              events[index]['time']!,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            title: Text(events[index]['subject']!, 
              style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: Text(events[index]['room']!),
            trailing: const Icon(Icons.class_outlined),
          ),
        );
      },
    );
  }
}