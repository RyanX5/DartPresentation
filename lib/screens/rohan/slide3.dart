import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class RohanSlide3 extends StatefulWidget {
  const RohanSlide3({super.key});

  @override
  State<RohanSlide3> createState() => _RohanSlide3State();
}

class _RohanSlide3State extends State<RohanSlide3> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Names, Scopes & Bindings',
      subtitle: 'How Dart binds values to names.',
      childrenSlides: [
        _Frame1(),
        _Frame2(),
        _Frame3(),
        _Frame4(),
        _Frame5(),
        _Frame6(),
      ],
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
          Text('Three Ways to Declare', style: TextStyles().title()),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedFadeUp(
                delay: 300,
                child: _DeclCard(
                  keyword: 'var',
                  color: AppColors.dartBlue,
                  description:
                      'Type inferred at\ncompile time.\nCan be reassigned.',
                ),
              ),
              AnimatedFadeUp(
                delay: 550,
                child: _DeclCard(
                  keyword: 'final',
                  color: Colors.orange,
                  description: 'Set once at\nruntime.\nCannot be reassigned.',
                ),
              ),
              AnimatedFadeUp(
                delay: 800,
                child: _DeclCard(
                  keyword: 'const',
                  color: Colors.greenAccent.shade400,
                  description: 'Compile-time\nconstant.\nDeep immutability.',
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _Frame2() {
  const code = '''
void main() {
  var score = 95;        // inferred as int, can change
  score = 100;           // OK

  final name = 'Rohan';  // set once, cannot reassign
  // name = 'Someone';   // ERROR

  const pi = 3.14159;    // compile-time constant
  // pi = 3.0;           // ERROR

  // final vs const: final is evaluated at runtime
  final now = DateTime.now(); // OK
  // const now = DateTime.now(); // ERROR — not compile-time
}''';

  return _CodeFrame(title: 'var / final / const', code: code);
}

Widget _Frame3() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Lexical Scoping & Closures', style: TextStyles().title()),
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
                    "Dart uses lexical scoping — a variable's scope is determined by where it's written in the code",
                  ),
                ),
                AnimatedFadeUp(
                  delay: 550,
                  child: _Bullet(
                    'Inner functions can access variables from their enclosing scope',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 800,
                  child: _Bullet(
                    'A closure is a function that captures and remembers its surrounding variables, even after the outer function returns',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 1050,
                  child: _Bullet(
                    'Similar to Python — unlike Java where captured locals must be effectively final and are less flexible',
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

Widget _Frame4() {
  const code = '''
Function makeCounter() {
  int count = 0; // captured by the closure below

  return () {
    count++;     // still has access to count
    print(count);
  };
}

void main() {
  var counter = makeCounter();
  counter(); // 1
  counter(); // 2
  counter(); // 3 — count persists across calls
}''';

  return _CodeFrame(title: 'Closures', code: code);
}

Widget _Frame5() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Null Safety', style: TextStyles().title()),
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
                    'By default, variables cannot be null — String name cannot hold null',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 550,
                  child: _Bullet(
                    r'Add ? to opt into nullable: String? name can be null',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 800,
                  child: _Bullet(
                    'Use ?? as a null fallback — name ?? "Guest" returns "Guest" if name is null',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 1050,
                  child: _Bullet(
                    "Use ?. for safe calls — won't crash even if the object is null",
                  ),
                ),
                AnimatedFadeUp(
                  delay: 1300,
                  child: _Bullet(
                    'Unlike Java — NullPointerException becomes a compile error, not a runtime crash',
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

Widget _Frame6() {
  const code = '''
void main() {
  String name = 'Rohan';
  // name = null; // ERROR — not nullable

  String? nickname = null; // explicitly nullable

  // ?? — null fallback
  print(nickname ?? 'Guest');          // Guest

  // ?. — safe call, won't crash if null
  print(nickname?.toUpperCase());      // null (no crash)

  // ! — force unwrap (throws if null, use carefully)
  nickname = 'RK';
  print(nickname!.toUpperCase());      // RK
}''';

  return _CodeFrame(title: 'Null Safety', code: code);
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
                constraints: const BoxConstraints(maxWidth: 820),
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

Widget _DeclCard({
  required String keyword,
  required Color color,
  required String description,
}) {
  return Container(
    width: 220,
    padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
    decoration: BoxDecoration(
      border: Border.all(color: color.withAlpha(80), width: 1.5),
      borderRadius: BorderRadius.circular(16),
      color: color.withAlpha(18),
    ),
    child: Column(
      children: [
        Text(
          keyword,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: color,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 17,
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    ),
  );
}
