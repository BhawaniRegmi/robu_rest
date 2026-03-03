import 'package:flutter/material.dart';

void main() => runApp(const HotelApp());

class HotelApp extends StatelessWidget {
  const HotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 120.0,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Find your stay", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
              centerTitle: false,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.person, color: Colors.blue)),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Popular Destinations", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildDestinationCard("Maldives", "https://images.unsplash.com/photo-1514282401047-d79a71a590e8?w=400"),
                        _buildDestinationCard("Paris", "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=400"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Nearby Hotels", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const HotelCard(),
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(String title, String imageUrl) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.7), Colors.transparent]),
        ),
        child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  const HotelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network("https://images.unsplash.com/photo-1566073771259-6a8506099945?w=600", height: 180, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Grand Hyatt Resort", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("\$240/night", style: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold)),
                  ],
                ),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    Text(" 4.8 (120 reviews)", style: TextStyle(color: Colors.grey)),
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