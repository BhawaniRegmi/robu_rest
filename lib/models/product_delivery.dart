// delivery_product.dart

class DeliveryProduct {
  //  Fields (Properties) of the product
  final String id;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final String? imageUrl; // Optional image URL
  final String category;

  //  Constructor
  DeliveryProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    this.imageUrl,
    required this.category,
  });

  // --- JSON Serialization Methods ---

  //  Factory constructor to create a DeliveryProduct from a JSON map (e.g., from an API response)
  factory DeliveryProduct.fromJson(Map<String, dynamic> json) {
    return DeliveryProduct(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      // Handle potential number types (int or double) for price
      price: (json['price'] as num).toDouble(),
      // Handle potential number types (int or double) for quantity, but we expect an int
      quantity: (json['quantity'] as num).toInt(), 
      imageUrl: json['imageUrl'] as String?,
      category: json['category'] as String,
    );
  }

  //  Method to convert the DeliveryProduct object to a JSON map (e.g., for sending to an API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'category': category,
    };
  }

  // --- Utility Methods (Optional but Recommended) ---

  // 🖊️ Method for creating a copy with optional new values (useful for state management like BLoC/Provider)
  DeliveryProduct copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    int? quantity,
    String? imageUrl,
    String? category,
  }) {
    return DeliveryProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
    );
  }

  // 🏷️ Simple string representation for easy debugging
  @override
  String toString() {
    return 'DeliveryProduct(id: $id, name: $name, price: $price, quantity: $quantity)';
  }
}