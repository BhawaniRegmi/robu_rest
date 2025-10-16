import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // 1. Define the base and highlight colors for the shimmer animation
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      
      // 2. Wrap the widget you want to "shimmer"
      child: ListView.builder(
        itemCount: 6, // Number of loading items
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Placeholder for an image or avatar
                Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white, // Color of the skeleton content
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Placeholder for a title line
                      Container(
                        width: double.infinity,
                        height: 8.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                      ),
                      // Placeholder for a subtitle line
                      Container(
                        width: 40.0,
                        height: 8.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}