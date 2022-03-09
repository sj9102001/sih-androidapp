import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Questions with ChangeNotifier {
  // ignore: prefer_final_fields
  List _questions = [
    {
      "questionStatement":
          "In polar molecular solids, the molecules are held together by ________",
      "options": [
        "dipole-dipole interactions",
        "dispersion forces",
        "hydrogen bonds",
        "covalent bonds",
      ],
    },
    {
      "questionStatement": "Diamond is an example of _______",
      "options": [
        "solid with hydrogen bonding",
        "electrovalent solid",
        "covalent solid",
        "glass",
      ],
    },
    {
      "questionStatement":
          "Silicon is found in nature in the forms of ________",
      "options": [
        "body-centered cubic structure",
        "hexagonal-closed packed structure",
        "network solid",
        "face-centered cubic structure",
      ],
    },
    {
      "questionStatement":
          "The first living form named protocell originated in the primitive oceans.",
      "options": [
        "True",
        "False",
      ],
    },
    {
      "questionStatement": "During which period, origin of life took place?",
      "options": [
        "Devonian",
        "Cenozoic",
        "Precambrian",
        "Mesozoic",
      ],
    },
  ];

  List get questions {
    return [..._questions];
  }

  void apiCallTestQuestions(String questionString, int answer, String optionA,
      String optionB, String optionC, String optionD) async {
    List<String> optionsList = [];
    optionsList.add(optionA);
    optionsList.add(optionB);
    optionsList.add(optionC);
    optionsList.add(optionD);
    try {
      final url = Uri.parse('http://10.0.2.2:5000/api/question');
      // ignore: unused_local_variable
      final response = await http.post(
        url,
        headers: {
          "Content-type": "application/json",
        },
        body: json.encode({
          "unitId": "622721840c19973e5c146814",
          "questionStatement": questionString.toString(),
          "options": optionsList,
          "answer": 0,
        }),
      );
      // ignore: empty_catches
    } catch (error) {}
  }
}
