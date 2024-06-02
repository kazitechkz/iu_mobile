import 'dart:convert';

import 'package:iu/core/utils/typedef.dart';

class FinishCareerQuizParameter {
  final int quiz_id;
  final Map<int, int> given_answers;

  const FinishCareerQuizParameter({
    required this.quiz_id,
    required this.given_answers,
  });

  DataMap toMap() {
    return {
      "quiz_id": quiz_id.toString(),
      "given_answers": toJsonString(given_answers)
    };
  }

  String toJsonString(Map<int, int> myMap) {
    Map<String, int> stringKeyMap =
        myMap.map((key, value) => MapEntry(key.toString(), value));
    String jsonString = jsonEncode(stringKeyMap);
    return jsonString;
  }
}
