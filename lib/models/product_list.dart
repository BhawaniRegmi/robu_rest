import 'package:flutter/material.dart';
// Assuming your model is imported
// import '../models/product.dart'; 

class ProductListViewModel extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = true;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  ProductListViewModel() {
    fetchProducts();
  }

  // Placeholder for data fetching logic (from a Repository/Service)
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    // Simulate network delay and data fetching
    await Future.delayed(Duration(seconds: 2)); 
    
    _products = [
      Product(id: '1', name: 'Premium Service', description: 'Complete package.', price: 199.99, imageUrl: '...'),
      Product(id: '2', name: 'Basic Consultation', description: '30-minute call.', price: 49.99, imageUrl: '...'),
      // Add more products/services here
    ];

    _isLoading = false;
    notifyListeners();
  }
}