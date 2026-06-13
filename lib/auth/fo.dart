import 'package:flutter/material.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.location_on, color: Colors.orange),
        title: const Text("New York, USA", style: TextStyle(fontSize: 16, color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(backgroundColor: Colors.orange[100], child: const Icon(Icons.person, color: Colors.orange)),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Find Your\nFavorite Food", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search for pizza, burgers...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 25),

            // Category Section
            const SectionHeader(title: "Categories"),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryIcon(name: "Burger", icon: "🍔"),
                  CategoryIcon(name: "Pizza", icon: "🍕"),
                  CategoryIcon(name: "Sushi", icon: "🍣"),
                  CategoryIcon(name: "Dessert", icon: "🍰"),
                ],
              ),
            ),

            // Popular Food Section
            const SectionHeader(title: "Popular Now"),
            const SizedBox(height: 15),
            const FoodCard(
              name: "Beef Burger",
              restaurant: "Cheesy Bites",
              price: "12.99",
              rating: "4.8",
              imageUrl: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=500",
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Components
class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Text("View All", style: TextStyle(color: Colors.orange)),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String name;
  final String icon;
  const CategoryIcon({super.key, required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.right(15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 30)),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final String name, restaurant, price, rating, imageUrl;
  const FoodCard({super.key, required this.name, required this.restaurant, required this.price, required this.rating, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(imageUrl, height: 180, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("\$$price", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange)),
                  ],
                ),
                Text(restaurant, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    Text(" $rating", style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}