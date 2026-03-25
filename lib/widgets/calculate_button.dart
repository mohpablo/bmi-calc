import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({super.key,required this.txt});
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              height: 100,
              color: Color(0xffE83D67),
              alignment: Alignment.center,
              child: Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            );
  }
}
