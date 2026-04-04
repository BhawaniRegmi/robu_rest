import 'package:flutter/material.dart';

void main() => runApp(const EducationApp());

class EducationApp extends StatelessWidget {
  const EducationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello, Learner!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text("What do you want to learn today?", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  CircleAvatar(backgroundColor: Colors.indigo.shade100, child: const Icon(Icons.person)),
                ],
              ),
              const SizedBox(height: 20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search courses...",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
              const SizedBox(height: 25),

              const Text("Popular Courses", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 15),

              // Horizontal Course List
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popularCourses.length,
                  itemBuilder: (context, index) {
                    final course = popularCourses[index];
                    return CourseCard(course: course);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(course.thumbnail, height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(course.instructor, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    Text(course.rating.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}