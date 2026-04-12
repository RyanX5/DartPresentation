import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide07TypeSystem extends StatelessWidget {
  const Slide07TypeSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'The Type System',
      subtitle: 'Static typing with the feel of dynamic.',
      childrenSlides: [
        _InferenceFrame(),
        _NullSafetyFrame(),
        _ComparisonFrame(),
      ],
    );
  }
}

// ── Frame 1: Type Inference ────────────────────────────────────────────────────

class _InferenceFrame extends StatelessWidget {
  const _InferenceFrame();

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
                  child: const Text('STATIC TYPING + INFERENCE',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Dart is statically typed — but uses type inference to feel dynamic.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _TypeCard('var', AppColors.dartBlue,
                      'Infer once, then fixed',
                      'var x = 42 — Dart infers int. You can reassign with another int, but not a String.'),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 550,
                  child: _TypeCard('final', Colors.orangeAccent,
                      'Single-assignment',
                      'final x = 42 — Assigned once, cannot be changed. Type is inferred.'),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 700,
                  child: _TypeCard('const', Colors.purpleAccent,
                      'Compile-time constant',
                      'const x = 42 — Value must be known at compile time. Deeply immutable.'),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 850,
                  child: _TypeCard('dynamic', const Color(0xFFFF6B6B),
                      'Escape hatch — avoid',
                      'dynamic x = 42 — Opts out of type checking. Use sparingly; like Python\'s duck typing.'),
                ),
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
                code: '''// Explicit type annotation
int count = 0;
String name = 'Dart';

// Type inference with var
var count2 = 0;       // inferred: int
var name2 = 'Dart';   // inferred: String

// count2 = 'hello';  // ERROR: type mismatch

// final — set once, then immutable
final pi = 3.14159;
// pi = 3.0;  // ERROR: final variable

// const — compile-time constant
const maxRetries = 3;

// dynamic — escape hatch (avoid!)
dynamic anything = 42;
anything = 'now a string'; // works, but risky

// Explicit type is always allowed
List<String> names = ['Alice', 'Bob'];
Map<String, int> scores = {'Alice': 95};''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeCard extends StatelessWidget {
  final String keyword;
  final Color color;
  final String title;
  final String desc;
  const _TypeCard(this.keyword, this.color, this.title, this.desc);

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
          child: Text(keyword,
              style: TextStyle(color: color, fontSize: 14, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold)),
              Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Frame 2: Sound Null Safety ─────────────────────────────────────────────────

class _NullSafetyFrame extends StatelessWidget {
  const _NullSafetyFrame();

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
                code: '''// Non-nullable by default (Dart 3)
String name = 'Alice';
// name = null;  // COMPILE ERROR

// Nullable with ?
String? maybeNull = null;  // OK

// Null-safe access
int? length = maybeNull?.length; // null, no crash

// Null assertion (throws if null at runtime)
int len = maybeNull!.length; // throws if null

// Null-coalescing: provide a default
String display = maybeNull ?? 'Anonymous';

// Null-aware assignment
maybeNull ??= 'Default'; // sets only if null

// Late initialization
late String lazyName; // declared but not yet set
lazyName = 'Bob';     // set before first use

// If check — promotes to non-nullable
if (maybeNull != null) {
  print(maybeNull.length); // safe — promoted!
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
                  child: const Text('SOUND NULL SAFETY',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Variables cannot hold null unless you explicitly say so.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _NullBox('T (non-nullable)', Colors.greenAccent, 'Never null. Dart guarantees this at compile time.'),
                ),
                const SizedBox(height: 12),
                AnimatedFadeUp(
                  delay: 500,
                  child: _NullBox('T? (nullable)', Colors.orangeAccent, 'May be null. You must check before using.'),
                ),
                const SizedBox(height: 12),
                AnimatedFadeUp(
                  delay: 600,
                  child: _NullBox('T! (assertion)', const Color(0xFFFF6B6B), 'Force unwrap — crashes if null. Use sparingly.'),
                ),
                const SizedBox(height: 12),
                AnimatedFadeUp(
                  delay: 700,
                  child: _NullBox('late T', AppColors.dartBlue, 'Non-nullable but assigned later. Throws if read before init.'),
                ),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 850,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withAlpha(15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.greenAccent.withAlpha(50)),
                    ),
                    child: const Text(
                      '"Sound" null safety means the Dart compiler guarantees that if a variable is non-nullable, it will NEVER be null — no exceptions, no loopholes.',
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

class _NullBox extends StatelessWidget {
  final String type;
  final Color color;
  final String desc;
  const _NullBox(this.type, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Row(
        children: [
          Text(type, style: TextStyle(color: color, fontSize: 14, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
          const SizedBox(width: 12),
          Expanded(child: Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13))),
        ],
      ),
    );
  }
}

// ── Frame 3: Three-Way Language Comparison ─────────────────────────────────────

class _ComparisonFrame extends StatelessWidget {
  const _ComparisonFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('PYTHON vs JAVA vs DART',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'How do they handle types and null?',
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: AnimatedFadeUp(delay: 300, child: _LangComparePanel(
                  lang: 'Python',
                  color: Colors.yellowAccent,
                  rows: [
                    ('Typing', 'Dynamic — types known at runtime'),
                    ('Null equivalent', 'None — no compile-time check'),
                    ('Type errors', 'Surface at runtime, often in prod'),
                    ('Annotation', 'Optional hints (PEP 484), not enforced'),
                    ('Null crash', 'AttributeError when accessing None'),
                  ],
                ))),
                const SizedBox(width: 16),
                Expanded(child: AnimatedFadeUp(delay: 450, child: _LangComparePanel(
                  lang: 'Java',
                  color: Colors.orangeAccent,
                  rows: [
                    ('Typing', 'Static — types at compile time'),
                    ('Null equivalent', 'null — any reference can be null'),
                    ('Type errors', 'Caught at compile time'),
                    ('Annotation', '@Nullable / @NonNull (optional)'),
                    ('Null crash', 'NullPointerException at runtime'),
                  ],
                ))),
                const SizedBox(width: 16),
                Expanded(child: AnimatedFadeUp(delay: 600, child: _LangComparePanel(
                  lang: 'Dart',
                  color: AppColors.dartCyan,
                  rows: [
                    ('Typing', 'Static — inferred or explicit'),
                    ('Null equivalent', 'T? — only when you opt in'),
                    ('Type errors', 'Caught at compile time'),
                    ('Annotation', 'Built-in — T vs T? in the type'),
                    ('Null crash', 'Prevented at compile time ✓'),
                  ],
                ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LangComparePanel extends StatelessWidget {
  final String lang;
  final Color color;
  final List<(String, String)> rows;
  const _LangComparePanel({required this.lang, required this.color, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha(10),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withAlpha(55)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            ),
            child: Center(
              child: Text(lang, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          ...rows.map((r) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: color.withAlpha(20))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(r.$1, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
                const SizedBox(height: 4),
                Text(r.$2, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.3)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
