import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueAccent),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Explore", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      Text("the beautiful world!", style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                  CircleAvatar(backgroundColor: Colors.blue.shade100, child: const Icon(Icons.person)),
                ],
              ),
              const SizedBox(height: 25),
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search destinations...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 25),
              // Category Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular Places", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("View All", style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 15),
              // Travel Card List
              SizedBox(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    TravelCard(image: "https://picsum.photos/id/10/400/600", title: "Bali, Indonesia", price: "\$450"),
                    TravelCard(image: "https://picsum.photos/id/13/400/600", title: "Santorini, Greece", price: "\$820"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String image, title, price;
  const TravelCard({super.key, required this.image, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black.withOpacity(0.8), Colors.transparent]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price, style: const TextStyle(color: Colors.white70)),
                const Icon(Icons.favorite_border, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}