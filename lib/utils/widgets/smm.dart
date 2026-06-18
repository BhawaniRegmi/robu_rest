import 'package:flutter/material.dart';

void main() {
  runApp(const SchoolApp());
}

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Portal',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardScreen(),
    );
  }
}

// ==========================================
// MOCK DATA MODELS
// ==========================================
class Announcement {
  final String title;
  final String date;
  final String content;

  Announcement({required this.title, required this.date, required this.content});
}

class Assignment {
  final String subject;
  final String title;
  final String dueDate;
  bool isCompleted;

  Assignment({
    required this.subject,
    required this.title,
    required this.dueDate,
    this.isCompleted = false,
  });
}

// ==========================================
// DASHBOARD SCREEN
// ==========================================
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Announcement> announcements = [
    Announcement(title: 'Annual Sports Day', date: 'May 25', content: 'Registrations close this Friday. Wear team colors!'),
    Announcement(title: 'Mid-Term Exams Schedule', date: 'June 01', content: 'The exam schedule has been posted on the notice board.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Portal', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Profile Welcome Card
            Card(
              elevation: 2,
              color: Theme.of(context).colorScheme.primary,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40, color: Colors.indigo),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome back, Alex!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('Grade 10 - Section A', style: TextStyle(color: Colors.white70, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Quick Actions Grid
            const Text('Quick Links', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildMenuCard(context, 'Attendance', Icons.calendar_month, Colors.teal, const AttendanceScreen()),
                _buildMenuCard(context, 'Assignments', Icons.assignment, Colors.orange, const AssignmentsScreen()),
                _buildMenuCard(context, 'Report Card', Icons.bar_chart, Colors.purple, null),
                _buildMenuCard(context, 'Fees', Icons.credit_card, Colors.blue, null),
              ],
            ),
            const SizedBox(height: 24),

            // Announcements Section
            const Text('Recent Announcements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                final note = announcements[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.campaign)),
                    title: Text(note.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(note.content),
                    trailing: Text(note.date, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, Color color, Widget? targetScreen) {
    return InkWell(
      onTap: () {
        if (targetScreen != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title module coming soon!')),
          );
        }
      },
      child: Card(
        elevation: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// ATTENDANCE SCREEN
// ==========================================
class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance History')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Card(
              color: Colors.teal,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('94%', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Attendance Rate', style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    VerticalDivider(color: Colors.white),
                    Column(
                      children: [
                        Text('162/172', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Days Present', style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('May 21, 2026'),
                    subtitle: Text('Present'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text('May 20, 2026'),
                    subtitle: Text('Present'),
                  ),
                  ListTile(
                    leading: Icon(Icons.cancel, color: Colors.red),
                    title: Text('May 19, 2026'),
                    subtitle: Text('Absent (Sick Leave)'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// ASSIGNMENTS SCREEN
// ==========================================
class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({super.key});

  @override
  State<AssignmentsScreen> createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> {
  final List<Assignment> tasks = [
    Assignment(subject: 'Mathematics', title: 'Calculus Exercise 4.2', dueDate: 'May 23'),
    Assignment(subject: 'Physics', title: 'Lab Report on Optics', dueDate: 'May 26'),
    Assignment(subject: 'English Literature', title: 'Essay: Themes in Macbeth', dueDate: 'May 28'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pending Assignments')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            child: CheckboxListTile(
              title: Text(task.title, style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null)),
              subtitle: Text('${task.subject} • Due: ${task.dueDate}'),
              value: task.isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  task.isCompleted = value ?? false;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

// ==========================================
// SIDE NAVIGATION DRAWER
// ==========================================
class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Excel High School', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                Text('info@excelhigh.edu', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Dashboard'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}