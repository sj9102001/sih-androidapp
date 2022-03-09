import 'package:flutter/material.dart';

import '../../widgets/custom_elevatedbutton.dart';

import '../../screens/student/ask_question_page.dart';
import 'view_questions_page.dart';

class StudentPage extends StatelessWidget {
  static const routeName = '/student-page';

  const StudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void askAQuestionHandler() {
      Navigator.of(context).pushNamed(
        QuestionFormPage.routeName,
      );
    }

    void viewAQuestionHandler() {
      Navigator.of(context).pushNamed(
        ViewQuestionsPage.routeName,
      );
    }

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: screenSize.width * 0.30,
              top: screenSize.height * 0.03,
            ),
            child: Column(
              children: [
                CustomElevatedButton(
                  icon: Icons.question_mark,
                  labelText: 'Ask a question',
                  onPressedHandler: askAQuestionHandler,
                ),
                CustomElevatedButton(
                  icon: Icons.question_answer,
                  labelText: 'View all questions',
                  onPressedHandler: viewAQuestionHandler,
                ),
                const CustomElevatedButton(
                  icon: Icons.question_mark,
                  labelText: 'Take Quiz',
                  onPressedHandler: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
