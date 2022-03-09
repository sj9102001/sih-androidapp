import 'package:flutter/material.dart';

import 'package:sihapp/providers/questions.dart';
import 'package:sihapp/screens/student/student_page.dart';
import 'package:sihapp/screens/teacher/teacher_page.dart';
import 'package:sihapp/screens/test_page.dart';
import 'package:sihapp/screens/student/view_questions_page.dart';

//Screen Imports
import './screens/home_page.dart';
import 'screens/student/ask_question_page.dart';

//Dependencies Imports
import 'package:provider/provider.dart';

//Provider Imports
import 'providers/standard_info.dart';
import './providers/questions.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StandardInfoProvider>(
          create: (ctx) => StandardInfoProvider(),
        ),
        Provider<Questions>(
          create: (ctx) => Questions(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          QuestionFormPage.routeName: (ctx) => const QuestionFormPage(),
          ViewQuestionsPage.routeName: (ctx) => ViewQuestionsPage(),
          TestPage.routeName: (ctx) => TestPage(),
          StudentPage.routeName: (ctx) => const StudentPage(),
          TeacherPage.routeName: (ctx) => const TeacherPage(),
        },
      ),
    );
  }
}
