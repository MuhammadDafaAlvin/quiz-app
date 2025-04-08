import 'package:flutter/material.dart';
import 'quiz_data.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Informatika',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        fontFamily: 'sfpro',
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  final Quiz _quiz = QuizData();

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  int get totalQuestions => _quiz.getQuestions().length;

  set currentQuestionIndex(int value) {
    if (value >= 0 && value < totalQuestions) {
      setState(() => _currentQuestionIndex = value);
    }
  }

  set score(int value) {
    if (value >= 0) {
      setState(() => _score = value);
    }
  }

  void checkAnswer(bool selectedAnswer) {
    if (selectedAnswer == _quiz.getCorrectAnswer(_currentQuestionIndex)) {
      _score++;
    }
    if (_currentQuestionIndex < totalQuestions - 1) {
      _currentQuestionIndex++;
    } else {
      showResult();
    }
    setState(() {});
  }

  void showResult() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: Colors.grey[850],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text(
              'Quiz Selesai!',
              style: TextStyle(
                fontFamily: 'sfpro',
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.tealAccent,
              ),
            ),
            content: Text(
              'Skor Anda: $_score / $totalQuestions',
              style: const TextStyle(
                fontFamily: 'sfpro',
                fontSize: 20,
                color: Colors.white70,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _currentQuestionIndex = 0;
                    _score = 0;
                  });
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ulangi Quiz',
                  style: TextStyle(fontFamily: 'sfpro', fontSize: 16),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz Informatika',
          style: TextStyle(
            fontFamily: 'sfpro',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.teal[800]!],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Card(
              color: Colors.grey[800],
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pertanyaan ${_currentQuestionIndex + 1}/$totalQuestions',
                          style: const TextStyle(
                            fontFamily: 'sfpro',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.tealAccent,
                          ),
                        ),
                        Chip(
                          label: Text(
                            'Skor: $_score',
                            style: const TextStyle(
                              fontFamily: 'sfpro',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: Colors.teal[700],
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.tealAccent, width: 1),
                      ),
                      child: Text(
                        _quiz.getQuestionText(_currentQuestionIndex),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'sfpro',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => checkAnswer(true),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(140, 60),
                            backgroundColor: Colors.teal[600],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'True',
                            style: TextStyle(
                              fontFamily: 'sfpro',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => checkAnswer(false),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(140, 60),
                            backgroundColor: Colors.red[700],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text(
                            'False',
                            style: TextStyle(
                              fontFamily: 'sfpro',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
