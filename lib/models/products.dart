import 'dart:convert';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stockQuantity;
  final List<String> imageUrls;
  final bool isAvailable;
  final DateTime? lastUpdated;

  Product({
    required this.id,
    required this.name,
    this.description = '', // Default value
    required this.price,
    this.stockQuantity = 0, // Default value
    this.imageUrls = const [], // Default empty list
    this.isAvailable = true, // Default value
    this.lastUpdated,
  });

  // 1. Factory constructor to create a Product from a JSON Map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '', // Handle potential null
      price: (json['price'] as num).toDouble(), // Use num for flexibility (int or double)
      stockQuantity: json['stockQuantity'] as int? ?? 0,
      // Safely cast or default the list
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          const [],
      isAvailable: json['isAvailable'] as bool? ?? true,
      lastUpdated: json['lastUpdated'] != null
          ? DateTime.parse(json['lastUpdated'] as String)
          : null,
    );
  }

  // 2. Method to convert a Product object to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'stockQuantity': stockQuantity,
      'imageUrls': imageUrls,
      'isAvailable': isAvailable,
      // Convert DateTime to ISO 8601 String for JSON
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }

  // 3. Optional: Method to create a copy of the object with some fields changed (for immutability)
  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? stockQuantity,
    List<String>? imageUrls,
    bool? isAvailable,
    DateTime? lastUpdated,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      imageUrls: imageUrls ?? this.imageUrls,
      isAvailable: isAvailable ?? this.isAvailable,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  // 4. Optional: Override toString for easy debugging/printing
  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, stockQuantity: $stockQuantity, isAvailable: $isAvailable)';
  }
}

// ---------------------------
// Example Usage
// ---------------------------

void main() {
  // Example JSON data (e.g., from an API call)
  const jsonString = '''
  {
    "id": "PROD001",
    "name": "Luxury T-Shirt",
    "description": "100% Cotton, comfortable fit.",
    "price": 49.99,
    "stockQuantity": 150,
    "imageUrls": ["url/img1.jpg", "url/img2.jpg"],
    "isAvailable": true,
    "lastUpdated": "2025-10-26T06:00:00.000Z"
  }
  ''';

  // 1. Decode JSON string to Map
  final Map<String, dynamic> productMap = json.decode(jsonString);

  // 2. Convert Map to Product object using the factory constructor
  final product = Product.fromJson(productMap);
  print('Product Object: $product');

  // 3. Convert Product object back to JSON Map
  final productJson = product.toJson();
  print('Product JSON Map: $productJson');

  // 4. Use copyWith
  final updatedProduct = product.copyWith(price: 59.99, stockQuantity: 149);
  print('Updated Product: $updatedProduct');
}