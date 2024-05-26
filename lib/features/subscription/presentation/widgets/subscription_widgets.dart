import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/app_constants/color_constant.dart';

class SubscriptionOption extends StatelessWidget {
  final String price;
  final String period;
  final bool isSelected;
  final bool isPopular;

  const SubscriptionOption({
    super.key,
    required this.price,
    required this.period,
    required this.isSelected,
    this.isPopular = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = isSelected ? Colors.white : Colors.black;
    return Column(
      children: [
        if (isPopular)
          const Text(
            'Popular',
            style: TextStyle(color: Colors.red),
          ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? ColorConstant.orangeColor : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor
                    ),
                  ),
                  FaIcon(FontAwesomeIcons.tengeSign, color: textColor,)
                ],
              ),
              Text(period, style: TextStyle(color: textColor),),
            ],
          ),
        ),
      ],
    );
  }
}