import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Icon icon;
  final String label;
  const CustomButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(label, style: TextStyle(color: Colors.white)),
      icon: icon,
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    );
  }
}
