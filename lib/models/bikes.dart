class Bike {
  // 1. Properties (fields) of the Bike model
  final String id;
  final String modelName;
  final String manufacturer;
  final double price;
  final int year;
  final List<String> availableColors;

  // 2. Constructor for creating a Bike object
  const Bike({
    required this.id,
    required this.modelName,
    required this.manufacturer,
    required this.price,
    required this.year,
    required this.availableColors,
  });

  // 3. Factory method to create a Bike object from a JSON map
  factory Bike.fromJson(Map<String, dynamic> json) {
    return Bike(
      id: json['id'] as String,
      modelName: json['modelName'] as String,
      manufacturer: json['manufacturer'] as String,
      price: json['price'] as double,
      year: json['year'] as int,
      // Safely cast dynamic List to List<String>
      availableColors: (json['availableColors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }

  // 4. Method to convert a Bike object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'modelName': modelName,
      'manufacturer': manufacturer,
      'price': price,
      'year': year,
      'availableColors': availableColors,
    };
  }

  // 5. Optional: copyWith method for immutable state management
  Bike copyWith({
    String? id,
    String? modelName,
    String? manufacturer,
    double? price,
    int? year,
    List<String>? availableColors,
  }) {
    return Bike(
      id: id ?? this.id,
      modelName: modelName ?? this.modelName,
      manufacturer: manufacturer ?? this.manufacturer,
      price: price ?? this.price,
      year: year ?? this.year,
      availableColors: availableColors ?? this.availableColors,
    );
  }
}