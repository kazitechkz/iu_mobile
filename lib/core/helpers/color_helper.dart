import 'package:flutter/material.dart';
import 'package:iu/core/app_constants/color_constant.dart';

class ColorHelper {
  static Map<int, List<Color>> subjectColors = {
    1: [ColorConstant.mathGramOne, ColorConstant.mathGramTwo],
    2: [ColorConstant.kazHistoryOne, ColorConstant.kazHistoryTwo],
    3: [ColorConstant.gramReadingOne, ColorConstant.gramReadingTwo],
    4: [ColorConstant.mathOne, ColorConstant.mathTwo],
    5: [ColorConstant.physicsOne, ColorConstant.physicsTwo],
    6: [ColorConstant.chemistryOne, ColorConstant.chemistryTwo],
    7: [ColorConstant.biologyOne, ColorConstant.biologyTwo],
    8: [ColorConstant.geographyOne, ColorConstant.geographyTwo],
    9: [ColorConstant.historyOne, ColorConstant.historyTwo],
    10: [ColorConstant.pravoOne, ColorConstant.pravoTwo],
    11: [ColorConstant.englishOne, ColorConstant.englishTwo],
    12: [ColorConstant.kazakhOne, ColorConstant.kazakhTwo],
    13: [ColorConstant.kazakhLitOne, ColorConstant.kazakhLitTwo],
    14: [ColorConstant.russianOne, ColorConstant.russianTwo],
    15: [ColorConstant.russianLitOne, ColorConstant.russianLitTwo],
    16: [ColorConstant.informaticsOne, ColorConstant.informaticsTwo],
  };

  static List<Color> getSubjectColors(int subjectId) {
    return subjectColors[subjectId] ??
        [ColorConstant.orangeColor, ColorConstant.appBarColor];
  }

  static Color getMainSubjectColor(int subjectId) {
    return subjectColors[subjectId]?[0] ?? ColorConstant.appBarColor;
  }

  static Color getSecondSubjectColor(int subjectId) {
    return subjectColors[subjectId]?[1] ?? ColorConstant.appBarColor;
  }
}
