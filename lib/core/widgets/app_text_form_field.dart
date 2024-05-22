import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/color_constant.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.obscureText,
    this.maxLength,
    required this.labelText,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.labelStyle,
    this.hintStyle,
    required this.enabled,
    required this.countText,
    this.serverErrorText,
  });

  final TextEditingController controller;
  final TextInputType type;
  final bool obscureText;
  final int? maxLength;
  final String labelText;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? serverErrorText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final bool enabled;
  final bool countText;

  TextStyle defaultLabelStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  TextStyle defaultTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
  TextStyle defaultErrorTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.normal,
    color: Colors.redAccent,
  );
  TextStyle defaultHintStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
    color: Colors.white38,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: serverErrorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: countText ? "" : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorConstant.borderGrayColor, width: 1),
          borderRadius: BorderRadius.circular(50.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorConstant.violetFirst, width: 1),
          borderRadius: BorderRadius.circular(50.sp),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent, width: 1),
          borderRadius: BorderRadius.circular(50.sp),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        hintStyle: hintStyle ?? defaultHintStyle,
        labelStyle: style ?? defaultLabelStyle,
        errorStyle: defaultErrorTextStyle,
        focusColor: ColorConstant.violetFirst,
      ),
      keyboardType: type,
      style: style ?? defaultTextStyle,
      validator: validator,
      onSaved: (value) {
        // Handle saving the username
      },
    );
  }
}
