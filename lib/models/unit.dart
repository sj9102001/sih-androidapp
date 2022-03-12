import 'package:sihapp/models/question.dart';

class Unit {
  String unitId;
  int? unitNo;
  List<Question>? questions;

  Unit({required this.unitId, this.questions, this.unitNo});
}
