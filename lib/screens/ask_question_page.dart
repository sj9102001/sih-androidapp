import 'package:flutter/material.dart';

//Widgets import
import '../widgets/question_form.dart';
import '../widgets/image_input.dart';

class QuestionForm extends StatefulWidget {
  static const routeName = '/question-form';

  @override
  State<QuestionForm> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
//Static data
  var grades = ["10", "12"];

  final _subjects = [
    "Physics",
    "Chemistry",
    "Mathematics",
    "English",
    "Computer Science",
  ];

//Controllers
  var _questionStatementController = TextEditingController();
  var _optionAController = TextEditingController();
  var _optionBController = TextEditingController();
  var _optionCController = TextEditingController();
  var _optionDController = TextEditingController();

//Actual Form Data
  String? _gradeValue;
  String? _subjectValue;
  String? _questionStatementValue;
  String? _optionA;
  String? _optionB;
  String? _optionC;
  String? _optionD;

  @override
  Widget build(BuildContext context) {
    //Form key
    final _formKey = GlobalKey<FormState>();

    //Submitting form
    void onSubmitForm() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      } else {
        print('Validation triggered');
        return;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _questionStatementController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: 'Enter Your question',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next, autofocus: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your question!';
                      }
                    },
                    // autofocus: true,
                    onChanged: (value) {
                      _questionStatementValue = value.toString();
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _optionAController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Option A',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next, autofocus: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Option A must not be empty';
                      }
                    },
                    // autofocus: true,
                    onChanged: (value) {
                      _optionA = value.toString();
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _optionBController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Option B',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next, autofocus: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Option B must not be empty';
                      }
                    },
                    // autofocus: true,
                    onChanged: (value) {
                      _optionB = value.toString();
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _optionCController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Option C',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next, autofocus: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Option C must not be empty';
                      }
                    },
                    // autofocus: true,
                    onChanged: (value) {
                      _optionC = value.toString();
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _optionDController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Option D',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Option D must not be empty';
                      }
                    },
                    onChanged: (value) {
                      _optionD = value.toString();
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Class:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        margin: const EdgeInsets.only(left: 20),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              items: grades.map(buildMenuItem).toList(),
                              value: _gradeValue,
                              onChanged: (value) {
                                setState(() {
                                  _gradeValue = value.toString();
                                });
                              }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Subject:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        margin: const EdgeInsets.only(left: 20),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              items: _subjects.map(buildMenuItem).toList(),
                              value: _subjectValue,
                              onChanged: (value) {
                                setState(() {
                                  _subjectValue = value.toString();
                                });
                              }),
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: onSubmitForm,
                    child: Text('Submit'),
                    autofocus: true,
                  ),
                ],
              ),
            ),
          ),
          ImageInput(),
        ]),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      child: Text(item, style: TextStyle(fontSize: 20)),
      value: item,
    );
