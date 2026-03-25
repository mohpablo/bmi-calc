import 'package:bmi_calculator/core/styles.dart';
import 'package:bmi_calculator/widgets/add_remove_button.dart';
import 'package:flutter/material.dart';

class AgeWeightCard extends StatelessWidget {
  const AgeWeightCard({
    super.key,
    required this.counter,
    required this.txt,
    required this.onminus,
    required this.onplus,
  });
  final int counter;
  final String txt;
  final VoidCallback onminus;
  final VoidCallback onplus;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 155,
      height: 180,
      decoration: containerstyle,
      child: Column(
        children: [
          Text(txt, style: textStyle),
          Text(
            counter.toString(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AddRemoveButton(icon: Icons.remove,ontap: onminus,),
              AddRemoveButton(icon: Icons.add,ontap: onplus,),
            ],
          ),
        ],
      ),
    );
  }
}
