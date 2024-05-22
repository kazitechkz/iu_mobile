import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/services/injection_main.container.dart';
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
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: '63949755595-icoul3dst1q7mg35q55iko1h3a7798na.apps.googleusercontent.com',
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> _handleSignIn() async {
    try {
      sl<Talker>().debug('google');
      // final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // if (googleUser != null) {
      //   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      //   print('Access Token: ${googleAuth.accessToken}');
      //   print('ID Token: ${googleAuth.idToken}');
      //   print('User: ${googleUser.displayName}');
      //   // Handle the sign-in logic, e.g., save tokens, navigate to another page, etc.
      // }
    } catch (error) {
      sl<Talker>().debug(error);
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
                        Container(
                          width: 70.r,
                          height: 70.r,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white, width: 2.0),
                              shape: BoxShape.circle
                          ),
                          child: IconButton(
                            icon: Image.asset('assets/images/google_icon.webp'),
                            iconSize: 50,
                            onPressed: _handleSignIn,
                          ),
                        ),
                        Container(
                          width: 70.r,
                          height: 70.r,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white, width: 2.0),
                              shape: BoxShape.circle
                          ),
                          child: IconButton(
                            icon: Image.asset('assets/images/kundelik_icon.png'),
                            iconSize: 50,
                            onPressed: () {},
                          ),
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
