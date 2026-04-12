import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide08Primitives extends StatelessWidget {
  const Slide08Primitives({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Primitives & Composites',
      subtitle: 'Dart\'s built-in data types.',
      childrenSlides: [
        _PrimitivesFrame(),
        _CompositesFrame(),
        _QuizFrame(),
      ],
    );
  }
}

// ── Frame 1: Primitive Types ───────────────────────────────────────────────────

class _PrimitivesFrame extends StatelessWidget {
  const _PrimitivesFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('PRIMITIVE TYPES',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Everything in Dart is an object — even primitives.',
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: AnimatedFadeUp(delay: 300, child: _PrimCard(
                keyword: 'int',
                color: AppColors.dartBlue,
                desc: '64-bit integer on native, limited to 53-bit precision on web (JS).',
                examples: 'int x = 42;\nint hex = 0xFF;\nint big = 1000000;',
                note: 'No int32/int64 distinction — just int.',
              ))),
              const SizedBox(width: 20),
              Expanded(child: AnimatedFadeUp(delay: 450, child: _PrimCard(
                keyword: 'double',
                color: const Color(0xFF7C4DFF),
                desc: '64-bit IEEE 754 floating-point. The only floating-point type.',
                examples: 'double pi = 3.14;\ndouble e = 2.718;\nint/double = double',
                note: 'Dividing two ints with / yields a double.',
              ))),
              const SizedBox(width: 20),
              Expanded(child: AnimatedFadeUp(delay: 600, child: _PrimCard(
                keyword: 'String',
                color: Colors.orangeAccent,
                desc: 'UTF-16 encoded sequence of characters. Immutable.',
                examples: "String s = 'Hi';\nString t = \"World\";\nvar msg = '\$s \$t';",
                note: 'String interpolation with \$ — no concatenation needed.',
              ))),
              const SizedBox(width: 20),
              Expanded(child: AnimatedFadeUp(delay: 750, child: _PrimCard(
                keyword: 'bool',
                color: Colors.greenAccent,
                desc: 'Strictly true or false. No truthy/falsy values.',
                examples: 'bool ok = true;\nbool done = false;\n// 1, 0, null → not bool!',
                note: 'Only ever true or false — unlike JS/Python.',
              ))),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrimCard extends StatelessWidget {
  final String keyword;
  final Color color;
  final String desc;
  final String examples;
  final String note;
  const _PrimCard({required this.keyword, required this.color, required this.desc,
    required this.examples, required this.note});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(keyword,
              style: TextStyle(color: color, fontSize: 26, fontWeight: FontWeight.w900, fontFamily: 'monospace')),
          const SizedBox(height: 10),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(8)),
            child: Text(examples, style: const TextStyle(color: Colors.white70, fontSize: 12, fontFamily: 'monospace', height: 1.5)),
          ),
          const SizedBox(height: 10),
          Text(note, style: TextStyle(color: color.withAlpha(180), fontSize: 12, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}

// ── Frame 2: Composite Types ───────────────────────────────────────────────────

class _CompositesFrame extends StatelessWidget {
  const _CompositesFrame();

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
                code: '''// LIST — ordered, allows duplicates (like array)
List<int> nums = [10, 20, 30];
nums.add(40);
print(nums[0]);    // 10
print(nums.length); // 4

// Spread & collection-if
var bonus = [99];
var all = [...nums, ...bonus]; // [10, 20, 30, 40, 99]

// SET — unordered, unique values
Set<String> tags = {'dart', 'flutter', 'mobile'};
tags.add('dart'); // duplicate — ignored
print(tags.length); // still 3

// MAP — key-value pairs (like Python dict)
Map<String, int> scores = {
  'Alice': 95,
  'Bob': 82,
};
scores['Charlie'] = 78;
print(scores['Alice']);     // 95
print(scores['Unknown']);   // null (key missing)''',
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
                  child: const Text('COMPOSITE TYPES',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Built-in collection types — generic and type-safe.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _CollType('List<T>', AppColors.dartBlue,
                    'Ordered, indexed, allows duplicates. Equivalent to Python list or Java ArrayList.')),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 550, child: _CollType('Set<T>', const Color(0xFF7C4DFF),
                    'Unordered, unique values. Equivalent to Python set or Java HashSet.')),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 700, child: _CollType('Map<K, V>', Colors.orangeAccent,
                    'Key-value pairs. Equivalent to Python dict or Java HashMap.')),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 850,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.dartBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.dartBlue.withAlpha(50)),
                    ),
                    child: const Text(
                      'All collections are generic: List<int> is a different type from List<String>. Dart catches type mismatches at compile time.',
                      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
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

class _CollType extends StatelessWidget {
  final String type;
  final Color color;
  final String desc;
  const _CollType(this.type, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: color.withAlpha(30),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: color.withAlpha(80)),
          ),
          child: Text(type, style: TextStyle(color: color, fontSize: 13, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4))),
      ],
    );
  }
}

// ── Frame 3: Quiz — RangeError ────────────────────────────────────────────────

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
                'What does this print?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(height: 28),
            AnimatedFadeUp(
              delay: 350,
              child: SizedBox(
                width: 560,
                child: CodeDisplay(
                  code: '''List<int> nums = [10, 20];
print(nums[2]);''',
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
                              const Text('RangeError (index out of bounds)!',
                                  style: TextStyle(color: Color(0xFFFF6B6B), fontSize: 20, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Text(
                                'The list has 2 elements at indices 0 and 1. Index 2 does not exist.\n\nDart uses 0-based indexing — just like Java, C, and Python. Accessing an invalid index throws a RangeError at runtime.',
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
