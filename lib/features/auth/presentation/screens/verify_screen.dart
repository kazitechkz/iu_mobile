import 'package:flutter/cupertino.dart';
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
import '../../../../core/app_constants/image_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/common/models/response_data.dart';
import '../../../../core/utils/toasters.dart';
import '../../../../core/widgets/elevated_gradient_button.dart';
import '../../../../core/widgets/header_title.dart';
import '../bloc/auth_bloc.dart';

class VerifyScreen extends StatefulWidget {
  final String userId;

  const VerifyScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState(userId);
}

class _VerifyScreenState extends State<VerifyScreen> {
  final String userId;

  _VerifyScreenState(this.userId);

  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Errors? errors = null;

  @override
  void dispose() {
    this.codeController.dispose();
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
          context.go('/${RouteConstant.signInScreenName}');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 320.w,
                      height: 280.h,
                      child: Image.asset(
                        ImageConstant.AuthBear,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeaderTitle(
                        title: AppLocalizations.of(context)!.verify_account),
                    SizedBox(
                      height: 10.h,
                    ),
                    SubHeaderTitle(
                        title:
                            AppLocalizations.of(context)!.verify_account_text),
                    SizedBox(
                      height: 30.h,
                    ),
                    OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 80,
                      style: TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      otpFieldStyle: OtpFieldStyle(
                          disabledBorderColor: ColorConstant.grayDarkColor),
                      onCompleted: (pin) {
                        context.read<AuthBloc>().add(VerifyEvent(
                            VerifyParameter(user_id: userId, code: pin)));
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
