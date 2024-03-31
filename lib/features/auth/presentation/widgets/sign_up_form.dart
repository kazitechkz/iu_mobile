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
      this.errors = null});
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
            suffixIcon: const Icon(FontAwesomeIcons.user),
            obscureText: false,
            countText: false,
            labelText: AppLocalizations.of(context)!.name,
            enabled: true,
            serverErrorText: errors?.errors["name"] != null
                ? errors?.errors["name"]?.join()
                : null,
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
            suffixIcon: Icon(FontAwesomeIcons.envelope),
            obscureText: false,
            countText: false,
            labelText: AppLocalizations.of(context)!.email,
            enabled: true,
            serverErrorText: errors?.errors["email"] != null
                ? errors?.errors["email"]?.join()
                : null,
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
          AppPhoneFormField(
            controller: phoneController,
            type: TextInputType.phone,
            suffixIcon: const Icon(FontAwesomeIcons.phone),
            obscureText: false,
            countText: false,
            labelText: AppLocalizations.of(context)!.phone,
            enabled: true,
            serverErrorText: errors?.errors["phone"] != null
                ? errors?.errors["phone"]?.join()
                : null,
            validator: (value) {
              final regexp = RegExp(ValidatorConstant.kzPhonePatterns);
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.incorrect_value;
              }
              // else if (value.isNotEmpty && !regexp.hasMatch(value)) {
              //   return AppLocalizations.of(context)!.incorrect_phone;
              // }
              return null;
            },
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            controller: passwordController,
            type: TextInputType.text,
            suffixIcon: const Icon(FontAwesomeIcons.lock),
            obscureText: true,
            countText: false,
            labelText: AppLocalizations.of(context)!.password,
            enabled: true,
            serverErrorText: errors?.errors["password"] != null
                ? errors?.errors["password"]?.join()
                : null,
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
