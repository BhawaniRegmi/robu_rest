import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:async';

import 'package:robu_rest/screens/login_screen.dart';
import 'package:robu_rest/screens/scan_page.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeTab(),
    ScanTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.restaurant_menu, color: Colors.white),
            SizedBox(width: 8),
            Text('RoboRest', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: const Color(0xFFED1C48), //  #0A2A66 Robust blue
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFFED1C48), // Dash Logistics orange
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}



class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Featured Companies Section with Asset Images
          _buildFeaturedCompanies(),
          SizedBox(height: 24),
          
          // Statistics Section
          _buildStatistics(),
          SizedBox(height: 24),
          
          // Services Provided Section
          _buildServicesSection(),
          SizedBox(height: 24),
          
          // Benefits Section
          _buildBenefitsSection(),
          SizedBox(height: 24),
          
          // Nearby Restaurants Section
          _buildNearbyRestaurants(),
          SizedBox(height: 24),
          
          // Accessible Restaurants Section
          _buildAccessibleRestaurants(),
          SizedBox(height: 24),
          
          // Restaurant Types Section
          _buildRestaurantTypes(),
          SizedBox(height: 24),
          
          // Offers & Discounts Section
          _buildOffersSection(),
        ],
      ),
    );
  }

  Widget _buildFeaturedCompanies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured By',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E), // Robust blue
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Robust Infotech Logo
            Container(
              width: 140,
              height: 100,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/robust.png',
                fit: BoxFit.contain,
              ),
            ),
            
            // Dash Logistics Logo
            Container(
              width: 140,
              height: 100,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/dash.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatistics() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE8EAF6), // Light blue from Robust
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF1A237E).withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('250+', 'Hotels Connected', Color(0xFF1A237E)),
          _buildStatItem('50+', 'Cities Covered', Color(0xFFED1C48)),
          _buildStatItem('1M+', 'Scans Monthly', Color(0xFF1A237E)),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(value, style: TextStyle(
          fontSize: 18, 
          fontWeight: FontWeight.bold,
          color: color,
        )),
        SizedBox(height: 4),
        Text(label, style: TextStyle(
          fontSize: 12, 
          color: Colors.grey[600]
        )),
      ],
    );
  }

  Widget _buildServicesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Services',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E), // Robust blue
          ),
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildServiceChip('Digital Menus', Icons.menu_book, Color(0xFF1A237E)),
            _buildServiceChip('Instant Offers', Icons.local_offer, Color(0xFFED1C48)),
            _buildServiceChip('Quick Scanning', Icons.qr_code, Color(0xFF1A237E)),
            _buildServiceChip('Restaurant Info', Icons.info, Color(0xFFED1C48)),
            _buildServiceChip('Branch Locator', Icons.location_on, Color(0xFF1A237E)),
            _buildServiceChip('Easy Ordering', Icons.shopping_cart, Color(0xFFED1C48)),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceChip(String label, IconData icon, Color color) {
    return Chip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label, style: TextStyle(color: color)),
      backgroundColor: color.withOpacity(0.1),
      side: BorderSide(color: color.withOpacity(0.3)),
    );
  }

  Widget _buildBenefitsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Benefits of Using RoboRest',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E), // Robust blue
          ),
        ),
        SizedBox(height: 12),
        _buildBenefitItem('No physical menu handling', Icons.health_and_safety, Color(0xFF1A237E)),
        _buildBenefitItem('Instant access to latest offers', Icons.flash_on, Color(0xFFED1C48)),
        _buildBenefitItem('Discover new restaurants', Icons.explore, Color(0xFF1A237E)),
        _buildBenefitItem('Time-saving scanning process', Icons.access_time, Color(0xFFED1C48)),
        _buildBenefitItem('Hygienic contactless experience', Icons.clean_hands, Color(0xFF1A237E)),
      ],
    );
  }

  Widget _buildBenefitItem(String text, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text),
      minLeadingWidth: 0,
    );
  }

  Widget _buildNearbyRestaurants() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nearby Restaurants',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E), // Robust blue
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildRestaurantCard('Cafe Delight', '0.5 km', Icons.coffee, Color(0xFF1A237E)),
              _buildRestaurantCard('Pizza Palace', '1.2 km', Icons.local_pizza, Color(0xFFED1C48)),
              _buildRestaurantCard('Burger Hub', '0.8 km', Icons.fastfood, Color(0xFF1A237E)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantCard(String name, String distance, IconData icon, Color color) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
          SizedBox(height: 4),
          Text(distance, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildAccessibleRestaurants() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Easily Accessible Restaurants',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E), // Robust blue
          ),
        ),
        SizedBox(height: 12),
        _buildAccessibilityItem('Wheelchair accessible', Icons.accessible, Color(0xFF1A237E)),
        _buildAccessibilityItem('Vegetarian options', Icons.eco, Color(0xFFED1C48)),
        _buildAccessibilityItem('Vegan friendly', Icons.spa, Color(0xFF1A237E)),
        _buildAccessibilityItem('Gluten-free options', Icons.food_bank, Color(0xFFED1C48)),
      ],
    );
  }

  Widget _buildAccessibilityItem(String text, IconData icon, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text),
      minLeadingWidth: 0,
    );
  }

  Widget _buildRestaurantTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Different Types of Restaurants',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E), // Robust blue
          ),
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildTypeChip('Fine Dining', Icons.star, Color(0xFF1A237E)),
            _buildTypeChip('Casual Dining', Icons.restaurant, Color(0xFFED1C48)),
            _buildTypeChip('Fast Food', Icons.fastfood, Color(0xFF1A237E)),
            _buildTypeChip('Cafe', Icons.coffee, Color(0xFFED1C48)),
            _buildTypeChip('Bar & Pub', Icons.sports_bar, Color(0xFF1A237E)),
            _buildTypeChip('Street Food', Icons.streetview, Color(0xFFED1C48)),
          ],
        ),
      ],
    );
  }

  Widget _buildTypeChip(String label, IconData icon, Color color) {
    return Chip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label, style: TextStyle(color: color)),
      backgroundColor: color.withOpacity(0.1),
      side: BorderSide(color: color.withOpacity(0.3)),
    );
  }

  Widget _buildOffersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Restaurants with Offers & Discounts',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A237E), // Robust blue
          ),
        ),
        SizedBox(height: 12),
        _buildOfferItem('20% OFF', 'On all pizzas at Pizza Palace', Icons.local_pizza, Color(0xFFED1C48)),
        _buildOfferItem('Buy 1 Get 1', 'On burgers at Burger Hub', Icons.fastfood, Color(0xFF1A237E)),
        _buildOfferItem('Free Dessert', 'With main course at Cafe Delight', Icons.cake, Color(0xFFED1C48)),
        _buildOfferItem('15% OFF', 'On all orders above ₹500', Icons.discount, Color(0xFF1A237E)),
      ],
    );
  }

  Widget _buildOfferItem(String discount, String description, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: color.withOpacity(0.2), width: 1),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(discount, style: TextStyle(
          fontWeight: FontWeight.bold, 
          color: color
        )),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: color),
      ),
    );
  }
}






class ProfileTab extends StatelessWidget {
  final bool isLoggedIn = false; // This should come from your auth state

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline,
            size: 80,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            isLoggedIn ? 'Welcome back!' : 'Please login to access your profile',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 30),
          if (!isLoggedIn)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
                
                // Show snackbar after a short delay when returning from login
                Future.delayed(Duration(milliseconds: 500), () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login for better offers and services!'),
                      action: SnackBarAction(
                        label: 'LOGIN',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                      ),
                      duration: Duration(seconds: 3),
                    ),
                  );
                });
              },
              child: Text('Login / Register'),
            ),
          if (isLoggedIn)
            Column(
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('My Profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Scan History'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('Favorites'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                  onTap: () {},
                ),
              ],
            ),
        ],
      ),
    );
  }
}
