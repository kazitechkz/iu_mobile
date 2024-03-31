import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevatedCommonButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width;
  final double height;
  final double borderRadius;
  final double vertical;
  final double horizontal;
  final VoidCallback? onPressed;

  const ElevatedCommonButton({
    super.key,
    required this.child,
    required this.color,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.vertical,
    required this.horizontal,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.symmetric(
                vertical: vertical, horizontal: horizontal),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: child,
      ),
    );
  }
}
