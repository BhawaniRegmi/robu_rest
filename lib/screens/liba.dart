import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Data Model
class Book {
  final String title;
  final String author;
  final String genre;
  Book(this.title, this.author, this.genre);
}

// 2. State Management (Riverpod)
final selectedGenreProvider = StateProvider<String>((ref) => 'All');

void main() {
  runApp(const ProviderScope(child: BookChoiceApp()));
}

class BookChoiceApp extends StatelessWidget {
  const BookChoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const BookSelectionScreen(),
    );
  }
}

class BookSelectionScreen extends ConsumerWidget {
  const BookSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGenre = ref.watch(selectedGenreProvider);
    final genres = ['All', 'Sci-Fi', 'Fantasy', 'Mystery', 'History'];
    
    final books = [
      Book('Dune', 'Frank Herbert', 'Sci-Fi'),
      Book('The Hobbit', 'J.R.R. Tolkien', 'Fantasy'),
      Book('Sherlock Holmes', 'Arthur Conan Doyle', 'Mystery'),
      Book('Sapiens', 'Yuval Noah Harari', 'History'),
    ];

    // Filter books based on choice
    final displayedBooks = selectedGenre == 'All' 
        ? books 
        : books.where((b) => b.genre == selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Style')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 3. Genre Choice Chips
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: SizedBox(
              height: 50,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: genres.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return ChoiceChip(
                    label: Text(genres[index]),
                    selected: selectedGenre == genres[index],
                    onSelected: (bool selected) {
                      ref.read(selectedGenreProvider.notifier).state = genres[index];
                    },
                  );
                },
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Recommended for you', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),

          // 4. Horizontal Book Carousel
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: displayedBooks.length,
              itemBuilder: (context, index) {
                final book = displayedBooks[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const Icon(Icons.book, size: 40),
                    title: Text(book.title),
                    subtitle: Text('${book.author} • ${book.genre}'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
