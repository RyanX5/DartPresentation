import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:dart_presentation/widgets/dartpad/dartpad_embed.dart';
import 'package:flutter/material.dart';

class RohanSlide5 extends StatefulWidget {
  const RohanSlide5({super.key});

  @override
  State<RohanSlide5> createState() => _RohanSlide5State();
}

class _RohanSlide5State extends State<RohanSlide5> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Demo',
      subtitle: 'Putting it all together.',
      childrenSlides: [_DemoFrame()],
    );
  }
}

Widget _DemoFrame() {
  return Wrapper(
    child: Center(
      child: Column(
        spacing: 32,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: Text('Live Demo', style: TextStyles().heading1()),
          ),
          AnimatedFadeUp(
            delay: 300,
            child: ConstrainedBox(
              // Replace YOUR_GIST_ID_HERE with your actual GitHub Gist ID
              constraints: const BoxConstraints(maxHeight: 580, maxWidth: 1000),
              child: const Center(
                child: DartpadEmbed(
                  embedUrl:
                      'https://dartpad.dev/embed-dart.html?id=YOUR_GIST_ID_HERE&theme=dark&run=false',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
