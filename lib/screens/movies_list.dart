import 'package:flutter/material.dart';
// import 'movie.dart'; // Uncomment this if you put the model in a separate file

// --- Movie Model (for simplicity, included here) ---
class Movie {
  final String title;
  final String director;
  final int year;

  Movie({required this.title, required this.director, required this.year});
}
// ----------------------------------------------------

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie List Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  // Hardcoded list of movies
  final List<Movie> movies = const [
    Movie(title: 'Inception', director: 'Christopher Nolan', year: 2010),
    Movie(title: 'Pulp Fiction', director: 'Quentin Tarantino', year: 1994),
    Movie(title: 'The Matrix', director: 'Lana Wachowski, Lilly Wachowski', year: 1999),
    Movie(title: 'Parasite', director: 'Bong Joon-ho', year: 2019),
    Movie(title: 'Interstellar', director: 'Christopher Nolan', year: 2014),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            leading: const Icon(Icons.movie),
            title: Text(movie.title),
            subtitle: Text('${movie.director} (${movie.year})'),
            onTap: () {
              // Action when a movie is tapped
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on ${movie.title}')),
              );
            },
          );
        },
      ),
    );
  }
}