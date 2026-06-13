class StudentDashboard extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Attendance', 'icon': Icons.calendar_today, 'color': Colors.orange},
    {'title': 'Exams', 'icon': Icons.assignment, 'color': Colors.blue},
    {'title': 'Fees', 'icon': Icons.account_balance_wallet, 'color': Colors.green},
    {'title': 'Library', 'icon': Icons.book, 'color': Colors.purple},
    {'title': 'Timetable', 'icon': Icons.schedule, 'color': Colors.red},
    {'title': 'Results', 'icon': Icons.grade, 'color': Colors.teal},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Portal")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: () {
                  // Navigate to specific feature screen
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(menuItems[index]['icon'], size: 40, color: menuItems[index]['color']),
                    SizedBox(height: 10),
                    Text(menuItems[index]['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}