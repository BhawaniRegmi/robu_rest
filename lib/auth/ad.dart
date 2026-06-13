import 'package:flutter/material.dart';

void main() => runApp(LandApp());

class LandApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: LandListingScreen(),
    );
  }
}

class LandListingScreen extends StatelessWidget {
  final List<Land> plots = [
    Land(id: '1', title: 'Green Valley Estate', location: 'Austin, TX', price: 250000, size: 5.2, imageUrl: 'https://via.placeholder.com/150'),
    Land(id: '2', title: 'Highland Plains', location: 'Denver, CO', price: 180000, size: 10.0, imageUrl: 'https://via.placeholder.com/150'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Explore Land')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: plots.length,
          itemBuilder: (ctx, i) => LandCard(land: plots[i]),
        ),
      ),
    );
  }
}