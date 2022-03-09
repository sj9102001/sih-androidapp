import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/custom_panel_button.dart';

import '/screens/test_page.dart';
import 'student/student_page.dart';
import 'teacher/teacher_page.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    void studentOnTapHandler() {
      Navigator.of(context).pushNamed(
        StudentPage.routeName,
      );
    }

    void teacherOnTapHandler() {
      Navigator.of(context).pushNamed(
        TeacherPage.routeName,
      );
    }

    void testApiHandler() {
      Navigator.of(context).pushNamed(
        TestPage.routeName,
      );
    }

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomPanelButton(
                  text: 'Student',
                  onTapHandler: studentOnTapHandler,
                ),
                CustomPanelButton(
                  text: 'Teacher',
                  onTapHandler: teacherOnTapHandler,
                ),
                CustomPanelButton(
                  text: 'Test API',
                  onTapHandler: testApiHandler,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
