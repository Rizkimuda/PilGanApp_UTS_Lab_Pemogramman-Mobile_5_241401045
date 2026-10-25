import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../models/question_model.dart';

class QuizProvider extends ChangeNotifier {
  String _userName = '';
  String _selectedCategory = 'Semua Topik';
  List<QuestionModel> _activeQuestions = [];
  int _currentQuestionIndex = 0;
  final Map<int, int> _userAnswers = {}; // questionId -> optionIndex
  bool _isSubmitted = false;

  // Getters
  String get userName => _userName;
  String get selectedCategory => _selectedCategory;
  List<QuestionModel> get activeQuestions => _activeQuestions;
  int get currentQuestionIndex => _currentQuestionIndex;
  Map<int, int> get userAnswers => _userAnswers;
  bool get isSubmitted => _isSubmitted;

  int get totalQuestions => _activeQuestions.length;
  int get answeredCount => _userAnswers.length;

  QuestionModel? get currentQuestion {
    if (_activeQuestions.isEmpty ||
        _currentQuestionIndex >= _activeQuestions.length) {
      return null;
    }
    return _activeQuestions[_currentQuestionIndex];
  }

  int? get selectedOptionForCurrentQuestion {
    final q = currentQuestion;
    if (q == null) return null;
    return _userAnswers[q.id];
  }

  bool get hasNextQuestion =>
      _currentQuestionIndex < _activeQuestions.length - 1;
  bool get hasPreviousQuestion => _currentQuestionIndex > 0;

  // Skor
  int get correctAnswersCount {
    int correct = 0;
    for (final q in _activeQuestions) {
      final chosen = _userAnswers[q.id];
      if (chosen != null && q.isCorrect(chosen)) {
        correct++;
      }
    }
    return correct;
  }

  int get wrongAnswersCount {
    int wrong = 0;
    for (final q in _activeQuestions) {
      final chosen = _userAnswers[q.id];
      if (chosen != null && !q.isCorrect(chosen)) {
        wrong++;
      }
    }
    return wrong;
  }

  int get finalScore {
    if (totalQuestions == 0) return 0;
    return ((correctAnswersCount / totalQuestions) * 100).round();
  }

  // Actions
  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void startQuiz(String name, {String? category}) {
    _userName = name.trim();
    if (category != null) {
      _selectedCategory = category;
    }

    if (_selectedCategory == 'Semua Topik') {
      _activeQuestions = List.from(QuizData.questions);
    } else {
      _activeQuestions = QuizData.questions
          .where((q) => q.category == _selectedCategory)
          .toList();
    }

    if (_activeQuestions.isEmpty) {
      _activeQuestions = List.from(QuizData.questions);
    }

    _currentQuestionIndex = 0;
    _userAnswers.clear();
    _isSubmitted = false;
    notifyListeners();
  }

  void selectOption(int questionId, int optionIndex) {
    if (_isSubmitted) return;
    _userAnswers[questionId] = optionIndex;
    notifyListeners();
  }

  void nextQuestion() {
    if (hasNextQuestion) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (hasPreviousQuestion) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }

  void submitQuiz() {
    _isSubmitted = true;
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _userAnswers.clear();
    _isSubmitted = false;
    notifyListeners();
  }
}
