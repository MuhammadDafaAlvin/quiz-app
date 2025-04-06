// Kelas abstrak untuk mendefinisikan kontrak quiz
abstract class Quiz {
  List<Map<String, dynamic>> getQuestions();
  String getQuestionText(int index);
  bool getCorrectAnswer(int index);
}

// Implementasi konkret dari Quiz
class QuizData implements Quiz {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'CPU adalah singkatan dari Central Processing Unit.',
      'correctAnswer': true, // Pastikan ini boolean, bukan string
    },
    {
      'question': 'Bahasa pemrograman pertama yang diciptakan adalah Python.',
      'correctAnswer': false, // Pastikan ini boolean, bukan string
    },
    {'question': '1 byte terdiri dari 8 bit.', 'correctAnswer': true},
    {
      'question':
          'Sistem informasi hanya terdiri dari perangkat keras tanpa perangkat lunak.',
      'correctAnswer': false,
    },
    {
      'question':
          'Database Management System (DBMS) berfungsi untuk mengelola dan mengorganisir data dalam database.',
      'correctAnswer': true,
    },
    {
      'question': 'Microsoft Excel adalah perangkat lunak pengolah database.',
      'correctAnswer': false,
    },
    {
      'question': 'HTTP adalah singkatan dari Hyper Text Transfer Protocol.',
      'correctAnswer': true,
    },
    {
      'question':
          'Algoritma adalah urutan langkah-langkah logis untuk menyelesaikan masalah.',
      'correctAnswer': true,
    },
    {
      'question':
          'Big data adalah kumpulan data kecil yang mudah dikelola dengan cara tradisional.',
      'correctAnswer': false,
    },
    {
      'question':
          'Google Docs adalah contoh dari Software as a Service (SaaS).',
      'correctAnswer': true,
    },
  ];

  @override
  List<Map<String, dynamic>> getQuestions() => _questions;

  @override
  String getQuestionText(int index) {
    if (index >= 0 && index < _questions.length) {
      return _questions[index]['question'] ?? 'Pertanyaan tidak tersedia';
    }
    return 'Indeks tidak valid';
  }

  @override
  bool getCorrectAnswer(int index) {
    if (index >= 0 && index < _questions.length) {
      final answer = _questions[index]['correctAnswer'];
      // Memastikan nilai yang dikembalikan adalah bool
      if (answer is bool) {
        return answer;
      } else {
        // Jika ternyata bukan bool (misalnya string), konversi ke bool
        if (answer is String) {
          return answer.toLowerCase() == 'true';
        }
        return false; // Default jika tipe tidak dikenali
      }
    }
    return false;
  }
}
