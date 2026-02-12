import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: AccountCoursesPage()));

class AccountCoursesPage extends StatelessWidget {
  const AccountCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Courses', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          CourseCard(
            title: 'Advanced Flutter UI',
            instructor: 'Dr. Sarah Smith',
            progress: 0.75,
            imageColor: Colors.blueAccent,
          ),
          CourseCard(
            title: 'Firebase for Beginners',
            instructor: 'John Doe',
            progress: 0.30,
            imageColor: Colors.orangeAccent,
          ),
          CourseCard(
            title: 'Dart Design Patterns',
            instructor: 'Alex Rivera',
            progress: 1.0,
            imageColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String instructor;
  final double progress;
  final Color imageColor;

  const CourseCard({
    super.key,
    required this.title,
    required this.instructor,
    required this.progress,
    required this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Course Thumbnail Placeholder
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: imageColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.book, color: imageColor, size: 40),
            ),
            const SizedBox(width: 16),
            // Course Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('By $instructor', style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 12),
                  // Progress Bar
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200],
                    color: progress == 1.0 ? Colors.green : Colors.blue,
                    minHeight: 6,
                  ),
                  const SizedBox(height: 4),
                  Text('${(progress * 100).toInt()}% Completed', style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


