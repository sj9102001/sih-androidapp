import 'package:flutter/material.dart';

//Widget imports
import '../widgets/custom_drawer.dart';
import '../widgets/custom_elevatedbutton.dart';

//Screen Imports
import './ask_question_page.dart';

//Dependencies Imports

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void askAQuestionHandler() {
      Navigator.of(context).pushNamed(
        QuestionForm.routeName,
      );
    }

    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
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
                const CustomElevatedButton(
                  icon: Icons.question_answer,
                  labelText: 'Answer a question',
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
