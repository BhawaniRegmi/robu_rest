import 'package:flutter/material.dart';

void main() {
  runApp(const BookListApp());
}

class BookListApp extends StatelessWidget {
  const BookListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookListScreen(),
    );
  }
}

class BookListScreen extends StatelessWidget {
  // Sample data for the books
  final List<Book> books = [
    Book(
      title: "The Great Gatsby",
      author: "F. Scott Fitzgerald",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Book(
      title: "1984",
      author: "George Orwell",
      imageUrl: "https://via.placeholder.com/150",
    ),
    Book(
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      imageUrl: "https://via.placeholder.com/150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Book Library"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: Image.network(
                book.imageUrl,
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                book.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(book.author),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // You can add navigation to a details page here
                print("Tapped on ${book.title}");
              },
            ),
          );
        },
      ),
    );
  }
}