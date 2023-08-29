import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu_front/core/constants/constants.dart';
import 'package:iu_front/features/auth/presentation/widgets/auth_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(),
    );
  }

  Widget _bodyBuilder() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: const Text('Ну что, начнем?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  ),
                  const Text('Для начала войдите в свой профиль', style: TextStyle(fontSize: 14),),
                  SizedBox(
                    height: 345.h,
                      child: Image.asset(
                        BearImages.CHAIR,
                      )),
                  AuthButtonWidget(typeButton: false, buttonText: 'Войти', bgColor: Colors.indigo, textColor: Colors.white, fontWeight: FontWeight.normal,main_function: ()=>{},),
                  SizedBox(height: 20.h,),
                  AuthButtonWidget(typeButton: true, buttonText: 'Зарегистрироваться', bgColor: Colors.white, textColor: Colors.black, fontWeight: FontWeight.normal,main_function: ()=>{},),
                  SizedBox(height: 20.h,),
                  AuthButtonWidget(typeButton: false, buttonText: 'Войти через Mundelik', bgColor: Colors.lightBlueAccent, textColor: Colors.white, fontWeight: FontWeight.normal,main_function: ()=>{},),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


}
