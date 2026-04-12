import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide06Operators extends StatelessWidget {
  const Slide06Operators({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Operators & Exceptions',
      subtitle: 'Precedence, error handling, and Dart-unique operators.',
      childrenSlides: [
        _PrecedenceFrame(),
        _ExceptionFrame(),
        _CodeExampleFrame(),
      ],
    );
  }
}

// ── Frame 1: Operator Precedence ───────────────────────────────────────────────

class _PrecedenceFrame extends StatelessWidget {
  const _PrecedenceFrame();

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
                  child: const Text('OPERATOR PRECEDENCE',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Follows standard C and Java rules.',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800, height: 1.2),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _PrecTable(),
                ),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 600,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.dartBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.dartBlue.withAlpha(50)),
                    ),
                    child: const Text(
                      'Dart also includes unique operators:\n  ??  (null-coalescing)\n  ??=  (null-aware assignment)\n  ?.  (null-safe method call)\n  ~/ (integer division)',
                      style: TextStyle(color: Colors.white70, fontSize: 14, fontFamily: 'monospace', height: 1.7),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 5,
            child: AnimatedFadeUp(
              delay: 300,
              child: CodeDisplay(
                fontSize: 14,
                code: '''int result = 2 + 3 * 4;   // 14, not 20
int quot = 10 ~/ 3;       // 3 (integer division)

String? name = null;
String s = name ?? 'Anonymous'; // null-coalescing
name ??= 'Default';             // null-aware assign
int? len = name?.length;        // null-safe call

List<int> nums = []
  ..add(1)..add(2)..add(3); // cascade''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrecTable extends StatelessWidget {
  const _PrecTable();

  final _rows = const [
    ('Highest', 'Unary', '!, ~, ++, --', Colors.amberAccent),
    ('↓', 'Multiplicative', '*, /, ~/, %', Colors.orangeAccent),
    ('↓', 'Additive', '+, -', AppColors.dartCyan),
    ('↓', 'Relational', '<, >, <=, >=', Colors.purpleAccent),
    ('↓', 'Equality', '==, !=', Colors.greenAccent),
    ('Lowest', 'Logical', '&&, ||', const Color(0xFFFF6B6B)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _rows.map((r) => Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: r.$4.withAlpha(15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: r.$4.withAlpha(40)),
        ),
        child: Row(
          children: [
            SizedBox(width: 64,
                child: Text(r.$1, style: TextStyle(color: r.$4, fontSize: 12, fontWeight: FontWeight.bold))),
            SizedBox(width: 120,
                child: Text(r.$2, style: const TextStyle(color: Colors.white, fontSize: 13))),
            Text(r.$3, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, fontFamily: 'monospace')),
          ],
        ),
      )).toList(),
    );
  }
}

// ── Frame 2: Exception Handling ────────────────────────────────────────────────

class _ExceptionFrame extends StatelessWidget {
  const _ExceptionFrame();

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
                  child: const Text('EXCEPTION HANDLING',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'try / catch / finally blocks gracefully handle runtime errors.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _ExBlock(
                  'try { }',
                  Colors.greenAccent,
                  'Contains code that might throw an exception.',
                )),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 550, child: _ExBlock(
                  'on ExType catch (e, s) { }',
                  Colors.orangeAccent,
                  'Catches specific exception types. s is the StackTrace.',
                )),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 700, child: _ExBlock(
                  'catch (e) { }',
                  Colors.purpleAccent,
                  'Catches any exception. Use for broad fallback handling.',
                )),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 850, child: _ExBlock(
                  'finally { }',
                  AppColors.dartCyan,
                  'Always runs - whether or not an exception was thrown. Great for cleanup.',
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
                code: '''try {
  int result = riskyOperation();
  print(result);
} on FormatException catch (e) {
  print('Format error: \${e.message}');
} catch (e) {
  print('Unexpected: \$e');
} finally {
  print('Always runs.');
}

void validate(int age) {
  if (age < 0) throw ArgumentError('Age negative');
}''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExBlock extends StatelessWidget {
  final String keyword;
  final Color color;
  final String desc;
  const _ExBlock(this.keyword, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: color.withAlpha(25),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(keyword, style: TextStyle(color: color, fontSize: 12, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4))),
      ],
    );
  }
}

// ── Frame 3: Code Example - Integer Division by Zero ──────────────────────────

class _CodeExampleFrame extends StatelessWidget {
  const _CodeExampleFrame();

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
                code: '''void safeDivide(int a, int b) {
  try {
    print(a ~/ b);      // ~/ = integer division
  } on IntegerDivisionByZeroException {
    print('Cannot divide by zero!');
  } finally {
    print('Attempted.');
  }
}

void main() {
  safeDivide(10, 3); // 3
  safeDivide(10, 0); // Cannot divide by zero!
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
                    'Catching integer division by zero.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _NoteBox(
                    '~/ Operator',
                    AppColors.dartCyan,
                    'Dart uses ~/ (tilde-slash) for integer division. Regular / always returns a double.',
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(
                  delay: 550,
                  child: _NoteBox(
                    'Typed catch',
                    Colors.orangeAccent,
                    'Catching on IntegerDivisionByZeroException handles only that specific error - other exceptions will propagate.',
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(
                  delay: 700,
                  child: _NoteBox(
                    'finally always runs',
                    Colors.greenAccent,
                    'The finally block executes whether the division succeeded or threw - ideal for cleanup.',
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

class _NoteBox extends StatelessWidget {
  final String title;
  final Color color;
  final String body;
  const _NoteBox(this.title, this.color, this.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(body, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.5)),
        ],
      ),
    );
  }
}
