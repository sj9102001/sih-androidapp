import 'package:flutter/material.dart';

import '../../widgets/custom_elevatedbutton.dart';
import '../student/view_questions_page.dart';

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
              left: screenSize.width * 0.25,
              top: screenSize.height * 0.03,
            ),
            child: Column(
              children: [
                const CustomElevatedButton(
                  icon: Icons.add,
                  labelText: 'Add Question',
                  onPressedHandler: null,
                ),
                CustomElevatedButton(
                  icon: Icons.download,
                  labelText: 'Generate Question Paper',
                  onPressedHandler: () {
                    Navigator.of(context)
                        .pushNamed(ViewQuestionsPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
