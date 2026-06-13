import 'package:flutter/material.dart';

void main() => runApp(FishApp());

class FishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FishListScreen(),
    );
  }
}

class FishListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Digital Aquarium')),
      body: ListView.builder(
        itemCount: myFishTank.length,
        itemBuilder: (context, index) {
          final fish = myFishTank[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.blueAccent),
              title: Text(fish.name),
              subtitle: Text(fish.scientificName),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FishDetailScreen(fish: fish),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}