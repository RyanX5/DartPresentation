import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide05Iteration extends StatelessWidget {
  const Slide05Iteration({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Iteration Structures',
      subtitle: 'Loops in Dart.',
      childrenSlides: [
        _LoopOverviewFrame(),
        _ForLoopFrame(),
        _QuizFrame(),
      ],
    );
  }
}

// ── Frame 1: Loop Overview ─────────────────────────────────────────────────────

class _LoopOverviewFrame extends StatelessWidget {
  const _LoopOverviewFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('ITERATION STRUCTURES',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Dart supports all standard iteration patterns.',
              style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 44),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: AnimatedFadeUp(delay: 350, child: _LoopCard(
                label: 'for',
                color: AppColors.dartBlue,
                icon: Icons.repeat,
                desc: 'Classic C-style for loop. Best when you know the iteration count.',
                snippet: 'for (int i = 0; i < 10; i++) { }',
                also: 'Also: for-in loop for iterables\nfor (var item in list) { }',
              ))),
              const SizedBox(width: 20),
              Expanded(child: AnimatedFadeUp(delay: 500, child: _LoopCard(
                label: 'while',
                color: const Color(0xFF7C4DFF),
                icon: Icons.loop,
                desc: 'Repeats while a boolean condition is true. Checks condition before each iteration.',
                snippet: 'while (condition) { }',
                also: 'Condition must be strictly bool —\nno truthy values like Python/JS.',
              ))),
              const SizedBox(width: 20),
              Expanded(child: AnimatedFadeUp(delay: 650, child: _LoopCard(
                label: 'do-while',
                color: Colors.orangeAccent,
                icon: Icons.replay,
                desc: 'Executes body at least once, then checks the condition at the end.',
                snippet: 'do { } while (condition);',
                also: 'Guarantees at least one execution\n— useful for input validation.',
              ))),
            ],
          ),
        ],
      ),
    );
  }
}

class _LoopCard extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;
  final String desc;
  final String snippet;
  final String also;
  const _LoopCard({required this.label, required this.color, required this.icon,
    required this.desc, required this.snippet, required this.also});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 12),
              Text(label,
                  style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.w900, fontFamily: 'monospace')),
            ],
          ),
          const SizedBox(height: 16),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.5)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(snippet,
                style: const TextStyle(color: Colors.white70, fontSize: 13, fontFamily: 'monospace')),
          ),
          const SizedBox(height: 16),
          Text(also, style: TextStyle(color: color.withAlpha(180), fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}

// ── Frame 2: For Loop Code Example ────────────────────────────────────────────

class _ForLoopFrame extends StatelessWidget {
  const _ForLoopFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: AnimatedFadeUp(
              delay: 200,
              child: CodeDisplay(
                fontSize: 15,
                code: '''// Classic for loop
for (int i = 1; i <= 10; i++) {
  print(i);
}
// Output: 1 2 3 4 5 6 7 8 9 10

// For-in loop (iterables)
List<String> fruits = ['apple', 'banana', 'cherry'];
for (var fruit in fruits) {
  print(fruit);
}

// forEach with lambda
fruits.forEach((fruit) => print(fruit));

// While loop equivalent
int i = 1;
while (i <= 10) {
  print(i);
  i++;
}''',
              ),
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeUp(
                  delay: 100,
                  child: const Text('CODE EXAMPLE',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Three ways to iterate in Dart.',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800, height: 1.2),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _InfoPoint2(Icons.looks_one, AppColors.dartBlue,
                      'Classic for loop', 'Explicit counter variable. Best when index matters.'),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 550,
                  child: _InfoPoint2(Icons.looks_two, const Color(0xFF7C4DFF),
                      'for-in loop', 'Iterates over any Iterable — Lists, Sets, Maps, generators.'),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 700,
                  child: _InfoPoint2(Icons.looks_3, Colors.orangeAccent,
                      'forEach + lambda', 'Functional style — passes each element to a callback. Chainable.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _InfoPoint2(IconData icon, Color color, String title, String desc) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, color: color, size: 22),
      const SizedBox(width: 14),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.bold)),
            Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
          ],
        ),
      ),
    ],
  );
}

// ── Frame 3: Quiz — while(1) ───────────────────────────────────────────────────

class _QuizFrame extends StatefulWidget {
  const _QuizFrame();

  @override
  State<_QuizFrame> createState() => _QuizFrameState();
}

class _QuizFrameState extends State<_QuizFrame> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedFadeUp(
              delay: 100,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.amberAccent.withAlpha(25),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.amberAccent.withAlpha(80)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.quiz, color: Colors.amberAccent, size: 16),
                    SizedBox(width: 8),
                    Text('QUICK QUIZ', style: TextStyle(color: Colors.amberAccent, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 2)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 36),
            AnimatedFadeUp(
              delay: 200,
              child: const Text(
                'What happens when you write\nwhile(1) in Dart?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w800, height: 1.2),
              ),
            ),
            const SizedBox(height: 28),
            AnimatedFadeUp(
              delay: 350,
              child: CodeDisplay(code: '''// In Python, this is valid:
while 1:
    print("looping forever")

// In Dart — what does this do?
while (1) {
  print("looping forever");
}''', fontSize: 15),
            ),
            const SizedBox(height: 36),
            if (!_revealed)
              AnimatedFadeUp(
                delay: 500,
                child: ElevatedButton.icon(
                  onPressed: () => setState(() => _revealed = true),
                  icon: const Icon(Icons.visibility),
                  label: const Text('Reveal Answer'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              )
            else
              AnimatedFadeUp(
                delay: 0,
                child: Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6B6B).withAlpha(20),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFFF6B6B).withAlpha(100)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Color(0xFFFF6B6B), size: 40),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('A compilation error!',
                                style: TextStyle(color: Color(0xFFFF6B6B), fontSize: 22, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text(
                              'Unlike Python\'s truthy values, Dart enforces strict boolean evaluation. The integer 1 is not a bool — this is a type error caught at compile time.\n\nUse while (true) { } for intentional infinite loops.',
                              style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 15, height: 1.6),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
