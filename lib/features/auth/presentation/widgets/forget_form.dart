import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/validator_constant.dart';
import 'package:iu/core/utils/toasters.dart';
import 'package:iu/core/widgets/app_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iu/features/auth/domain/usecases/send_reset_token_case.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../domain/parameters/reset_parameter.dart';
import '../bloc/auth_bloc.dart';

class ForgetForm extends StatelessWidget {
  const ForgetForm(
      {super.key,
      required this.keyForm,
      required this.emailController,
      required this.codeController,
      required this.passwordController,
      required this.samePasswordController,
      this.errors = null});

  final GlobalKey<FormState> keyForm;
  final TextEditingController emailController;
  final TextEditingController codeController;
  final TextEditingController passwordController;
  final TextEditingController samePasswordController;
  final Errors? errors;

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: keyForm,
      child: Column(
        children: [
          AppTextFormField(
            controller: emailController,
            type: TextInputType.emailAddress,
            suffixIcon: Icon(Icons.email),
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
          AppTextFormField(
            controller: codeController,
            type: TextInputType.text,
            suffixIcon: Icon(FontAwesomeIcons.key),
            obscureText: false,
            countText: false,
            labelText: "Код сброса",
            enabled: true,
            serverErrorText: errors?.errors["code"] != null
                ? errors?.errors["code"]?.join()
                : null,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.incorrect_value;
              }
              return null;
            },
          ),
          SizedBox(
            height: 5.h,
          ),
          ((authBloc.state is AuthLoadingState)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ((authBloc.state is AuthSendedResetTokenState)
                  ? Align(
                      alignment: Alignment(1, 0),
                      child: Text(
                        "Повторно отправить код можно через 1 минуту",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: ColorConstant.linkColor,
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        RegExp emailExp =
                            RegExp(ValidatorConstant.emailPatterns);
                        if (emailController.text.isNotEmpty &&
                            emailExp.hasMatch(emailController.text)) {
                          context.read<AuthBloc>().add(SendResetTokenEvent(
                              SendResetTokenParameter(
                                  email: emailController.text.trim())));
                        } else {
                          AppToaster.showWarning("Заполните поле почты!");
                        }
                      },
                      child: Align(
                        alignment: Alignment(1, 0),
                        child: Text(
                          "Отправить код для сброса",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: ColorConstant.linkColor,
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ))),
          SizedBox(height: 20.h),
          AppTextFormField(
            controller: passwordController,
            type: TextInputType.text,
            suffixIcon: Icon(Icons.password),
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
          SizedBox(height: 20.h),
          AppTextFormField(
            controller: samePasswordController,
            type: TextInputType.text,
            suffixIcon: Icon(Icons.password),
            obscureText: true,
            countText: false,
            labelText: "Повторите пароль",
            enabled: true,
            serverErrorText: errors?.errors["samePassword"] != null
                ? errors?.errors["samePassword"]?.join()
                : null,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.incorrect_password;
              }
              if (value != passwordController.text) {
                return "Пароли должны совпадать";
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
