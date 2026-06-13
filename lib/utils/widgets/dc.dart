import 'package:flutter/material.dart';

void main() {
  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarePulse',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0C6B58), // Deep clinical teal
          primary: const Color(0xFF0C6B58),
          secondary: const Color(0xFFE8F5E9),
        ),
        debugShowCheckedModeBanner: false,
        home: const MainLayout(),
      );
    }
  }
}

// ==========================================
// MODELS & DATA COHORTS
// ==========================================
class Doctor {
  final String name;
  final String specialty;
  final double rating;
  final String imagePlaceholder;

  Doctor({required this.name, required this.specialty, required this.rating, required this.imagePlaceholder});
}

// ==========================================
// NAVIGATION CONTAINER
// ==========================================
class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const MedicalDashboard(),
    const AppointmentBookingScreen(),
    const Center(child: Text('Secure Messages & Telehealth Logs')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.calendar_month), label: 'Bookings'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Consults'),
        ],
      ),
    );
  }
}

// ==========================================
// COMPONENT 1: MAIN MEDICAL DASHBOARD
// ==========================================
class MedicalDashboard extends StatelessWidget {
  const MedicalDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Doctor> topDoctors = [
      Doctor(name: 'Dr. Sarah Jenkins', specialty: 'Cardiologist', rating: 4.9, imagePlaceholder: 'SJ'),
      Doctor(name: 'Dr. Marcus Vance', specialty: 'Pediatrician', rating: 4.8, imagePlaceholder: 'MV'),
    ];

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Header Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome back,', style: TextStyle(color: Colors.grey, fontSize: 14)),
                Text('Elena Rostova', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Icon(Icons.shield_outlined, color: Theme.of(context).colorScheme.primary),
            )
          ],
        ),
        const SizedBox(height: 24),

        // Core Urgent Care Banner
        Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Need Immediate Care?', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      const Text('Connect with an on-duty clinician via video triage in under 5 minutes.', style: TextStyle(color: Colors.whiteBF, fontSize: 13)),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Theme.of(context).colorScheme.primary),
                        onPressed: () {},
                        icon: const Icon(Icons.video_call),
                        label: const Text('Start Video Triage'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),

        // Quick Triage Symptom Selectors
        const Text('What symptoms are you experiencing?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildSymptomChip(Icons.thermostat, 'Fever', Colors.orange),
              _buildSymptomChip(Icons.air, 'Cough', Colors.blue),
              _buildSymptomChip(Icons.heart_broken, 'Chest Pain', Colors.red),
              _buildSymptomChip(Icons.biotech, 'Allergy', Colors.purple),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Assigned Verified Care Providers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Your Verified Providers', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextButton(onPressed: () {}, child: const Text('See All')),
          ],
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: topDoctors.length,
          itemBuilder: (context, index) {
            final doc = topDoctors[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Text(doc.imagePlaceholder, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                ),
                title: Text(doc.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${doc.specialty} • ★ ${doc.rating}'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AppointmentBookingScreen()));
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSymptomChip(IconData icon, String label, Color color) {
    return Container(
      width: 85,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// ==========================================
// COMPONENT 2: INTERACTIVE SCHEDULER
// ==========================================
class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  State<AppointmentBookingScreen> createState() => _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  int _selectedDayIndex = 0;
  int _selectedTimeIndex = -1;

  final List<String> days = ['Mon 25', 'Tue 26', 'Wed 27', 'Thu 28', 'Fri 29'];
  final List<String> timeSlots = ['09:00 AM', '10:30 AM', '11:00 AM', '02:00 PM', '03:30 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Consult'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Embedded Context Summary
            Row(
              children: [
                const CircleAvatar(radius: 24, child: Text('SJ')),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Dr. Sarah Jenkins', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text('Cardiology Consultation', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            const Text('Select Date', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedDayIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedDayIndex = index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Center,
                      child: Text(
                        days[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),

            const Text('Available Time Openings', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(timeSlots.length, (index) {
                bool isSelected = _selectedTimeIndex == index;
                return ChoiceChip(
                  label: Text(timeSlots[index]),
                  selected: isSelected,
                  selectedColor: Theme.of(context).colorScheme.primaryContainer,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedTimeIndex = selected ? index : -1;
                    });
                  },
                );
              }),
            ),
            const Spacer(),

            // Confirmation Execution Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: _selectedTimeIndex == -1 
                  ? null 
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Appointment locked for ${days[_selectedDayIndex]} at ${timeSlots[_selectedTimeIndex]}')),
                      );
                    },
                child: const Text('Confirm Secure Booking', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}