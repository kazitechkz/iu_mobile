import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/validator_constant.dart';
import 'package:iu/core/widgets/app_phone_form_field.dart';
import 'package:iu/core/widgets/app_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/models/response_data.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm(
      {super.key,
      required this.keyForm,
      required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.passwordController,
      this.errors});
  final GlobalKey<FormState> keyForm;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final Errors? errors;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: keyForm,
      child: Column(
        children: [
          AppTextFormField(
            controller: nameController,
            type: TextInputType.text,
            suffixIcon: const Icon(FontAwesomeIcons.user, color: Colors.white,),
            obscureText: false,
            countText: false,
            labelText: AppLocalizations.of(context)!.name,
            enabled: true,
            style: const TextStyle(color: Colors.white),
            serverErrorText: errors?.errors["name"]?.join(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.incorrect_value;
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            controller: emailController,
            type: TextInputType.emailAddress,
            suffixIcon: const Icon(FontAwesomeIcons.envelope, color: Colors.white,),
            obscureText: false,
            countText: false,
            labelText: AppLocalizations.of(context)!.email,
            enabled: true,
            style: const TextStyle(color: Colors.white),
            serverErrorText: errors?.errors["email"]?.join(),
            validator: (value) {
              RegExp emailExp = RegExp(ValidatorConstant.emailPatterns);
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.incorrect_value;
              } else if (value.isNotEmpty && !emailExp.hasMatch(value)) {
                return AppLocalizations.of(context)!.incorrect_email;
              }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            controller: phoneController,
            type: TextInputType.text,
            suffixIcon: const Icon(FontAwesomeIcons.phone, color: Colors.white,),
            obscureText: false,
            countText: false,
            labelText: AppLocalizations.of(context)!.phone,
            enabled: true,
            style: const TextStyle(color: Colors.white),
            serverErrorText: errors?.errors["phone"]?.join(),
            validator: (value) {
              return null;
            },
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            controller: passwordController,
            type: TextInputType.text,
            suffixIcon: const Icon(FontAwesomeIcons.lock, color: Colors.white,),
            obscureText: true,
            countText: false,
            labelText: AppLocalizations.of(context)!.password,
            enabled: true,
            style: const TextStyle(color: Colors.white),
            serverErrorText: errors?.errors["password"]?.join(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.incorrect_password;
              }
              return null;
            },
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
