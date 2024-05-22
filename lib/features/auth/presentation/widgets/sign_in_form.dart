import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/validator_constant.dart';
import 'package:iu/core/widgets/app_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/models/response_data.dart';

class SignInForm extends StatelessWidget {
  const SignInForm(
      {super.key,
      required this.keyForm,
      required this.emailController,
      required this.passwordController,
      this.errors});
  final GlobalKey<FormState> keyForm;
  final TextEditingController emailController;
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
            controller: emailController,
            type: TextInputType.emailAddress,
            suffixIcon: const Icon(Icons.email),
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
            controller: passwordController,
            type: TextInputType.text,
            suffixIcon: const Icon(Icons.password),
            obscureText: true,
            countText: false,
            style: const TextStyle(color: Colors.white),
            labelText: AppLocalizations.of(context)!.password,
            enabled: true,
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
