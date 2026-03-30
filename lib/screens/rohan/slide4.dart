import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class RohanSlide4 extends StatefulWidget {
  const RohanSlide4({super.key});

  @override
  State<RohanSlide4> createState() => _RohanSlide4State();
}

class _RohanSlide4State extends State<RohanSlide4> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Semantic Analysis',
      subtitle: 'Catching bugs before you run a single line.',
      childrenSlides: [_Frame1(), _Frame2(), _Frame3()],
    );
  }
}

Widget _Frame1() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Type Inference', style: TextStyles().title()),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedFadeUp(
                  delay: 300,
                  child: _Bullet(
                    'Dart is statically typed — types are resolved at compile time, not runtime',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 550,
                  child: _Bullet(
                    'var x = 42 — the analyzer infers x is int immediately, no annotation needed',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 800,
                  child: _Bullet(
                    'Once inferred, the type is locked — reassigning x = "hello" is a compile error',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 1050,
                  child: _Bullet(
                    'Unlike Python — x = 42 then x = "hello" is valid but only breaks at runtime',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _Frame2() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sound Null Safety', style: TextStyles().title()),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedFadeUp(
                  delay: 300,
                  child: _Bullet(
                    '"Sound" means the compiler fully guarantees null safety — no loopholes',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 550,
                  child: _Bullet(
                    'The analyzer builds a flow graph and tracks nullability through every branch',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 800,
                  child: _Bullet(
                    'After if (x != null), Dart automatically promotes x to non-nullable inside that block',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 1050,
                  child: _Bullet(
                    'Java has @Nullable annotations as hints — Dart enforces this at the compiler level',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _Frame3() {
  const code = '''
void main() {
  // Type inference — x is int, locked at compile time
  var x = 42;
  // x = 'hello'; // COMPILE ERROR: String can't be assigned to int

  // Null safety — analyzer tracks flow through branches
  String? maybeNull = null;

  // print(maybeNull.length); // COMPILE ERROR: nullable access

  if (maybeNull != null) {
    // Dart promotes maybeNull to String here automatically
    print(maybeNull.length); // SAFE — no ? needed
  }

  // Java: NullPointerException at runtime (no warning)
  // Dart: caught before you even run the program
}''';

  return _CodeFrame(title: 'Catching Bugs at Compile Time', code: code);
}

class _CodeFrame extends StatelessWidget {
  final String title;
  final String code;
  const _CodeFrame({required this.title, required this.code});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedFadeUp(
              delay: 100,
              child: Text(title, style: TextStyles().heading1()),
            ),
            const SizedBox(height: 28),
            AnimatedFadeUp(
              delay: 300,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: CodeDisplay(code: code),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _Bullet(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        '→  ',
        style: TextStyle(color: AppColors.dartCyan, fontSize: 21),
      ),
      Expanded(child: Text(text, style: TextStyles().normal())),
    ],
  );
}
