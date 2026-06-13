import 'package:flutter/material.dart';

void main() {
  runApp(const BirthdayApp());
}

class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birthday Wish',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const BirthdayHome(),
    );
  }
}

class BirthdayHome extends StatelessWidget {
  const BirthdayHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Creating a festive gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Happy Birthday!',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'cursive',
                ),
              ),
              const SizedBox(height: 20),
              // Use a placeholder image from the web
              Image.network(
                'https://png.pngtree.com/png-vector/20220909/ourmid/pngtree-colorful-birthday-cake-png-image_6144862.png',
                height: 250,
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Wishing you a day filled with love, laughter, and lots of cake!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () {
                  // A simple snackbar interaction
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('🎉 Celebration Started! 🎂'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: const Text('Tap to Celebrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}