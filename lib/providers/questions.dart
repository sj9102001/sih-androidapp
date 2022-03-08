import 'package:flutter/material.dart';
import 'dart:convert';

//Models import
import '../models/question.dart';

//Dependency import
import 'package:provider/provider.dart';

class Questions with ChangeNotifier {
  List<Question> questions = [];

  List<Question> get question {
    return [...questions];
  }

  void addQuestion(
      String? _gradeValue,
      String? _subjectValue,
      String? _questionStatementValue,
      String? _optionA,
      String? _optionB,
      String? _optionC,
      String? _optionD) {
    Map<int, String> m = {};
    m.putIfAbsent(0, () => _optionA.toString());
    m.putIfAbsent(1, () => _optionB.toString());
    m.putIfAbsent(2, () => _optionC.toString());
    m.putIfAbsent(3, () => _optionD.toString());

    print(m);

    questions.add(
      Question(
          grade: int.parse(_gradeValue!),
          subject: _subjectValue.toString(),
          questionStatement: _questionStatementValue.toString(),
          options: m),
    );
  }
}
