import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide11Lambdas extends StatelessWidget {
  const Slide11Lambdas({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'First-Class Functions & Lambdas',
      subtitle: 'Functions as values in Dart.',
      childrenSlides: [
        _FirstClassFrame(),
        _LambdaFrame(),
        _QuizFrame(),
      ],
    );
  }
}

// ── Frame 1: First-Class Functions ─────────────────────────────────────────────

class _FirstClassFrame extends StatelessWidget {
  const _FirstClassFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeUp(
                  delay: 100,
                  child: const Text('FIRST-CLASS FUNCTIONS',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'In Dart, functions are objects - they can be stored, passed, and returned like any value.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 36),
                AnimatedFadeUp(delay: 400, child: _FnPoint(
                  icon: Icons.save_alt,
                  color: AppColors.dartBlue,
                  title: 'Assign to variables',
                  desc: 'var greet = (String name) => \'Hello, \$name\';',
                )),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 550, child: _FnPoint(
                  icon: Icons.input,
                  color: Colors.orangeAccent,
                  title: 'Pass as arguments',
                  desc: '[1,2,3].forEach(print) - pass print itself.',
                )),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 700, child: _FnPoint(
                  icon: Icons.output,
                  color: Colors.greenAccent,
                  title: 'Return from functions',
                  desc: 'Function makeAdder(int n) => (int x) => x + n;',
                )),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 850, child: _FnPoint(
                  icon: Icons.inventory,
                  color: Colors.purpleAccent,
                  title: 'Store in collections',
                  desc: 'List<Function> ops = [add, subtract, multiply];',
                )),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 6,
            child: AnimatedFadeUp(
              delay: 300,
              child: CodeDisplay(
                fontSize: 14,
                code: '''// Assign to variable
var greet = (String name) => 'Hello, \$name!';
print(greet('Dart')); // Hello, Dart!

// Pass as argument
int applyTwice(int Function(int) fn, int x) => fn(fn(x));
print(applyTwice((x) => x * 2, 3)); // 12

// Return from function (closure)
Function makeMultiplier(int n) => (int x) => x * n;
var triple = makeMultiplier(3);
print(triple(5)); // 15''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FnPoint extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _FnPoint({required this.icon, required this.color, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: color.withAlpha(25), borderRadius: BorderRadius.circular(8)),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.bold)),
              Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, fontFamily: 'monospace', height: 1.3)),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Frame 2: Arrow Syntax & Lambdas ───────────────────────────────────────────

class _LambdaFrame extends StatelessWidget {
  const _LambdaFrame();

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
                fontSize: 14,
                code: '''var multiply = (int a, int b) => a * b;
print(multiply(3, 4)); // 12

var nums = [1, 2, 3, 4, 5];
var doubled = nums.map((e) => e * 2).toList(); // [2,4,6,8,10]
var evens   = nums.where((e) => e.isEven).toList(); // [2,4]
var total   = nums.reduce((a, b) => a + b); // 15

// Closure captures outer scope
int counter = 0;
var inc = () => counter++;
inc(); inc();
print(counter); // 2''',
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
                  child: const Text('LAMBDAS & ARROW SYNTAX',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Concise anonymous functions with => arrow syntax.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _SyntaxBox('(a, b) => a + b', AppColors.dartBlue,
                    'Arrow function - one expression, implicit return.')),
                const SizedBox(height: 12),
                AnimatedFadeUp(delay: 500, child: _SyntaxBox('.map((e) => e * 2)', Colors.orangeAccent,
                    'Transform every element - returns a lazy Iterable.')),
                const SizedBox(height: 12),
                AnimatedFadeUp(delay: 600, child: _SyntaxBox('.where((e) => e > 3)', const Color(0xFF7C4DFF),
                    'Filter elements - keep only those matching the predicate.')),
                const SizedBox(height: 12),
                AnimatedFadeUp(delay: 700, child: _SyntaxBox('.reduce((a, b) => a + b)', Colors.greenAccent,
                    'Fold elements into a single value - left-to-right.')),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 850,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withAlpha(20)),
                    ),
                    child: const Text(
                      'Closures capture variables from their enclosing scope by reference - the same model as JavaScript and Python.',
                      style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SyntaxBox extends StatelessWidget {
  final String syntax;
  final Color color;
  final String desc;
  const _SyntaxBox(this.syntax, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(syntax, style: TextStyle(color: color, fontSize: 13, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, height: 1.4)),
        ],
      ),
    );
  }
}

// ── Frame 3: Quiz - map().toList() ─────────────────────────────────────────────

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
                'What does this expression output?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(height: 28),
            AnimatedFadeUp(
              delay: 350,
              child: SizedBox(
                width: 600,
                child: CodeDisplay(
                  code: '''print([1, 2, 3].map((e) => e * 2).toList());''',
                  fontSize: 18,
                ),
              ),
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
                child: SizedBox(
                  width: 680,
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withAlpha(15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.greenAccent.withAlpha(100)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.greenAccent, size: 40),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('[2, 4, 6]',
                                  style: TextStyle(color: Colors.greenAccent, fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'monospace')),
                              const SizedBox(height: 8),
                              Text(
                                '.map() applies the lambda (e) => e * 2 to each element: 1→2, 2→4, 3→6.\n\n.map() returns a lazy Iterable - calling .toList() materializes it into a concrete List<int>.',
                                style: TextStyle(color: Colors.white.withAlpha(180), fontSize: 15, height: 1.6),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
