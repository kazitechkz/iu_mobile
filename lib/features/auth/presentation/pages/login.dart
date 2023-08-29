import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu_front/core/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  _buttonType(false, 'Войти', Colors.indigo, Colors.white, FontWeight.normal, ()=>{}),
                  SizedBox(height: 20.h,),
                  _buttonType(true, 'Зарегистрироваться', Colors.white, Colors.black, FontWeight.normal, ()=>{}),
                  SizedBox(height: 20.h,),
                  _buttonType(false, 'Войти через Mundelik', Colors.lightBlueAccent, Colors.white, FontWeight.normal, ()=>{}),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttonType(bool typeButton, String buttonText, Color bgColor, Color textColor, FontWeight fontWeight, Function()? onPressed) {
    if (typeButton) {
      return OutlinedButton(
        onPressed: () => onPressed,
        style: ElevatedButton.styleFrom(
          side: const BorderSide(width: 2.0, color: Colors.indigo),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: buttonText,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: fontWeight
                      )
                  )
                ],
              ),
            )
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: () => onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            // <-- Radius
          ),
          backgroundColor: bgColor,
          elevation: 15,  // Elevation
          shadowColor: Colors.black, // Shadow Color
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: buttonText,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: fontWeight
                      )
                  )
                ],
              ),
            )
        ),
      );
    }

  }
}
