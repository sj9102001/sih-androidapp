import 'package:flutter/material.dart';

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

  Future<void> testApiCallWithNumber(int num) async {
    try {
      // ignore: empty_catches
    } catch (error) {}
  }
}
