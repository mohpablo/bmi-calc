import 'package:flutter/material.dart';
import 'package:bmi_calculator/core/styles.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer({
    super.key,
    required this.img,
    required this.txt,
    required this.onTap,
    required this.color
    // Add selection state
  });

  final String img;
  final String txt;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 155,
          height: 180,
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img, width: 96, height: 96),
              Text(txt, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}
