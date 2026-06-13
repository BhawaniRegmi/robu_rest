import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Attendance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AttendanceScreen(),
    );
  }
}

class Student {
  final String name;
  bool isPresent;

  Student({
    required this.name,
    this.isPresent = false,
  });
}

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<Student> students = [
    Student(name: 'Ram Sharma'),
    Student(name: 'Sita Rai'),
    Student(name: 'Hari Thapa'),
    Student(name: 'Gita Karki'),
    Student(name: 'Aayush KC'),
  ];

  int get presentCount =>
      students.where((student) => student.isPresent).length;

  int get absentCount =>
      students.where((student) => !student.isPresent).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Attendance'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'Present',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      '$presentCount',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Absent',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      '$absentCount',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: student.isPresent
                          ? Colors.green
                          : Colors.red,
                      child: Text(
                        student.name[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(student.name),
                    subtitle: Text(
                      student.isPresent ? 'Present' : 'Absent',
                      style: TextStyle(
                        color: student.isPresent
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Switch(
                      value: student.isPresent,
                      onChanged: (value) {
                        setState(() {
                          student.isPresent = value;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Attendance Saved Successfully'),
                    ),
                  );
                },
                child: const Text(
                  'Save Attendance',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}