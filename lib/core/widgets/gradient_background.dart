import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key, required this.child, required this.image});
  final Widget child;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      width: 375.w,
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(image) ,
            fit: BoxFit.cover
        ),
      ),
      child: child,
    );
  }
}
