import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/widgets/sub_header_title.dart';
import 'package:iu/features/auth/domain/parameters/verify_parameter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/utils/toasters.dart';
import '../../../../core/widgets/header_title.dart';
import '../bloc/auth_bloc.dart';

class VerifyScreen extends StatefulWidget {
  final String userId;

  const VerifyScreen({super.key, required this.userId});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Errors? errors;

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          AppToaster.showError(state.failureData.message ?? "");
        }
        if (state is AuthVerifiedState) {
          AppToaster.showSuccess("Аккаунт успешно активирован");
          context.go('/${RouteConstant.authScreenName}');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      width: 300.r,
                      height: 200.r,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo-white.png'),
                            fit: BoxFit.contain,
                          )
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeaderTitle(
                        title: AppLocalizations.of(context)!.verify_account, color: Colors.white,),
                    SizedBox(
                      height: 10.h,
                    ),
                    SubHeaderTitle(
                        title: AppLocalizations.of(context)!.verify_account_text),
                    SizedBox(
                      height: 30.h,
                    ),
                    OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 70,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      outlineBorderRadius: 15,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: Colors.white,
                        focusBorderColor: Colors.yellow,
                        borderColor: Colors.white,
                          disabledBorderColor: ColorConstant.grayDarkColor),
                      onCompleted: (pin) {
                        context.read<AuthBloc>().add(VerifyEvent(
                            VerifyParameter(user_id: widget.userId, code: pin)));
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
