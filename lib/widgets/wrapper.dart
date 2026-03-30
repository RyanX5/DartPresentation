import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final Widget child;
  const Wrapper({super.key, required this.child});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 140, horizontal: 60),
      child: widget.child,
    );
  }
}
