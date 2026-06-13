import 'package:flutter/material.dart';
import 'screens/student_dashboard.dart';

void main() {
  runApp(const SchoolApp());
}

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff3f51b5), // Classic school blue
          primary: const Color(0xff3f51b5),
          secondary: const Color(0xffffc107), // Accent amber
        ),
      ),
      home: const StudentDashboard(),
    );
  }
}