import 'package:flutter/material.dart';



class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, useMaterial3: true),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Mock Data
  final List<FoodItem> menuItems = [
    FoodItem(id: '1', name: 'Margherita Pizza', category: 'Pizza', price: 12.99, imageUrl: 'https://images.unsplash.com/photo-1574071318508-1cdbad80ad50?q=80&w=200&auto=format&fit=crop'),
    FoodItem(id: '2', name: 'Cheeseburger', category: 'Burgers', price: 9.50, imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=200&auto=format&fit=crop'),
    FoodItem(id: '3', name: 'Pasta Carbonara', category: 'Pasta', price: 14.00, imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?q=80&w=200&auto=format&fit=crop'),
    FoodItem(id: '4', name: 'Garden Salad', category: 'Salads', price: 8.00, imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=200&auto=format&fit=crop'),
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    // Filter logic
    final displayedItems = selectedCategory == 'All' 
        ? menuItems 
        : menuItems.where((item) => item.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gourmet Kitchen', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          _buildCategoryList(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: displayedItems.length,
              itemBuilder: (context, index) => _buildFoodCard(displayedItems[index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    List<String> categories = ['All', 'Pizza', 'Burgers', 'Pasta', 'Salads'];
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedCategory == categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: isSelected,
              onSelected: (val) => setState(() => selectedCategory = categories[index]),
              selectedColor: Colors.orange,
              labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodCard(FoodItem item) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(item.imageUrl, height: 120, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1),
                Text('\$${item.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {},
                    child: const Text('Add to Cart', style: TextStyle(fontSize: 12)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}