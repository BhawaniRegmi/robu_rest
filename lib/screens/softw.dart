import 'package:flutter/material.dart';

void main() {
  runApp(const ERPApp());
}

class ERPApp extends StatelessWidget {
  const ERPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const ERPDashboard(),
    );
  }
}

class ERPDashboard extends StatelessWidget {
  const ERPDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // List of ERP Modules
    final List<Map<String, dynamic>> modules = [
      {'title': 'Inventory', 'icon': Icons.inventory_2, 'color': Colors.blue},
      {'title': 'Finance', 'icon': Icons.account_balance_wallet, 'color': Colors.green},
      {'title': 'HR Management', 'icon': Icons.people, 'color': Colors.orange},
      {'title': 'Sales', 'icon': Icons.shopping_cart, 'color': Colors.red},
      {'title': 'Reports', 'icon': Icons.bar_chart, 'color': Colors.purple},
      {'title': 'Settings', 'icon': Icons.settings, 'color': Colors.grey},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enterprise Resource Pro'),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          const CircleAvatar(child: Icon(Icons.person)),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const Drawer(), // Side menu for deep navigation
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back, Admin",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  return ERPModuleCard(
                    title: modules[index]['title'],
                    icon: modules[index]['icon'],
                    color: modules[index]['color'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ERPModuleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const ERPModuleCard({super.key, required this.title, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle navigation to specific module here
        print("Navigating to $title");
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}