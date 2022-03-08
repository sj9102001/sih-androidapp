class Question {
  final String questionStatement;
  final int? answerIndex;
  final Map<int, String> options;
  final int grade;
  final String subject;

  Question({
    required this.questionStatement,
    required this.grade,
    this.answerIndex,
    required this.options,
    required this.subject,
  });
}
