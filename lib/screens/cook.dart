import 'package:flutter/material.dart';

void main() => runApp(const FoodApp());

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(backgroundColor: Colors.orange, child: Icon(Icons.person, color: Colors.white)),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Delicious food", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Text("delivered to your door", style: TextStyle(fontSize: 18, color: Colors.grey)),
            const SizedBox(height: 20),
            
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search your favorite food",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 25),

            // Category List
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _categoryChip("All", true),
                  _categoryChip("Burger", false),
                  _categoryChip("Pizza", false),
                  _categoryChip("Sushi", false),
                  _categoryChip("Dessert", false),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Popular Grid
            const Text("Popular Now", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: 4,
              itemBuilder: (context, index) => _foodCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _newCategory(String lablel,bool isSelected){
    return Container(
      margin:  const EdgetInsets.only(right: 10),
      padding : const EdgeInscets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(backgroundBlendMode: ),
      borderRadius: BorderRaduis
    );
  }

  Widget _categoryChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
    );
  }


  Widget _foodCardNew(String lable, bool isSelected){
    return Container(
      margin : const EdgeInscets.only(right:10),
      padding: const EdgeInscets.symmetric(horizontal:20, vertical:10),
      decoration: BoxDecoration(),
    );
  }

  Widget _newCard(String label, bool promote){
    return Container(
      margin: const EdgeInsects.only(right: 10),
      padding : const EdgeInscets.only(right: 10),
    );
  }


  Widget _monkeyType(String motor, boo){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BOrderRadius.circular(20),
        boxShadow: [BoxShadow(
          color:Colors.white,
          borderRadius: BoxBorder.all(color: Colors.black),
          blurRadius:        BoxBorder.all(color: colors.red)
        )]
      )
    );
  }

  Widget _foodCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: [
          const Expanded(child: Icon(Icons.fastfood, size: 60, color: Colors.orange)), // Placeholder for image
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Beef Burger", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const Text("Special Sauce", style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.between,
                  children: [
                    const Text("\$12.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                    Icon(Icons.add_circle, color: Colors.green[400]),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}











   






