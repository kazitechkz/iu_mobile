import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/utils/google_api.dart';
import 'package:iu/core/utils/hive_utils.dart';
import 'package:iu/features/auth/presentation/bloc/google/google_bloc.dart';
import 'package:iu/features/auth/presentation/bloc/kundelik/kundelik_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/link.dart';
import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/services/injection_main.container.dart';
import '../../../../core/utils/kundelik_api.dart';
import '../../../../core/utils/toasters.dart';
import '../../../../core/widgets/elevated_gradient_button.dart';
import '../../domain/parameters/sign_in_parameter.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/sign_in_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Errors? errors;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _googleSignIn() async {
    try {
      context.read<GoogleBloc>().add(GoogleLoadingEvent());
      final user = await GoogleSignInApi.login();
      if (user != null && mounted) {
        GoogleSignInParameter params = GoogleSignInParameter(name: user.displayName!, email: user.email);
        context.read<GoogleBloc>().add(GoogleSignInEvent(params));
      } else {
        if (mounted) {
          context.read<GoogleBloc>().add(GoogleLoadingCanceledEvent());
        }
      }
    } catch (error) {
      sl<Talker>().debug(error);
    }
  }

  Future<void> _kundelikSignIn() async {
    try {
      context.read<KundelikBloc>().add(KundelikLoadingEvent());
      // Проверка, что виджет все еще смонтирован перед использованием контекста
      if (!mounted) return;
      context.goNamed(RouteConstant.kundelikScreenName);

      String? token = await HiveUtils().getString('kundelikToken');
      if (token != null && mounted) {
        KundelikSignInParameter params = KundelikSignInParameter(token: token);
        context.read<KundelikBloc>().add(KundelikAuthEvent(params));
      }
    } catch (error) {
      if (mounted) {
        context.read<KundelikBloc>().add(KundelikLoadingCanceledEvent());
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
          context.pushReplacementNamed(RouteConstant.dashboardScreenName);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black, // Dark background color
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.r,
                      height: 200.r,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo-white.png'),
                            fit: BoxFit.contain,
                          )
                      ),
                    ),
                    const SizedBox(height: 20),
                    SignInForm(
                      keyForm: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      errors: null,
                    ),
                    const SizedBox(height: 20),
                    ((state is! AuthLoadingState)
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
                          'Войти',
                          style:
                          TextStyle(color: Colors.white, fontSize: 18.sp),
                        ))
                        : const Center(child: CircularProgressIndicator(),
                    )),
                    const SizedBox(height: 20),
                    const Text('- Or sign in with -',
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocConsumer<GoogleBloc, GoogleState>(
                            builder: (context, googleState) {
                              if (googleState is GoogleLoading) {
                                return const Center(child: CircularProgressIndicator(color: Colors.white,));
                              }
                              if (googleState is GoogleLoadingCanceled) {
                                return Container(
                                  width: 70.r,
                                  height: 70.r,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2.0),
                                      shape: BoxShape.circle
                                  ),
                                  child: IconButton(
                                    icon: Image.asset(
                                        'assets/images/google_icon.webp'),
                                    iconSize: 50,
                                    onPressed: _googleSignIn,
                                  ),
                                );
                              }
                              return Container(
                                width: 70.r,
                                height: 70.r,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2.0),
                                    shape: BoxShape.circle
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                      'assets/images/google_icon.webp'),
                                  iconSize: 50,
                                  onPressed: _googleSignIn,
                                ),
                              );
                            },
                            listener: (context, googleState) {
                              if (googleState is GoogleLoaded) {
                                AppToaster.showSuccess("Добро пожаловать!");
                                context.pushReplacementNamed(RouteConstant.dashboardScreenName);
                              }
                              if (googleState is GoogleError) {
                                AppToaster.showError(googleState.failureData.message ?? "");
                              }
                            }
                        ),
                        BlocConsumer<KundelikBloc, KundelikState>(
                            builder: (context, kundelikState) {
                              if (kundelikState is KundelikLoading) {
                                return const Center(child: CircularProgressIndicator(color: Colors.white,));
                              }
                              if (kundelikState is KundelikLoadingCanceled) {
                                return Container(
                                  width: 70.r,
                                  height: 70.r,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2.0),
                                      shape: BoxShape.circle
                                  ),
                                  child: IconButton(
                                    icon: Image.asset(
                                        'assets/images/kundelik_icon.png'),
                                    iconSize: 50,
                                    onPressed: _kundelikSignIn,
                                  ),
                                );
                              }
                              return Container(
                                width: 70.r,
                                height: 70.r,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2.0),
                                    shape: BoxShape.circle
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                      'assets/images/kundelik_icon.png'),
                                  iconSize: 50,
                                  onPressed: _kundelikSignIn,
                                ),
                              );
                            },
                            listener: (context, kundelikState) {
                              if (kundelikState is KundelikLoaded) {
                                AppToaster.showSuccess("Добро пожаловать!");
                                context.pushReplacementNamed(RouteConstant.dashboardScreenName);
                              }
                              if (kundelikState is KundelikError) {
                                AppToaster.showError(kundelikState.failureData.message ?? "");
                              }
                            }
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Don’t have an account? Sign up',
                          style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
