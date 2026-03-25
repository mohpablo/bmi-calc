import 'package:bmi_calculator/core/styles.dart';
import 'package:bmi_calculator/views/home_view.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/appbar_custom_widgets.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final double bmi;
  final String gender;

  const ResultView({super.key, required this.bmi, required this.gender});

  String getBmiCategory() {
    double underweight = 18.5;
    double normal = 24.9;
    double overweight = 29.9;

    if (gender == "Male") {
      underweight = 20.0;
      normal = 25.9;
      overweight = 30.9;
    } else if (gender == "Female") {
      underweight = 18.0;
      normal = 24.0;
      overweight = 29.0;
    }

    if (bmi < underweight) return "Underweight";
    if (bmi <= normal) return "Normal weight";
    if (bmi <= overweight) return "Overweight";
    return "Obese";
  }

  Color getBmiColor() {
    String category = getBmiCategory();
    if (category == "Underweight") return Colors.orange;
    if (category == "Normal weight") return Colors.green;
    if (category == "Overweight") return Colors.redAccent;
    return Colors.red; // Obese
  }

  String getBmiFeedback() {
    String category = getBmiCategory();
    if (category == "Underweight") {
      return "You are below the healthy weight range. Consider eating more balanced meals and consulting a doctor.";
    } else if (category == "Normal weight") {
      return "Great job! You are within the healthy weight range. Keep maintaining your lifestyle!";
    } else if (category == "Overweight") {
      return "You are above the healthy weight range. Regular exercise and a balanced diet can help.";
    } else {
      return "Your BMI indicates obesity. It's recommended to consult with a healthcare professional for guidance.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C2135),
      appBar: appBarCustomWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Your Result",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: double.infinity,
              height: 503,
              decoration: containerstyle,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    getBmiCategory(),
                    style: TextStyle(fontSize: 20, color: getBmiColor()),
                  ),
                  Text(
                    "$bmi",
                    style: TextStyle(color: Colors.white, fontSize: 64),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      getBmiFeedback(),
                      style: TextStyle(fontSize: 16, color: Color(0xff8B8C9E)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CalculateButton(txt: "Re-Calculate"),
          ),
        ],
      ),
    );
  }
}
