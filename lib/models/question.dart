class Question {
  final String questionStatement;
  final int? answerIndex;
  final List<String> options;

  Question({
    required this.questionStatement,
    this.answerIndex,
    required this.options,
  });
}
