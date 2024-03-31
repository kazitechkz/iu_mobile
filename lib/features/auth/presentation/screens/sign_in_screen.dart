import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/image_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/utils/toasters.dart';
import 'package:iu/core/widgets/header_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iu/features/auth/domain/parameters/sign_in_parameter.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/widgets/elevated_gradient_button.dart';
import '../widgets/sign_in_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Errors? errors = null;

  @override
  void dispose() {
    this.emailController.dispose();
    this.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          AppToaster.showError(state.failureData.message ?? "");
        }
        if (state is AuthSignedInState) {
          AppToaster.showSuccess("Добро пожаловать!");
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
                  HeaderTitle(title: AppLocalizations.of(context)!.sign_in),
                  SizedBox(
                    height: 30.h,
                  ),
                  SignInForm(
                    keyForm: formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                    errors: state is AuthErrorState
                        ? state.failureData.errors
                        : null,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go("/${RouteConstant.forgetScreenName}");
                    },
                    child: Align(
                      alignment: Alignment(1, 0),
                      child: Text(
                        AppLocalizations.of(context)!.forgot_password,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: ColorConstant.linkColor,
                            fontSize: 14.sp,
                            decoration: TextDecoration.underline),
                      ),
                    ),
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
                              context.read<AuthBloc>().add(SignInEvent(
                                  SignInParameter(
                                      email: emailController.text.trim(),
                                      password:
                                          passwordController.text.trim())));
                            } else {
                              AppToaster.showInfo("Заполните все поля!");
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context)!.sign_in,
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
