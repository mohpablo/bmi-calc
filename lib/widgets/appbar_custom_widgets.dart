import 'package:flutter/material.dart';

PreferredSizeWidget appBarCustomWidget() {
  return AppBar(
    backgroundColor: const Color(0xff24263B),
    title: const Text(
      "BMI Calculator",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
    ),
    centerTitle: true,
    shadowColor: Colors.black,
    elevation: 10,
  );
}
