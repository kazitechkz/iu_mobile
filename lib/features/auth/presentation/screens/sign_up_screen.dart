import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/image_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/utils/toasters.dart';
import 'package:iu/core/widgets/header_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/widgets/elevated_gradient_button.dart';
import '../../domain/parameters/sign_up_parameter.dart';
import '../widgets/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Errors? errors = null;

  @override
  void dispose() {
    this.emailController.dispose();
    this.phoneController.dispose();
    this.nameController.dispose();
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
        if (state is AuthSignedUpState) {
          Uri uri = Uri.parse(state.redirectUrl);
          String? userId = uri.queryParameters['user'];
          AppToaster.showSuccess("Код отправлен на почту");
          context.go('/${RouteConstant.verifyScreenName}/${userId}');
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
                  HeaderTitle(title: AppLocalizations.of(context)!.sign_up),
                  SizedBox(
                    height: 30.h,
                  ),
                  SignUpForm(
                    keyForm: formKey,
                    emailController: emailController,
                    phoneController: phoneController,
                    nameController: nameController,
                    passwordController: passwordController,
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
                              context
                                  .read<AuthBloc>()
                                  .add(SignUpEvent(SignUpParameter(
                                    email: emailController.text.trim(),
                                    username: emailController.text.trim(),
                                    name: nameController.text.trim(),
                                    phone: "+7${phoneController.text.trim()}",
                                    password: passwordController.text.trim(),
                                  )));
                            } else {
                              AppToaster.showInfo("Заполните все поля!");
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context)!.sign_up,
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
                      context.pushReplacement(
                          "/${RouteConstant.signInScreenName}");
                    },
                    child: RichText(
                        text: TextSpan(
                            text:
                                '${AppLocalizations.of(context)!.have_account} ',
                            style: TextStyle(
                                color: ColorConstant.mainDarkColor,
                                fontSize: 12.sp),
                            children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!.sign_in,
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
