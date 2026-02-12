class User {
  final int id;
  final String name;
  final String email;
  final String? profilePictureUrl; // Optional field

  // Constructor
  User({
    required this.id,
    required this.name,
    required this.email,
    this.profilePictureUrl,
  });

  // Factory method to create a User object from a JSON map (for API response)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      // Handle the optional field
      profilePictureUrl: json['profilePictureUrl'] as String?,
    );
  }

  // Method to convert a User object back to a JSON map (for API requests, e.g., POST/PUT)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  // Optional: Override toString for easy debugging
  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email)';
  }
}