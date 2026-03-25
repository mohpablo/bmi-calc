import 'package:flutter/material.dart';

class AddRemoveButton extends StatelessWidget {
  const AddRemoveButton({super.key, required this.icon,required this.ontap});
  final IconData icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Makes it circular
        color: Color(0xff8B8C9E), // Background color
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: Colors.white, size: 32),
        onPressed: ontap,
      ),
    );
  }
}
