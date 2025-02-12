import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DifficultyScreen(),
    );
  }
}

class DifficultyScreen extends StatefulWidget {
  const DifficultyScreen({Key? key}) : super(key: key);

  @override
  _DifficultyScreenState createState() => _DifficultyScreenState();
}

class _DifficultyScreenState extends State<DifficultyScreen> {
  int _easyScore = 0;
  int _mediumScore = 0;
  int _hardScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2917FF), // Purple background for the whole screen
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display total score
            Text(
              'Total Score: ${_easyScore + _mediumScore + _hardScore}',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white, // White text for total score
              ),
            ),
            const SizedBox(height: 20),

            // Display current scores for each level
            Text(
              'Easy Level Score: $_easyScore',
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            Text(
              'Medium Level Score: $_mediumScore',
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            Text(
              'Hard Level Score: $_hardScore',
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(top: 45.0), // Adjust this value to move the text lower or higher
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Choose Difficulty',
                  style: const TextStyle(
                    fontSize: 30, // Modify the font size as needed
                    fontWeight: FontWeight.bold, // Bold font
                    color: Colors.white, // White text color
                    letterSpacing: 2.0, // Optional: Adjust the spacing between letters
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Easy level button with 1 star
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(400, 70),
                minimumSize: const Size(400, 70), // Set the same size for all buttons
                backgroundColor: Colors.green, // Green background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10, // Shadow
                shadowColor: Colors.black45,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlipCardsMatchingScreen(
                      totalPairs: 4,
                      onScoreUpdate: (score) {
                        setState(() {
                          _easyScore = score;
                        });
                      },
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'EASY (4 pairs)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 1),
                  // 1 star for easy level
                  const Icon(
                    Icons.star,
                    size: 30,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Medium level button with 2 stars
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(400, 70),
                minimumSize: const Size(250, 70), // Set the same size for all buttons
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
                shadowColor: Colors.black45,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlipCardsMatchingScreen(
                      totalPairs: 8,
                      onScoreUpdate: (score) {
                        setState(() {
                          _mediumScore = score;
                        });
                      },
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'MEDIUM (8 pairs)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 1),
                  // 2 stars for medium level
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Hard level button with 3 stars
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(400, 70),
                minimumSize: const Size(250, 70), // Set the same size for all buttons
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10,
                shadowColor: Colors.black45,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlipCardsMatchingScreen(
                      totalPairs: 10,
                      onScoreUpdate: (score) {
                        setState(() {
                          _hardScore = score;
                        });
                      },
                    ),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HARD (10 pairs)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 1),
                  // 3 stars for hard level
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        size: 30,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Finish button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 70), // Set the same size for all buttons
                backgroundColor: Colors.blue, // Blue background for finish button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10, // Shadow
                shadowColor: Colors.black45,
              ),
              onPressed: () {
                // Add finish functionality
              },
              child: const Text(
                'Finish',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text for finish button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FlipCardsMatchingScreen extends StatefulWidget {
  final int totalPairs;
  final Function(int) onScoreUpdate;

  const FlipCardsMatchingScreen({Key? key, required this.totalPairs, required this.onScoreUpdate}) : super(key: key);

  @override
  _FlipCardsMatchingScreenState createState() => _FlipCardsMatchingScreenState();
}

class _FlipCardsMatchingScreenState extends State<FlipCardsMatchingScreen> {
  List<String> _cardContents = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"];
  late List<String> _cards;
  List<bool> _flipped = [];
  List<int> _openedCards = [];
  int _score = 0;
  int _pairsFound = 0;

  @override
  void initState() {
    super.initState();
    _cards = _cardContents.take(widget.totalPairs).toList() + _cardContents.take(widget.totalPairs).toList();
    _cards.shuffle();
    _flipped = List.generate(_cards.length, (index) => false);
  }

  void _flipCard(int index) {
    if (_flipped[index] || _openedCards.length == 2) return;
    setState(() {
      _flipped[index] = true;
      _openedCards.add(index);

      if (_openedCards.length == 2) {
        Future.delayed(const Duration(seconds: 1), () {
          if (_cards[_openedCards[0]] == _cards[_openedCards[1]]) {
            setState(() {
              _score += 10;
              _pairsFound++;
            });
          } else {
            setState(() {
              _flipped[_openedCards[0]] = false;
              _flipped[_openedCards[1]] = false;
            });
          }
          _openedCards.clear();

          if (_pairsFound == widget.totalPairs) {
            widget.onScoreUpdate(_score);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(score: _score),
              ),
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2917FF),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              label: Text('Score: $_score'),
              backgroundColor: Colors.amber,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF2917FF),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _cards.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _flipCard(index),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _flipped[index]
                    ? Card(
                  key: ValueKey('card_${_cards[index]}'),
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      _cards[index],
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                )
                    : Card(
                  key: ValueKey('back_${_cards[index]}'),
                  color: Colors.grey,
                  child: const Center(
                    child: Text(
                      '❓',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;

  const ResultScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2917FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Game Over!',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Score: $score',
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(400, 70),
                minimumSize: const Size(250, 70), // Set the same size for all buttons
                backgroundColor: Colors.blue, // Blue background for finish button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10, // Shadow
                shadowColor: Colors.black45,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FlipCardsMatchingScreen(
                      totalPairs: 4, // Додати тут необхідний рівень
                      onScoreUpdate: (score) {},
                    ),
                  ),
                );
              },
              child: const Text(
                  'Play Again',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(400, 70),
                minimumSize: const Size(250, 70), // Set the same size for all buttons
                backgroundColor: Colors.blue, // Blue background for finish button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10, // Shadow
                shadowColor: Colors.black45,
              ),
              onPressed: () {
                // Повертаємось на головне меню для вибору рівнів
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text(
                  'Back to Main Menu',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
