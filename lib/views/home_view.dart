import 'package:bmi_calculator/core/styles.dart';
import 'package:bmi_calculator/database/cacheHelper.dart';
import 'package:bmi_calculator/views/result_view.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/age_weight_card.dart';
import 'package:bmi_calculator/widgets/appbar_custom_widgets.dart';
import 'package:bmi_calculator/widgets/gender_container.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
double h = 150;
  int weight = 60;
  int age = 26;
  bool male = false;
  bool female = false;

   @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() {
  setState(() {
    male = CacheHelper.getData("gender") == "Male";
    female = CacheHelper.getData("gender") == "Female";
    h = double.tryParse(CacheHelper.getData("height") ?? "150") ?? 150;
    weight = int.tryParse(CacheHelper.getData("weight") ?? "60") ?? 60;
    age = int.tryParse(CacheHelper.getData("age") ?? "26") ?? 26;
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: appBarCustomWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderContainer(
                  img: "assets/images/material-symbols_male.png",
                  txt: "Male",
                  color: male ? Color(0xff24263B) : Color(0xff333244),
                  onTap: () {
                    setState(() {
                      male = true;
                      female = false;
                    });
                  },
                ),
                GenderContainer(
                  img: "assets/images/material-symbols_female.png",
                  txt: "Female",
                  color: female ? Color(0xff24263B) : Color(0xff333244),
                  onTap: () {
                    setState(() {
                      male = false;
                      female = true;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 319,
            height: 189,
            decoration: containerstyle,
            child: Column(
              children: [
                Text("Height", style: textStyle),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      "${h.round()}",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "cm",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: h,
                  onChanged: (double v) {
                    setState(() {
                      h = v;
                    });
                  },
                  max: 220,
                  min: 0,
                  activeColor: Color(0xffE83D67),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AgeWeightCard(
                counter: weight,
                txt: "Weight",
                onminus: () {
                  setState(() {
                    weight--;
                  });
                },
                onplus: () {
                  setState(() {
                    weight++;
                  });
                },
              ),
              AgeWeightCard(
                counter: age,
                txt: "Age",
                onminus: () {
                  setState(() {
                    age--;
                  });
                },
                onplus: () {
                  setState(() {
                    age++;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 56),
          GestureDetector(
            onTap: () {
              double heightInMeters = h / 100;
              double bmi = weight / (heightInMeters * heightInMeters);
              bmi = double.parse(bmi.toStringAsFixed(1));

              String gender = male ? "Male" : "Female";

              CacheHelper.saveData("gender", gender);
              CacheHelper.saveData("height", h.toString());
              CacheHelper.saveData("weight", weight.toString());
              CacheHelper.saveData("age", age.toString());
              CacheHelper.saveData("bmi", bmi.toString());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultView(bmi: bmi, gender: gender),
                ),
              );
            },
            child: CalculateButton(txt: "Calculate"),
          ),
        ],
      ),
    );
  }
}
