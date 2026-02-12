import 'dart:convert';

class Review {
  final String id;
  final String userId;
  final String productId;
  final double rating; // Typically a double, e.g., 4.5
  final String comment;
  final DateTime dateCreated;

  Review({
    required this.id,
    required this.userId,
    required this.productId,
    required this.rating,
    this.comment = '', // Default empty comment
    required this.dateCreated,
  });

  // 1. Factory constructor to create a Review object from a JSON Map
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String,
      userId: json['userId'] as String,
      productId: json['productId'] as String,
      // Use num for flexibility (int or double from JSON) and ensure it's a double
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String? ?? '',
      // Convert ISO 8601 String back to DateTime
      dateCreated: DateTime.parse(json['dateCreated'] as String),
    );
  }

  // 2. Method to convert a Review object to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'productId': productId,
      'rating': rating,
      'comment': comment,
      // Convert DateTime to ISO 8601 String for JSON storage/API
      'dateCreated': dateCreated.toIso8601String(),
    };
  }

  // 3. Optional: Method for easy debugging/printing
  @override
  String toString() {
    return 'Review(id: $id, userId: $userId, rating: $rating, comment: "$comment")';
  }
}

// ---------------------------
// Example Usage
// ---------------------------

void main() {
  // Creating a new Review object
  final newReview = Review(
    id: 'REV002',
    userId: 'USER123',
    productId: 'PROD456',
    rating: 5.0,
    comment: 'Amazing product, highly recommend!',
    dateCreated: DateTime.now(),
  );

  print('Original Review: $newReview');
  print('---');

  // Convert object to JSON Map (for sending to an API)
  final reviewJsonMap = newReview.toJson();
  print('JSON Map: $reviewJsonMap');
  print('---');

  // Convert the JSON Map back to a Review object (e.g., after fetching from an API)
  final fetchedReview = Review.fromJson(reviewJsonMap);
  print('Fetched Review Object: $fetchedReview');
}