import 'package:flutter/material.dart';

class MarriageProfileCard extends StatelessWidget {
  final UserProfile profile;

  const MarriageProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Stack(
        children: [
          // Profile Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              profile.imageUrl,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Gradient Overlay for text readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
            ),
          ),
          // User Details
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${profile.name}, ${profile.age}",
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${profile.occupation} • ${profile.location}",
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}