import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide04Conditionals extends StatelessWidget {
  const Slide04Conditionals({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Conditionals & Selection',
      subtitle: 'Controlling the flow of execution.',
      childrenSlides: [
        _IfElseFrame(),
        _SwitchFrame(),
        _ComparisonFrame(),
      ],
    );
  }
}

// ── Frame 1: if / else ─────────────────────────────────────────────────────────

class _IfElseFrame extends StatelessWidget {
  const _IfElseFrame();

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
                  child: const Text('IF / ELSE',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Dart\'s if/else is identical to Java and C — familiar and predictable.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _InfoPoint(Icons.check_circle_outline, Colors.greenAccent,
                      'Strict boolean required', 'The condition must evaluate to true or false — no truthy/falsy conversions.'),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 550,
                  child: _InfoPoint(Icons.code, AppColors.dartCyan,
                      'C-style braces', 'Blocks are always delimited with {}, even for single-line bodies (best practice).'),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 700,
                  child: _InfoPoint(Icons.merge_type, Colors.purpleAccent,
                      'Ternary support', 'Dart supports the ternary operator: condition ? valueIfTrue : valueIfFalse.'),
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
                fontSize: 15,
                code: '''void checkTemperature(int temp) {
  if (temp > 100) {
    print('Boiling!');
  } else if (temp > 37) {
    print('Warm');
  } else if (temp > 0) {
    print('Cool');
  } else {
    print('Freezing!');
  }
}

// Ternary operator
String status = temp > 37 ? 'Hot' : 'Cold';''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _InfoPoint(IconData icon, Color color, String title, String desc) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, color: color, size: 20),
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

// ── Frame 2: switch / case ─────────────────────────────────────────────────────

class _SwitchFrame extends StatelessWidget {
  const _SwitchFrame();

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
                code: '''String getDayType(String day) {
  switch (day) {
    case 'Monday':
    case 'Tuesday':
    case 'Wednesday':
    case 'Thursday':
    case 'Friday':
      return 'Weekday';
    case 'Saturday':
    case 'Sunday':
      return 'Weekend';
    default:
      return 'Unknown';
  }
}

// Dart 3: Enhanced switch expression
String type = switch (day) {
  'Saturday' || 'Sunday' => 'Weekend',
  _ => 'Weekday',
};''',
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
                  child: const Text('SWITCH / CASE',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Switch/case for multi-branch selection on a single value.',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _InfoPoint(Icons.merge, Colors.orangeAccent,
                      'Fall-through via stacking', 'Cases without a body fall through to the next, enabling OR-style grouping.'),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 550,
                  child: _InfoPoint(Icons.auto_awesome, AppColors.dartCyan,
                      'Dart 3: Switch expressions', 'The new switch expression syntax is concise and returns a value directly — no need for break.'),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 700,
                  child: _InfoPoint(Icons.pattern, Colors.greenAccent,
                      'Pattern matching', 'Dart 3 switch works with destructuring patterns, records, and sealed classes.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Frame 3: Python vs Dart Comparison ────────────────────────────────────────

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
            child: const Text('JAVA / PYTHON COMPARISON',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Syntax diverges significantly across these three languages.',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AnimatedFadeUp(
                    delay: 300,
                    child: _LangPanel(
                      lang: 'Python',
                      color: Colors.yellowAccent,
                      code: '''temperature = 25

if temperature > 37:
    print("Hot")
elif temperature > 20:
    print("Warm")
else:
    print("Cool")

# Python uses indentation
# and "elif" (not "else if")''',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnimatedFadeUp(
                    delay: 450,
                    child: _LangPanel(
                      lang: 'Java',
                      color: Colors.orangeAccent,
                      code: '''int temperature = 25;

if (temperature > 37) {
    System.out.println("Hot");
} else if (temperature > 20) {
    System.out.println("Warm");
} else {
    System.out.println("Cool");
}

// Java uses braces + else if''',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnimatedFadeUp(
                    delay: 600,
                    child: _LangPanel(
                      lang: 'Dart',
                      color: AppColors.dartCyan,
                      code: '''int temperature = 25;

if (temperature > 37) {
  print('Hot');
} else if (temperature > 20) {
  print('Warm');
} else {
  print('Cool');
}

// Dart: identical to Java/C
// but print() not System.out''',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          AnimatedFadeUp(
            delay: 750,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.dartBlue.withAlpha(25),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.dartBlue.withAlpha(60)),
              ),
              child: const Text(
                'Key Difference: Python uses indentation + elif. Java and Dart use C-style braces + else if. Dart\'s syntax will be instantly familiar to any Java or C++ developer.',
                style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LangPanel extends StatelessWidget {
  final String lang;
  final Color color;
  final String code;
  const _LangPanel({required this.lang, required this.color, required this.code});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: color.withAlpha(30),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withAlpha(80)),
          ),
          child: Text(lang, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        Expanded(child: CodeDisplay(code: code, fontSize: 13)),
      ],
    );
  }
}
