// main.dart

import 'package:flutter/material.dart';

// 1. Create a simple data model for a Job
class Job {
  final String title;
  final String company;
  final String location;

  Job({required this.title, required this.company, required this.location});
}

// A list of dummy jobs to display
final List<Job> jobs = [
  Job(
    title: 'Software Engineer',
    company: 'Google',
    location: 'Mountain View, CA',
  ),
  Job(
    title: 'Product Manager',
    company: 'Microsoft',
    location: 'Redmond, WA',
  ),
  Job(
    title: 'UX Designer',
    company: 'Apple',
    location: 'Cupertino, CA',
  ),
  Job(
    title: 'Data Scientist',
    company: 'Amazon',
    location: 'Seattle, WA',
  ),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Job Listings'),
          backgroundColor: Colors.blueAccent,
        ),
        body: JobListingScreen(),
      ),
    );
  }
}

class JobListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // The number of items in the list
      itemCount: jobs.length,
      // The builder function creates each list item
      itemBuilder: (context, index) {
        final job = jobs[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: const Icon(Icons.work),
            title: Text(job.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            subtitle: Text('${job.company} - ${job.location}'),
            onTap: () {
              // Action to perform when the user taps on a job item
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Tapped on ${job.title} at ${job.company}'),
                ),
              );
            },
          ),
        );
      },
    );
  }
}