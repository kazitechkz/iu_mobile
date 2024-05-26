import 'package:flutter/material.dart';
import 'package:iu/core/app_constants/color_constant.dart';

class GridCard extends StatelessWidget {
  final String image;
  final String text;
  final bool isSelected;

  const GridCard({super.key, required this.image, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? ColorConstant.orangeColor : ColorConstant.appBarColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}