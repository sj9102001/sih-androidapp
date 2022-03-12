import 'package:flutter/material.dart';

import '../../widgets/image_input.dart';

import '../../providers/questions.dart';

import 'package:provider/provider.dart';

class QuestionFormPage extends StatefulWidget {
  static const routeName = '/question-form-page';

  const QuestionFormPage({Key? key}) : super(key: key);

  @override
  State<QuestionFormPage> createState() => _QuestionFormPageState();
}

class _QuestionFormPageState extends State<QuestionFormPage> {
//Controllers
  // ignore: prefer_final_fields
  var _questionStatementController = TextEditingController();
  // ignore: prefer_final_fields
  var _optionAController = TextEditingController();
  // ignore: prefer_final_fields
  var _optionBController = TextEditingController();
  // ignore: prefer_final_fields
  var _optionCController = TextEditingController();
  // ignore: prefer_final_fields
  var _optionDController = TextEditingController();

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
        return;
      }

      Provider.of<Questions>(context, listen: false).postQuestions(
          _questionStatementValue.toString(),
          1,
          _optionA.toString(),
          _optionB.toString(),
          _optionC.toString(),
          _optionD.toString());
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
                    // ignore: body_might_complete_normally_nullable
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
                    // ignore: body_might_complete_normally_nullable
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
                    // ignore: body_might_complete_normally_nullable
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
                    // ignore: body_might_complete_normally_nullable
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
                    // ignore: body_might_complete_normally_nullable
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
                  ElevatedButton(
                    onPressed: onSubmitForm,
                    child: const Text('Submit'),
                    autofocus: true,
                  ),
                ],
              ),
            ),
          ),
          const ImageInput(),
        ]),
      ),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      child: Text(item, style: const TextStyle(fontSize: 20)),
      value: item,
    );
