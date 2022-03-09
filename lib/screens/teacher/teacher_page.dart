import 'package:flutter/material.dart';

import '../../widgets/custom_elevatedbutton.dart';

class TeacherPage extends StatelessWidget {
  static const routeName = '/teacher-page';

  const TeacherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: screenSize.width * 0.30,
              top: screenSize.height * 0.03,
            ),
            child: Column(
              children: const [
                CustomElevatedButton(
                  icon: Icons.question_mark,
                  labelText: 'Add Question',
                  onPressedHandler: null,
                ),
                CustomElevatedButton(
                  icon: Icons.question_answer,
                  labelText: 'Generate Question Paper',
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
