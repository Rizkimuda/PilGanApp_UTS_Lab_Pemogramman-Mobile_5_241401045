class QuestionModel {
  final int id;
  final String category;
  final String question;
  final List<String> options;
  final int correctIndex;

  const QuestionModel({
    required this.id,
    required this.category,
    required this.question,
    required this.options,
    required this.correctIndex,
  });

  bool isCorrect(int selectedIndex) {
    return selectedIndex == correctIndex;
  }
}
