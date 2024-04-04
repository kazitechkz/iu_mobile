import 'package:flutter/material.dart';
import 'package:getwidget/components/appbar/gf_appbar.dart';
import 'package:getwidget/components/button/gf_icon_button.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:go_router/go_router.dart';

GFAppBar mainAppBar(BuildContext context, {String titleText = '', Color textColor = Colors.black}) {
  return GFAppBar(
    centerTitle: true,
    automaticallyImplyLeading: GoRouter.of(context).canPop(),
    leading:  GoRouter.of(context).canPop() ? GFIconButton(
      icon: const Icon(
        Icons.keyboard_arrow_left_outlined,
        color: Colors.white,
      ),
      onPressed: () {
        GoRouter.of(context).pop();
      },
      type: GFButtonType.transparent,
    ) : null,
    title: Text(
      titleText,
      style: TextStyle(
        color: textColor
      ),
    ),
    backgroundColor: Colors.white,
  );
}