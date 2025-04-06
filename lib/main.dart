import 'package:flutter/material.dart';
import 'quiz_data.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Informatika',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'sfpro',
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
      setState(() {
        _currentQuestionIndex = value;
      });
    }
  }

  set score(int value) {
    if (value >= 0) {
      setState(() {
        _score = value;
      });
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
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: const Text(
              'Hasil Quiz',
              style: TextStyle(
                fontFamily: 'sfpro',
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: Colors.blueAccent,
              ),
            ),
            content: Text(
              'Skor Anda: $_score dari $totalQuestions',
              style: const TextStyle(
                fontFamily: 'sfpro',
                fontSize: 18,
                color: Colors.black87,
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
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Main Lagi',
                  style: TextStyle(fontFamily: 'sfpro', color: Colors.white),
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
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[100]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            color: Colors.blueAccent,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(64, 196, 255, 0.1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'Skor: $_score',
                            style: const TextStyle(
                              fontFamily: 'sfpro',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(64, 196, 255, 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        _quiz.getQuestionText(_currentQuestionIndex),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'sfpro',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => checkAnswer(true),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(120, 50),
                            backgroundColor: Colors.green[400],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                          ),
                          child: const Text(
                            'True',
                            style: TextStyle(
                              fontFamily: 'sfpro',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => checkAnswer(false),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(120, 50),
                            backgroundColor: Colors.red[400],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                          ),
                          child: const Text(
                            'False',
                            style: TextStyle(
                              fontFamily: 'sfpro',
                              fontSize: 18,
                              color: Colors.white,
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
