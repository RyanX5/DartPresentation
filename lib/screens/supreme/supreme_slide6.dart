import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/dartpad/dartpad_embed.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class SupremeSlide6 extends StatefulWidget {
  const SupremeSlide6({super.key});

  @override
  State<SupremeSlide6> createState() => _SupremeSlide6State();
}

class _SupremeSlide6State extends State<SupremeSlide6> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      childrenSlides: [SupremeSlide6Frame1()],
      title: "Demo",
      subtitle: '',
    );
  }
}

Widget SupremeSlide6Frame1() {
  return Wrapper(
    child: Center(
      child: Column(
        spacing: 50,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: Text(
              "Demo",
              style: TextStyles(color: Colors.black).heading1(),
            ),
          ),
          AnimatedFadeUp(
            delay: 300,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 600, maxWidth: 1000),
              child: const Center(
                child: DartpadEmbed(
                  embedUrl:
                      'https://dartpad.dev/embed-dart.html?theme=dark&run=true',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
