class Tea {
  final String name;
  final String price;
  final String image;
  final String rating;

  Tea({required this.name, required this.price, required this.image, required this.rating});
}

List<Tea> teaList = [
  Tea(name: 'Green Matcha', price: '\$12.00', image: 'assets/matcha.png', rating: '4.8'),
  Tea(name: 'Earl Grey', price: '\$10.50', image: 'assets/earl_grey.png', rating: '4.5'),
  Tea(name: 'Oolong Tea', price: '\$15.00', image: 'assets/oolong.png', rating: '4.9'),
];