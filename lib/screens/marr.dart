import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MarriageInvitationScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class MarriageInvitationScreen extends StatelessWidget {
  const MarriageInvitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image or Color
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(white), Color(0xFFFDEFF4)], // Soft pink/white gradient
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Decorative Header
                  const Text(
                    "SAVE THE DATE",
                    style: TextStyle(
                      letterSpacing: 4,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Names of the Couple
                  const Text(
                    "Alex & Jordan",
                    style: TextStyle(
                      fontFamily: 'Georgia', // Or a custom cursive font
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFAD1457), // Deep Rose
                    ),
                  ),
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Icon(Icons.favorite, color: Colors.pink, size: 30),
                  ),

                  // Image Placeholder
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1511285560929-80b456fea0bc'),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Date and Venue
                  const InfoSection(
                    icon: Icons.calendar_today,
                    title: "Saturday, June 14, 2026",
                    subtitle: "At 4:00 in the afternoon",
                  ),
                  
                  const InfoSection(
                    icon: Icons.location_on_outlined,
                    title: "The Grand Rose Ballroom",
                    subtitle: "123 Wedding Lane, New York, NY",
                  ),

                  const SizedBox(height: 40),

                  // RSVP Button
                  ElevatedButton(
                    onPressed: () {
                      // Action for RSVP
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAD1457),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "RSVP NOW",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoSection({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Column(
        children: [
          Icon(icon, color: Colors.brown[300]),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}