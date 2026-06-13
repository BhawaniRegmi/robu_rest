import 'package:flutter/material.dart';
import 'flashcard_screen.dart';
import 'timer_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome back, Scholar! 👋', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Here is your progress for today.', style: TextStyle(color: Colors.grey[400])),
            const SizedBox(height: 24),
            
            // Stats Row
            Row(
              children: [
                _buildStatCard('Study Time', '2.5 hrs', Icons.timer, Colors.orangeAccent),
                const SizedBox(width: 16),
                _buildStatCard('Cards Reviewed', '42/50', Icons.style, Colors.blueAccent),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Tools', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Navigation Menu
            _buildToolTile(
              context,
              title: 'Flashcard Deck',
              subtitle: 'Review definitions and active recall notes.',
              icon: Icons.amp_stories_rounded,
              color: Colors.deepPurpleAccent,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FlashcardScreen())),
            ),
            const SizedBox(height: 12),
            _buildToolTile(
              context,
              title: 'Pomodoro Timer',
              subtitle: '25-minute highly focused work intervals.',
              icon: Icons.hourglass_top_rounded,
              color: Colors.redAccent,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TimerScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 16),
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolTile(BuildContext context, {required String title, required String subtitle, required IconData icon, EM? color, required VoidCallback onTap, Color? color}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        leading: CircleAvatar(
          backgroundColor: color?.withOpacity(0.2) ?? Colors.blue.withOpacity(0.2),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[400], fontSize: 13)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}