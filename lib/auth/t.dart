class Tea {
  final String name;
  final String category;
  final String price;
  final String description;
  final String image;

  Tea({required this.name, required this.category, required this.price, required this.description, required this.image});
}

// Sample data
final List<Tea> teaList = [
  Tea(
    name: "Matcha Green Tea",
    category: "Green Tea",
    price: "\$12.00",
    description: "High-quality ceremonial grade matcha from Uji, Japan.",
    image: "https://images.unsplash.com/photo-1582793988951-9aed55099991",
  ),
  Tea(
    name: "Earl Grey",
    category: "Black Tea",
    price: "\$8.50",
    description: "Classic black tea infused with bergamot orange oil.",
    image: "https://images.unsplash.com/photo-1594631252845-29fc458695d7",
  ),
];