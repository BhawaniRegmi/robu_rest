import 'package:flutter/material.dart';

void main() {
  runApp(const VeggieApp());
}

class VeggieApp extends StatelessWidget {
  const VeggieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.location_on, color: Colors.green),
        title: const Text("Green Garden, NY", style: TextStyle(color: Colors.black, fontSize: 16)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Fresh Vegetables\nFor Your Health",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 25),
            const Text("Categories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildCategoryList(),
            const SizedBox(height: 25),
            Expanded(child: _buildProductGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: "Search vegetables...",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    List<String> categories = ["All", "Leafy", "Roots", "Organic", "Cruciferous"];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: index == 0 ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: index == 0 ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return _buildVeggieCard(
          ["Broccoli", "Carrots", "Spinach", "Bell Pepper"][index],
          ["\$2.50", "\$1.80", "\$3.00", "\$4.20"][index],
          [Colors.green[100], Colors.orange[100], Colors.lightGreen[100], Colors.red[100]][index]!,
        );
      },
    );
  }

  Widget _buildVeggieCard(String name, String price, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.eco, size: 50, color: Colors.white), // Replace with Image.asset
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text("$price / kg", style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 10),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: Icon(Icons.add, color: color, size: 20),
          )
        ],
      ),
    );
  }
}