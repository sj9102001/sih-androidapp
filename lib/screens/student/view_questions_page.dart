import 'package:flutter/material.dart';

import '../../providers/questions.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewQuestionsPage extends StatefulWidget {
  static const routeName = '/view-question-page';

  // ignore: prefer_const_constructors_in_immutables
  ViewQuestionsPage({Key? key}) : super(key: key);

  @override
  State<ViewQuestionsPage> createState() => _ViewQuestionsPageState();
}

class _ViewQuestionsPageState extends State<ViewQuestionsPage> {
  List _questionsList = [];

  final _grades = ["All Class", "10", "12"];
  final _subjects = [
    "All Subject",
    "Physics",
    "Chemistry",
    "Mathematics",
    "English",
    "Computer Science",
  ];
  var _gradesValue = "All Class";
  var _subjectsValue = "All Subject";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View All Question'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, top: 10, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        items: _grades.map(buildMenuItem).toList(),
                        value: _gradesValue,
                        onChanged: (value) {
                          setState(() {
                            _gradesValue = value.toString();
                          });
                        }),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: _subjects.map(buildMenuItem).toList(),
                      value: _subjectsValue,
                      onChanged: (value) {
                        setState(
                          () {
                            _subjectsValue = value.toString();
                          },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _questionsList =
                            Provider.of<Questions>(context, listen: false)
                                .questions;
                      });

                      print(_questionsList);
                    },
                    icon: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            child: _questionsList.length == 0
                ? Center(
                    child: Text('No Questions Available'),
                  )
                : ListView.builder(
                    itemBuilder: (_, questionIndex) => Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              (questionIndex + 1).toString() +
                                  ') ' +
                                  _questionsList[questionIndex]
                                      ["questionStatement"],
                              style: GoogleFonts.roboto(fontSize: 20),
                            ),
                          ),
                          ..._questionsList[questionIndex]["options"]
                              .map((text) => Container(
                                    width: double.infinity,
                                    child: Text(
                                      text,
                                      style: GoogleFonts.roboto(fontSize: 20),
                                      textAlign: TextAlign.left,
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                    ),
                    itemCount: _questionsList.length,
                  ),
          )),
        ],
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      child: Text(item, style: GoogleFonts.roboto(fontSize: 20)),
      value: item,
    );
