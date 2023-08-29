import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  late String image_url;
  late String text;
  late String buttonText;
  late int index;
  late PageController pageController;
  late String? main_text;
  WelcomeWidget({super.key,
    required this.image_url,
    required this.text,
    required this.buttonText,
    required this.index,
    required this.pageController,
    this.main_text,
  });

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Center(
                child: Image.asset(
                    image_url,
                ),
              )
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [

                             TextSpan(
                                text: text,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 28
                                )

                            ),
                              main_text != null
                                ? TextSpan(
                                text: main_text,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo,
                                  fontSize: 28,
                                )
                              )
                            : const TextSpan(),

                          ]
                        ),
                      ),
                      const SizedBox(height: 20,),
                     ElevatedButton(
                       onPressed: () {
                         if(index < 3){
                           pageController.nextPage(
                               duration: Duration(milliseconds: 400),
                                curve: Curves.linear
                           );
                         }
                       },
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.indigo,
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
                                 style: const TextStyle(
                                   color: Colors.white,
                                   fontSize: 22,
                                   fontWeight: FontWeight.w500
                                 )
                               ),
                               const WidgetSpan(
                                 child: Icon(
                                     Icons.arrow_forward,
                                     size: 22,
                                     color: Colors.white,
                                 ),
                               ),
                             ],
                           ),
                         )
                       ),
                     )
                   ],

                ),
              )
          ),
        ],
      )

    );
  }
}
