import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/screens/router.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/dartpad/dartpad_embed.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SupremeSlide6 extends StatefulWidget {
  const SupremeSlide6({super.key});

  @override
  State<SupremeSlide6> createState() => _SupremeSlide6State();
}

class _SupremeSlide6State extends State<SupremeSlide6> {
  @override
  Widget build(BuildContext context) {
    return const DefaultSlide(
      childrenSlides: [_SupremeSlide6Frame1()],
      title: "Demo",
      subtitle: 'Final Code Exploration',
    );
  }
}

class _SupremeSlide6Frame1 extends StatelessWidget {
  const _SupremeSlide6Frame1();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedFadeUp(
                    delay: 100,
                    child: Text("Live Demo", style: TextStyles().heading1()),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 500,
                    child: AnimatedFadeUp(
                      delay: 300,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white.withAlpha(30)),
                          color: Colors.black26,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: const DartpadEmbed(
                          embedUrl:
                              'https://dartpad.dev/embed-dart.html?theme=dark&run=true',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 24,
            right: 32,
            child: AnimatedFadeUp(
              delay: 500,
              child: Builder(
                builder: (context) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      SlideController.of(context).next();
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text('FINISH'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.dartBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
