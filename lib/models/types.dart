class IceCreamMenu extends StatelessWidget {
  final List<IceCreamFlavor> flavors = [
    IceCreamFlavor(name: "Vanilla", price: "\$3.50", color: Colors.amber[50]!, icon: "🍦"),
    IceCreamFlavor(name: "Chocolate", price: "\$4.00", color: Colors.brown[100]!, icon: "🍫"),
    IceCreamFlavor(name: "Strawberry", price: "\$3.75", color: Colors.pink[50]!, icon: "🍓"),
    IceCreamFlavor(name: "Mint Chip", price: "\$4.50", color: Colors.green[50]!, icon: "🌿"),
    IceCreamFlavor(name: "Pistachio", price: "\$4.25", color: Colors.lightGreen[100]!, icon: "🥝"),
    IceCreamFlavor(name: "Blueberry", price: "\$4.00", color: Colors.blue[50]!, icon: "🫐"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ice Cream Flavors", style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.8, // Adjusts the height of the card
          ),
          itemCount: flavors.length,
          itemBuilder: (context, index) {
            final flavor = flavors[index];
            return Container(
              decoration: BoxDecoration(
                color: flavor.color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(flavor.icon, style: const TextStyle(fontSize: 50)),
                  const SizedBox(height: 10),
                  Text(
                    flavor.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    flavor.price,
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Add"),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}