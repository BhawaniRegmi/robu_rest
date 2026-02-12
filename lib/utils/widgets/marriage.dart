import 'package:flutter/material.dart';

void main() {
  runApp(const MarriageApp());
}

class MarriageApp extends StatelessWidget {
  const MarriageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Georgia'), // Classic font style
      home: const MarriageScreen(),
    );
  }
}

class MarriageScreen extends StatelessWidget {
  const MarriageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1519741497674-611481863552?auto=format&fit=crop&q=80'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
              ),
            ),
          ),
          
          // Content Overlay
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'SAVE THE DATE',
                      style: TextStyle(color: Colors.white, letterSpacing: 4, fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Julian & Sophia',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(color: Colors.white60, thickness: 1, indent: 50, endIndent: 50),
                    const SizedBox(height: 20),
                    const Text(
                      'MAY 24th, 2026',
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'AT 4:30 PM',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'The Rosewood Garden\n123 Floral Lane, California',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18, height: 1.5),
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.9),
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text('RSVP NOW', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}