import 'package:flutter/material.dart';

// --- 1. Data Model ---
class Horoscope {
  final String sign;
  final String dateRange;
  final IconData icon;
  final Color color;

  Horoscope({
    required this.sign,
    required this.dateRange,
    required this.icon,
    required this.color,
  });
}

// --- 2. Sample Data ---
final List<Horoscope> horoscopes = [
  Horoscope(
      sign: 'Aries',
      dateRange: 'Mar 21 - Apr 19',
      icon: Icons.brightness_5,
      color: Colors.red),
  Horoscope(
      sign: 'Taurus',
      dateRange: 'Apr 20 - May 20',
      icon: Icons.ac_unit,
      color: Colors.green),
  Horoscope(
      sign: 'Gemini',
      dateRange: 'May 21 - Jun 20',
      icon: Icons.cloud,
      color: Colors.yellow.shade800),
  Horoscope(
      sign: 'Cancer',
      dateRange: 'Jun 21 - Jul 22',
      icon: Icons.water,
      color: Colors.blue),
  Horoscope(
      sign: 'Leo',
      dateRange: 'Jul 23 - Aug 22',
      icon: Icons.local_fire_department,
      color: Colors.orange),
  Horoscope(
      sign: 'Virgo',
      dateRange: 'Aug 23 - Sep 22',
      icon: Icons.grass,
      color: Colors.teal),
  Horoscope(
      sign: 'Libra',
      dateRange: 'Sep 23 - Oct 22',
      icon: Icons.balance,
      color: Colors.pink),
  Horoscope(
      sign: 'Scorpio',
      dateRange: 'Oct 23 - Nov 21',
      icon: Icons.whatshot,
      color: Colors.deepPurple),
  Horoscope(
      sign: 'Sagittarius',
      dateRange: 'Nov 22 - Dec 21',
      icon: Icons.arrow_upward,
      color: Colors.brown),
  Horoscope(
      sign: 'Capricorn',
      dateRange: 'Dec 22 - Jan 19',
      icon: Icons.diamond,
      color: Colors.blueGrey),
  Horoscope(
      sign: 'Aquarius',
      dateRange: 'Jan 20 - Feb 18',
      icon: Icons.air,
      color: Colors.cyan),
  Horoscope(
      sign: 'Pisces',
      dateRange: 'Feb 19 - Mar 20',
      icon: Icons.waves,
      color: Colors.indigo),
];

// --- 3. Custom Widget for List Item ---
class HoroscopeCard extends StatelessWidget {
  final Horoscope horoscope;

  const HoroscopeCard({super.key, required this.horoscope});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        leading: Icon(
          horoscope.icon,
          size: 40,
          color: horoscope.color,
        ),
        title: Text(
          horoscope.sign,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          horoscope.dateRange,
          style: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Action when the card is tapped (e.g., navigate to detail screen)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Tapped on ${horoscope.sign} Horoscope')),
          );
        },
      ),
    );
  }
}

// --- 4. Main List Screen ---
class HoroscopeListScreen extends StatelessWidget {
  const HoroscopeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zodiac Signs'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: horoscopes.length,
        itemBuilder: (context, index) {
          return HoroscopeCard(horoscope: horoscopes[index]);
        },
      ),
    );
  }
}

// --- Boilerplate Main App (for testing) ---
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horoscope List Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HoroscopeListScreen(),
    );
  }
}