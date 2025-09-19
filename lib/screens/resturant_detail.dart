import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String restaurantId; // Pass the restaurant ID from scanned QR data
  
  const RestaurantDetailScreen({Key? key, required this.restaurantId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In a real app, you would fetch restaurant data based on restaurantId
    // For now, we'll use mock data
    final restaurant = _getMockRestaurantData();
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Restaurant header with image
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: restaurant['imageUrl'],
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.restaurant, size: 50, color: Colors.grey),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  // Share restaurant details
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // Add to favorites
                },
              ),
            ],
          ),
          
          // Restaurant content
          SliverList(
            delegate: SliverChildListDelegate([
              // Restaurant name and basic info
              _buildRestaurantInfo(restaurant),
              
              // Offers and discounts
              _buildOffersSection(restaurant),
              
              // Menu categories
              _buildMenuSection(restaurant),
              
              // Services and features
              _buildServicesSection(restaurant),
              
              // Other branches
              _buildBranchesSection(restaurant),
              
              // Similar restaurants
              _buildSimilarRestaurants(),
              
              SizedBox(height: 20),
            ]),
          ),
        ],
      ),
      
      // Fixed bottom button
      bottomNavigationBar: _buildReservationButton(),
    );
  }

  Widget _buildRestaurantInfo(Map<String, dynamic> restaurant) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant['name'],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              SizedBox(width: 4),
              Text(
                restaurant['rating'].toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Text(
                '(${restaurant['reviewCount']} reviews)',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.access_time, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                restaurant['openingHours'],
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              SizedBox(width: 4),
              Text(
                restaurant['address'],
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            restaurant['description'],
            style: TextStyle(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildOffersSection(Map<String, dynamic> restaurant) {
    return Container(
      color: Color(0xFFFFF8E1), // Light amber background
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Special Offers & Discounts',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Column(
            children: restaurant['offers'].map<Widget>((offer) {
              return ListTile(
                leading: Icon(Icons.local_offer, color: Color(0xFFFF6D00)),
                title: Text(offer['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(offer['description']),
                trailing: Text(offer['validUntil'], style: TextStyle(fontSize: 12, color: Colors.grey)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(Map<String, dynamic> restaurant) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menu Categories',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: restaurant['menuCategories'].map<Widget>((category) {
              return Chip(
                label: Text(category),
                backgroundColor: Color(0xFF1A237E).withOpacity(0.1),
                labelStyle: TextStyle(color: Color(0xFF1A237E)),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate to full menu screen
            },
            child: Text('View Full Menu'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1A237E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(Map<String, dynamic> restaurant) {
    return Container(
      color: Colors.grey[50],
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services & Features',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 1.0,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: restaurant['services'].map<Widget>((service) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(service['icon'], color: Color(0xFFFF6D00)),
                    SizedBox(height: 8),
                    Text(service['name'], textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildBranchesSection(Map<String, dynamic> restaurant) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Other Branches',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Column(
            children: restaurant['branches'].map<Widget>((branch) {
              return ListTile(
                leading: Icon(Icons.location_on, color: Color(0xFF1A237E)),
                title: Text(branch['name']),
                subtitle: Text(branch['address']),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  // Show branch details or navigation
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarRestaurants() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar Restaurants Nearby',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildSimilarRestaurantCard('Burger Hub', 'Fast Food', Icons.fastfood),
                _buildSimilarRestaurantCard('Cafe Delight', 'Cafe', Icons.coffee),
                _buildSimilarRestaurantCard('Pizza Palace', 'Italian', Icons.local_pizza),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarRestaurantCard(String name, String type, IconData icon) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 12),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Color(0xFF1A237E)),
              SizedBox(height: 8),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(type, style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReservationButton() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))],
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                // Make reservation
              },
              icon: Icon(Icons.calendar_today),
              label: Text('Make Reservation'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF6D00),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          SizedBox(width: 12),
          IconButton(
            icon: Icon(Icons.directions, color: Color(0xFF1A237E)),
            onPressed: () {
              // Open navigation
            },
          ),
        ],
      ),
    );
  }

  // Mock data function - replace with actual API call
  Map<String, dynamic> _getMockRestaurantData() {
    return {
      'name': 'Pizza Palace',
      'rating': 4.5,
      'reviewCount': 248,
      'openingHours': '10:00 AM - 10:00 PM',
      'address': '123 Main Street, City Center',
      'description': 'Authentic Italian pizzeria with wood-fired oven, serving delicious pizzas, pastas, and desserts in a cozy atmosphere.',
      'imageUrl': 'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
      'offers': [
        {
          'title': '15% OFF',
          'description': 'On all pizzas',
          'validUntil': 'Valid until: 30 Dec 2023'
        },
        {
          'title': 'Buy 1 Get 1',
          'description': 'On selected appetizers',
          'validUntil': 'Valid until: 15 Dec 2023'
        },
        {
          'title': 'Free Dessert',
          'description': 'With main course order above ₹500',
          'validUntil': 'Valid until: 31 Dec 2023'
        },
      ],
      'menuCategories': ['Pizzas', 'Pastas', 'Appetizers', 'Salads', 'Desserts', 'Beverages'],
      'services': [
        {'name': 'Home Delivery', 'icon': Icons.delivery_dining},
        {'name': 'Takeaway', 'icon': Icons.takeout_dining},
        {'name': 'Dine-in', 'icon': Icons.restaurant},
        {'name': 'Vegetarian', 'icon': Icons.eco},
        {'name': 'WiFi', 'icon': Icons.wifi},
        {'name': 'Parking', 'icon': Icons.local_parking},
      ],
      'branches': [
        {'name': 'Pizza Palace - Downtown', 'address': '456 Downtown Ave'},
        {'name': 'Pizza Palace - Westside', 'address': '789 Westside Mall'},
        {'name': 'Pizza Palace - East End', 'address': '321 East End Road'},
      ],
    };
  }
}