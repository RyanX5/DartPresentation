import 'package:flutter/material.dart';

class Slide2 extends StatelessWidget {
  const Slide2({super.key});

  // we prolly dont need scaffold here (dont need appbar and shi)
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Dart Programming Language",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Slide 2",
            style: TextStyle(
              color: Colors.black26,
              fontSize: 24,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
