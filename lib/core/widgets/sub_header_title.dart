import 'package:flutter/material.dart';

import '../app_constants/color_constant.dart';

class SubHeaderTitle extends StatelessWidget {
  final String title;

  const SubHeaderTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: ColorConstant.mainDarkColor,
          fontSize: 18,
          fontWeight: FontWeight.normal),
    );
  }
}
