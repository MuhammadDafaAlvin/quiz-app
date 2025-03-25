import 'package:flutter/material.dart';

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
  int currentQuestionIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Apa kepanjangan dari CPU?',
      'options': [
        'Central Processing Unit',
        'Computer Personal Unit',
        'Central Program Utility',
        'Computer Power Unit',
      ],
      'correctAnswer': 'Central Processing Unit',
    },
    {
      'question': 'Bahasa pemrograman apa yang diciptakan pertama kali?',
      'options': ['Python', 'C++', 'Java', 'Fortran'],
      'correctAnswer': 'Fortran',
    },
    {
      'question': 'Berapa bit dalam 1 byte?',
      'options': ['4', '8', '16', '32'],
      'correctAnswer': '8',
    },
    {
      'question': 'Apa yang dimaksud dengan sistem informasi?',
      'options': [
        'Kumpulan perangkat keras tanpa perangkat lunak',
        'Sekumpulan data yang tidak saling terkait ',
        'Kombinasi antara teknologi, manusia, dan proses untuk mengelola informasi',
        'Hanya perangkat lunak yang digunakan untuk mengolah data',
      ],
      'correctAnswer':
          'Kombinasi antara teknologi, manusia, dan proses untuk mengelola informasi',
    },
    {
      'question': 'Database Management System (DBMS) berfungsi untuk?',
      'options': [
        'Mengelola dan mengorganisir data dalam database',
        'Menganalisis data tanpa menyimpannya',
        'Menyimpan data tanpa kemampuan untuk mengubahnya',
        'Hanya digunakan untuk menyimpan dokumen teks',
      ],
      'correctAnswer': 'Mengelola dan mengorganisir data dalam database',
    },
    {
      'question':
          'Manakah yang merupakan contoh perangkat lunak pengolah database?',
      'options': [
        'Microsoft Excel',
        'MySQL',
        'Adobe Photoshop',
        'Microsoft Word',
      ],
      'correctAnswer': 'MySQL',
    },
    {
      'question': 'Apa kepanjangan dari HTTP dalam konteks jaringan komputer?',
      'options': [
        'Hyper Text Transfer Protocol',
        'High Transmission Text Protocol ',
        'Hyperlink Transfer Text Page',
        'High Technology Transfer Process',
      ],
      'correctAnswer': 'Hyper Text Transfer Protocol',
    },
    {
      'question': 'Dalam pemrograman, algoritma adalah... ',
      'option': [
        'Bahasa pemrograman yang digunakan dalam coding',
        'Proses penyimpanan data di dalam database',
        'Urutan langkah-langkah logis untuk menyelesaikan masalah',
        'Hardware yang digunakan untuk mengolah data',
      ],
      'correctAnswer':
          'Urutan langkah-langkah logis untuk menyelesaikan masalah',
    },
    {
      'question': 'Apa yang dimaksud dengan big data?',
      'options': [
        'Data yang hanya dapat diakses oleh perusahaan besar ',
        'Kumpulan data yang sangat besar dan kompleks sehingga sulit dikelola dengan cara tradisional ',
        'Jenis data yang hanya bisa disimpan di hard drive berkapasitas besar',
        'Hanya sekumpulan angka yang tidak memiliki makna',
      ],
      'correctAnswer':
          'Kumpulan data yang sangat besar dan kompleks sehingga sulit dikelola dengan cara tradisional',
    },
    {
      'question':
          'Manakah yang merupakan contoh dari Software as a Service (SaaS)?',
      'options': ['Microsoft Word', 'Google Docs', 'Windows 11', 'Android'],
      'correctAnswer': 'Google Docs',
    },
  ];

  void checkAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex]['correctAnswer']) {
      setState(() {
        score++;
      });
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showResult();
    }
  }

  void showResult() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Hasil Quiz', style: TextStyle(fontSize: 24)),
            content: Text(
              'Skor Anda: $score dari ${questions.length}',
              style: const TextStyle(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    currentQuestionIndex = 0;
                    score = 0;
                  });
                  Navigator.pop(context);
                },
                child: const Text('Main Lagi', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Informatika'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pertanyaan ${currentQuestionIndex + 1}/${questions.length}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              questions[currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ...questions[currentQuestionIndex]['options'].map((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(option),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: Text(
                    option,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }).toList(),
            const Spacer(),
            Text(
              'Skor saat ini: $score',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
