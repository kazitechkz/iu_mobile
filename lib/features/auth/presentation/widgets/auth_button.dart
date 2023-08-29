import 'package:flutter/material.dart';

class AuthButtonWidget extends StatelessWidget {
  late bool typeButton;
  late String buttonText;
  late Color bgColor;
  late Color textColor;
  late FontWeight fontWeight;
  Function()? main_function;

   AuthButtonWidget({
    super.key,
     required this.typeButton,
     required this.buttonText,
     required this.bgColor,
     required this.textColor,
     required this.fontWeight,
     this.main_function,
   });

  @override
  Widget build(BuildContext context) {
    return _buttonType(typeButton, buttonText, bgColor, textColor, fontWeight, () => null);
  }
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