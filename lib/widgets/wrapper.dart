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
    final size = MediaQuery.sizeOf(context);
    final hPad = (size.width * 0.042).clamp(28.0, 72.0);
    final vTop = (size.height * 0.165).clamp(115.0, 155.0);
    const vBot = 55.0; // clears frame dots at bottom: 28
    return Padding(
      padding: EdgeInsets.fromLTRB(hPad, vTop, hPad, vBot),
      child: widget.child,
    );
  }
}
