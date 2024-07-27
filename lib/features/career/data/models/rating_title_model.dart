import 'dart:ui';

import 'package:flutter/material.dart';

class RatingTitle {
  final String titleRu;
  final String titleKk;
  final Color color;

  RatingTitle(
      {required this.titleRu, required this.titleKk, required this.color});
}

class RatingTitles {
  static final Map<int, RatingTitle> ratingTitle = {
    8: RatingTitle(
        titleRu: 'Совершенно согласен',
        titleKk: 'Мүлдем келісемін',
        color: Colors.green[700]!),
    7: RatingTitle(
        titleRu: 'Согласен', titleKk: 'Келісемін', color: Colors.green[600]!),
    6: RatingTitle(
        titleRu: 'Скорее согласен',
        titleKk: 'Керісінше келісемін',
        color: Colors.green[500]!),
    5: RatingTitle(
        titleRu: 'Склонен соглашаться',
        titleKk: 'Келісуге бейім',
        color: Colors.green[400]!),
    4: RatingTitle(
        titleRu: 'Нейтрально', titleKk: 'Бейтарап', color: Colors.yellow[300]!),
    3: RatingTitle(
        titleRu: 'Склонен не соглашаться',
        titleKk: 'Келіспеуге бейім',
        color: Colors.pink[400]!),
    2: RatingTitle(
        titleRu: 'Скорее не согласен',
        titleKk: 'Керісінше келіспеймін',
        color: Colors.pink[500]!),
    1: RatingTitle(
        titleRu: 'Не согласен',
        titleKk: 'Келіспеймін',
        color: Colors.pink[600]!),
  };

  static final Map<int, RatingTitle> ratingTitle7 = {
    7: RatingTitle(
        titleRu: 'Совершенно согласен',
        titleKk: 'Мүлдем келісемін',
        color: Colors.green[700]!),
    6: RatingTitle(
        titleRu: 'Согласен', titleKk: 'Келісемін', color: Colors.green[600]!),
    5: RatingTitle(
        titleRu: 'Скорее согласен',
        titleKk: 'Керісінше келісемін',
        color: Colors.green[500]!),
    4: RatingTitle(
        titleRu: 'Нейтрально', titleKk: 'Бейтарап', color: Colors.yellow[300]!),
    3: RatingTitle(
        titleRu: 'Скорее не согласен',
        titleKk: 'Керісінше келіспеймін',
        color: Colors.pink[500]!),
    2: RatingTitle(
        titleRu: 'Не согласен',
        titleKk: 'Келіспеймін',
        color: Colors.pink[600]!),
    1: RatingTitle(
        titleRu: 'Совершенно не согласен',
        titleKk: 'Мүлдем келіспеймін',
        color: Colors.pink[700]!),
  };

  static final Map<int, RatingTitle> ratingTitle6 = {
    6: RatingTitle(
        titleRu: 'Совершенно согласен',
        titleKk: 'Мүлдем келісемін',
        color: Colors.green[700]!),
    5: RatingTitle(
        titleRu: 'Согласен', titleKk: 'Келісемін', color: Colors.green[600]!),
    4: RatingTitle(
        titleRu: 'Нейтрально', titleKk: 'Бейтарап', color: Colors.yellow[300]!),
    3: RatingTitle(
        titleRu: 'Скорее не согласен',
        titleKk: 'Керісінше келіспеймін',
        color: Colors.pink[500]!),
    2: RatingTitle(
        titleRu: 'Не согласен',
        titleKk: 'Келіспеймін',
        color: Colors.pink[600]!),
    1: RatingTitle(
        titleRu: 'Совершенно не согласен',
        titleKk: 'Мүлдем келіспеймін',
        color: Colors.pink[700]!),
  };

  static final Map<int, RatingTitle> ratingTitle5 = {
    5: RatingTitle(
        titleRu: 'Совершенно согласен',
        titleKk: 'Мүлдем келісемін',
        color: Colors.green[700]!),
    4: RatingTitle(
        titleRu: 'Согласен', titleKk: 'Келісемін', color: Colors.green[600]!),
    3: RatingTitle(
        titleRu: 'Нейтрально', titleKk: 'Бейтарап', color: Colors.yellow[300]!),
    2: RatingTitle(
        titleRu: 'Не согласен',
        titleKk: 'Келіспеймін',
        color: Colors.pink[600]!),
    1: RatingTitle(
        titleRu: 'Совершенно не согласен',
        titleKk: 'Мүлдем келіспеймін',
        color: Colors.pink[700]!),
  };

  static final Map<int, RatingTitle> ratingTitle4 = {
    4: RatingTitle(
        titleRu: 'Совершенно согласен',
        titleKk: 'Мүлдем келісемін',
        color: Colors.green[700]!),
    3: RatingTitle(
        titleRu: 'Нейтрально', titleKk: 'Бейтарап', color: Colors.yellow[300]!),
    2: RatingTitle(
        titleRu: 'Не согласен',
        titleKk: 'Келіспеймін',
        color: Colors.pink[600]!),
    1: RatingTitle(
        titleRu: 'Совершенно не согласен',
        titleKk: 'Мүлдем келіспеймін',
        color: Colors.pink[700]!),
  };

  static final Map<int, RatingTitle> ratingTitle3 = {
    3: RatingTitle(
        titleRu: 'Совершенно согласен',
        titleKk: 'Мүлдем келісемін',
        color: Colors.green[700]!),
    2: RatingTitle(
        titleRu: 'Нейтрально', titleKk: 'Бейтарап', color: Colors.yellow[300]!),
    1: RatingTitle(
        titleRu: 'Совершенно не согласен',
        titleKk: 'Мүлдем келіспеймін',
        color: Colors.pink[700]!),
  };

  static final Map<int, RatingTitle> ratingTitle2 = {
    2: RatingTitle(
        titleRu: 'Согласен', titleKk: 'Келісемін', color: Colors.green[600]!),
    1: RatingTitle(
        titleRu: 'Не согласен',
        titleKk: 'Келіспеймін',
        color: Colors.pink[600]!),
  };

  static Map<int, RatingTitle> getRatingTitle(int answer_length) {
    if (answer_length == 8) {
      return ratingTitle;
    } else if (answer_length == 7) {
      return ratingTitle7;
    } else if (answer_length == 6) {
      return ratingTitle6;
    } else if (answer_length == 5) {
      return ratingTitle5;
    } else if (answer_length == 4) {
      return ratingTitle4;
    } else if (answer_length == 3) {
      return ratingTitle3;
    } else if (answer_length == 2) {
      return ratingTitle2;
    } else {
      return ratingTitle;
    }
  }
}
