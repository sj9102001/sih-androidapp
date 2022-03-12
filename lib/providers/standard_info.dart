import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/subject.dart';

import 'package:http/http.dart' as http;

class StandardInfoProvider with ChangeNotifier {
  Future<void> testApiCall() async {
    try {
      // ignore: unused_local_variable
      final response =
          await http.get(Uri.parse('http://10.0.2.2:5000/api/info/standard'));
      // ignore: empty_catches
    } catch (error) {}
  }

  Future<List<Subject>> getSubjectList(int num) async {
    try {
      final url = Uri.parse("http://10.0.2.2:5000/api/info/standard/$num");
      final response = await http.get(url);
      final subjectList = json.decode(response.body)["subjects"] as List;
      List<Subject> result = [];
      for (Map<String, dynamic> item in subjectList) {
        result.add(
          Subject(
            name: item["name"],
            subjectId: item["_id"],
          ),
        );
      }
      return result;
    } catch (error) {
      // ignore: use_rethrow_when_possible
      throw error;
    }
  }

  Future<void> testApiCallWithNumber(int num) async {
    try {
      // ignore: unused_local_variable
      final response = await http
          .get(Uri.parse('http://10.0.2.2:5000/api/info/standard/10'));
      // ignore: empty_catches
    } catch (error) {}
  }
}
