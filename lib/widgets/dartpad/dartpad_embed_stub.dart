import 'package:flutter/material.dart';

class DartpadEmbed extends StatelessWidget {
  final String embedUrl;
  const DartpadEmbed({
    super.key,
    this.embedUrl = 'https://dartpad.dev/embed-dart.html?theme=dark',
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dartpad is only supported on Web'));
  }
}
