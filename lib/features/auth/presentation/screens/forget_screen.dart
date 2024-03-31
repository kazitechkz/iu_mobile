import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/image_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/utils/toasters.dart';
import 'package:iu/core/widgets/header_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iu/features/auth/domain/parameters/forget_parameter.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iu/features/auth/presentation/widgets/forget_form.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/widgets/elevated_gradient_button.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final emailController = TextEditingController();
  final codeController = TextEditingController();
  final passwordController = TextEditingController();
  final samePasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Errors? errors = null;

  @override
  void dispose() {
    this.emailController.dispose();
    this.codeController.dispose();
    this.passwordController.dispose();
    this.samePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          AppToaster.showError(state.failureData.message ?? "");
        }
        if (state is AuthSendedResetTokenState) {
          if (state.status) {
            AppToaster.showSuccess(
                "Код для сброса успешно отправлен на вашу почту!");
          } else {
            AppToaster.showWarning(
                'Что-то пошло не так при отпрваке ключа сброса, попробуйте позже');
          }
        }
        if (state is AuthForgetState) {
          if (state.status) {
            AppToaster.showSuccess("Пароль успешно изменен!");
            context.go("/${RouteConstant.signInScreenName}");
          } else {
            AppToaster.showWarning('Что-то пошло не так, попробуйте позже');
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 320.w,
                    height: 280.h,
                    child: Image.asset(
                      ImageConstant.AuthBear,
                      fit: BoxFit.contain,
                    ),
                  ),
                  HeaderTitle(
                      title: AppLocalizations.of(context)!.forgot_password),
                  SizedBox(
                    height: 30.h,
                  ),
                  ForgetForm(
                    keyForm: formKey,
                    emailController: emailController,
                    codeController: codeController,
                    passwordController: passwordController,
                    samePasswordController: samePasswordController,
                    errors: state is AuthErrorState
                        ? state.failureData.errors
                        : null,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ((state is AuthState && state is! AuthLoadingState)
                      ? ElevatedGradientButton(
                          gradient: const LinearGradient(
                            colors: ColorConstant.violetToPinkGradient,
                          ),
                          width: 220.w,
                          height: 50.h,
                          borderRadius: 40.sp,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(ForgetEvent(
                                  ForgetParameter(
                                      email: emailController.text.trim(),
                                      code: codeController.text.trim(),
                                      password:
                                          passwordController.text.trim())));
                            } else {
                              AppToaster.showInfo("Заполните все поля!");
                            }
                          },
                          child: Text(
                            "Сбросить пароль",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ))
                      : Center(
                          child: CircularProgressIndicator(),
                        )),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go("/${RouteConstant.signUpScreenName}");
                    },
                    child: RichText(
                        text: TextSpan(
                            text:
                                '${AppLocalizations.of(context)!.no_account} ',
                            style: TextStyle(
                                color: ColorConstant.mainDarkColor,
                                fontSize: 12.sp),
                            children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!.sign_up,
                            style: TextStyle(
                                color: ColorConstant.linkColor,
                                fontSize: 12.sp),
                          )
                        ])),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
