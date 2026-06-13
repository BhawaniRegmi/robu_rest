class TeaHomePage extends StatelessWidget {
  final List<String> categories = ["Green Tea", "Black Tea", "Oolong", "Herbal"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(backgroundColor: Colors.green[100], child: Icon(Icons.person, color: Colors.green)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Morning Tea,", style: TextStyle(fontSize: 18, color: Colors.grey)),
            Text("Find your flavor", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search your tea...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            SizedBox(height: 20),

            // Category List
            Container(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(categories[index], 
                    style: TextStyle(fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                    color: index == 0 ? Colors.green : Colors.grey)),
                ),
              ),
            ),

            // Tea Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  TeaCard(name: "Matcha Latte", price: "4.50", image: "🍵"),
                  TeaCard(name: "Earl Grey", price: "3.50", image: "☕"),
                  TeaCard(name: "Jasmine Tea", price: "3.90", image: "🌿"),
                  TeaCard(name: "Oolong Special", price: "5.00", image: "🍂"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}