import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  final List<String> _questions = [
    "Select the correct synonym for 'Diligent'.",
    "Identify the main idea of the paragraph above.",
    "Which word completes the sentence: 'The results were _____'?"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IELTS Reading Practice"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: LinearProgressIndicator(value: (_currentIndex + 1) / _questions.length),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Question ${_currentIndex + 1} of ${_questions.length}", 
                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            SizedBox(height: 20),
            Text(_questions[_currentIndex], style: TextStyle(fontSize: 18)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentIndex > 0 ? () => setState(() => _currentIndex--) : null,
                  child: Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: _currentIndex < _questions.length - 1 
                    ? () => setState(() => _currentIndex++) 
                    : () => _showResults(),
                  child: Text(_currentIndex == _questions.length - 1 ? "Finish" : "Next"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showResults() {
    // Logic to navigate to result screen
  }
}