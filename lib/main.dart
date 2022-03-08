import 'package:flutter/material.dart';

import './providers/questions.dart';

//Screen Imports
import './screens/home_page.dart';
import './screens/ask_question_page.dart';

//Dependencies Imports
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<Questions>(
          create: (ctx) => Questions(), child: HomePage()),
      routes: {
        HomePage.routeName: (ctx) => const HomePage(),
        QuestionForm.routeName: (ctx) => QuestionForm(),
      },
    );
  }
}
