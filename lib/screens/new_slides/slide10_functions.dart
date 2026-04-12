import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide10Functions extends StatelessWidget {
  const Slide10Functions({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Functions & Parameters',
      subtitle: 'How Dart passes data and handles subroutines.',
      childrenSlides: [
        _PassingFrame(),
        _ParamsFrame(),
        _ComparisonFrame(),
      ],
    );
  }
}

// ── Frame 1: Parameter Passing ─────────────────────────────────────────────────

class _PassingFrame extends StatelessWidget {
  const _PassingFrame();

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
                  child: const Text('PARAMETER PASSING',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Dart passes object references by value.',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800, height: 1.2),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.dartBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.dartBlue.withAlpha(60)),
                    ),
                    child: const Text(
                      'What this means:\n\n• For primitives (int, double, bool): a copy of the value is passed. Changes inside the function do NOT affect the caller.\n\n• For objects and collections: a copy of the reference is passed. The function and caller point to the SAME object, so mutating it DOES affect the caller.',
                      style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.7),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(
                  delay: 600,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withAlpha(15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.greenAccent.withAlpha(50)),
                    ),
                    child: const Text(
                      'This is the same model used by Java and Python - not pure pass-by-value (C) or pure pass-by-reference (C++).',
                      style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.5),
                    ),
                  ),
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
                code: '''// Primitives: copied
void increment(int x) { x += 1; }
int n = 5;
increment(n);
print(n); // 5 - unchanged

// Objects: reference shared
class Counter { int value = 0; }
void addTen(Counter c) { c.value += 10; }

var c = Counter();
addTen(c);
print(c.value); // 10 - mutated''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Frame 2: Named & Optional Parameters ──────────────────────────────────────

class _ParamsFrame extends StatelessWidget {
  const _ParamsFrame();

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
                code: '''// Named parameters {}
void createUser({required String name, int age = 18, String? email}) {
  print('\$name, \$age, \${email ?? "no email"}');
}
createUser(name: 'Alice', age: 25);
createUser(name: 'Bob'); // age = 18

// Optional positional []
String greet(String name, [String? title]) =>
    title != null ? '\$title \$name' : name;

print(greet('Alice'));        // Alice
print(greet('Alice', 'Dr.')); // Dr. Alice''',
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
                  child: const Text('FLEXIBLE PARAMETERS',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Dart builds optional and named params directly into the language.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _ParamBox('{ required T param }', AppColors.dartBlue,
                    'Named required', 'Must be passed by name. Order doesn\'t matter at the call site.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 550, child: _ParamBox('{ T param = default }', Colors.greenAccent,
                    'Named with default', 'Optional - uses default if not provided.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 700, child: _ParamBox('[ T? param ]', Colors.orangeAccent,
                    'Optional positional', 'Provided by position but not required. Null if omitted.')),
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
                      'In Flutter, virtually every Widget uses named parameters - that\'s why Dart\'s named param syntax is so central to the ecosystem.',
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

class _ParamBox extends StatelessWidget {
  final String syntax;
  final Color color;
  final String label;
  final String desc;
  const _ParamBox(this.syntax, this.color, this.label, this.desc);

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
          Text(label, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold)),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, height: 1.4)),
        ],
      ),
    );
  }
}

// ── Frame 3: Java Comparison ───────────────────────────────────────────────────

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
            child: const Text('JAVA COMPARISON',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Java requires method overloading for optional params. Dart builds it in.',
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
                    child: _LangBlock(
                      lang: 'Java',
                      color: Colors.orangeAccent,
                      code: '''// Java: overload for each combo
void connect(String host) { connect(host, 80); }
void connect(String host, int port) {
    connect(host, port, false);
}
void connect(String host, int port, boolean ssl) {
    // implementation
}
connect("example.com");
connect("example.com", 443, true);''',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnimatedFadeUp(
                    delay: 480,
                    child: _LangBlock(
                      lang: 'Python',
                      color: Colors.yellowAccent,
                      code: '''# Python: default values inline
def connect(host, port=80, ssl=False):
    # actual implementation
    pass

# Caller - very flexible
connect("example.com")
connect("example.com", 443)
connect("example.com", ssl=True)
connect(host="example.com",
        port=443, ssl=True)''',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AnimatedFadeUp(
                    delay: 660,
                    child: _LangBlock(
                      lang: 'Dart',
                      color: AppColors.dartCyan,
                      code: '''// Dart: named params with defaults
void connect(
  String host, {
  int port = 80,
  bool ssl = false,
}) {
  // actual implementation
}

// Caller - flexible, self-documenting
connect('example.com');
connect('example.com', port: 443);
connect('example.com',
        port: 443, ssl: true);''',
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

class _LangBlock extends StatelessWidget {
  final String lang;
  final Color color;
  final String code;
  const _LangBlock({required this.lang, required this.color, required this.code});

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
        Expanded(child: CodeDisplay(code: code, fontSize: 12)),
      ],
    );
  }
}
