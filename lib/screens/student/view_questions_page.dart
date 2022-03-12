import 'package:flutter/material.dart';
import 'package:sihapp/models/subject.dart' as sub;

import '../../providers/questions.dart';
import '../../providers/standard_info.dart';

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
  List<sub.Subject> _subjects = [
    sub.Subject(name: "All Subject"),
  ];

  var _gradesValue = "All Class";
  var _subjectsValue = "All Subject";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questions List'),
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
                        items: _grades.map(buildMenuItemGrade).toList(),
                        value: _gradesValue,
                        onChanged: (value) async {
                          List<sub.Subject> tempList = [];
                          _subjectsValue = "All Subject";
                          if (value != "All Class") {
                            tempList = await Provider.of<StandardInfoProvider>(
                                    context,
                                    listen: false)
                                .getSubjectList(int.parse(value.toString()));
                          }
                          setState(() {
                            _subjects = [
                              sub.Subject(name: "All Subject"),
                            ];
                            _subjects.addAll(tempList);
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
                    onPressed: () async {
                      String subjectId = '';
                      for (int i = 0; i < _subjects.length; i++) {
                        if (_subjects[i].name == _subjectsValue) {
                          subjectId = _subjects[i].subjectId!;
                        }
                      }
                      final newList =
                          await Provider.of<Questions>(context, listen: false)
                              .getQuestions(subjectId);
                      setState(() {
                        _questionsList = newList;
                      });
                    },
                    icon: const Icon(Icons.search),
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
            child: _questionsList.isEmpty
                ? const Center(
                    child: Text('No Questions Available'),
                  )
                : ListView.builder(
                    itemBuilder: (_, questionIndex) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          // ignore: sized_box_for_whitespace
                          Container(
                            width: double.infinity,
                            child: Text(
                              (questionIndex + 1).toString() +
                                  ') ' +
                                  _questionsList[questionIndex]["question"],
                              style: GoogleFonts.roboto(fontSize: 20),
                            ),
                          ),
                          ..._questionsList[questionIndex]["options"]
                              // ignore: sized_box_for_whitespace
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

DropdownMenuItem<String> buildMenuItemGrade(String item) => DropdownMenuItem(
      child: Text(item, style: GoogleFonts.roboto(fontSize: 20)),
      value: item,
    );

DropdownMenuItem<String> buildMenuItem(sub.Subject item) {
  return DropdownMenuItem(
    child: Text(item.name, style: GoogleFonts.roboto(fontSize: 20)),
    value: item.name,
  );
}
