import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide13Classes extends StatelessWidget {
  const Slide13Classes({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Classes & Objects',
      subtitle: 'Dart\'s purely object-oriented model.',
      childrenSlides: [
        _EverythingObjectFrame(),
        _SyntacticSugarFrame(),
        _JavaCompareFrame(),
      ],
    );
  }
}

// ── Frame 1: Everything is an Object ──────────────────────────────────────────

class _EverythingObjectFrame extends StatelessWidget {
  const _EverythingObjectFrame();

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
                  child: const Text('PURE OOP',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Dart is purely object-oriented.\nAbsolutely everything is an object.',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, height: 1.2),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: Text(
                    'Even types you\'d expect to be primitives are full objects with methods and properties:',
                    style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 16, height: 1.5),
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedFadeUp(delay: 500, child: _ObjRow('42', 'int', '.isEven, .abs(), .toString()')),
                AnimatedFadeUp(delay: 600, child: _ObjRow('3.14', 'double', '.ceil(), .floor(), .isNaN')),
                AnimatedFadeUp(delay: 700, child: _ObjRow('"hello"', 'String', '.length, .toUpperCase(), .split()')),
                AnimatedFadeUp(delay: 800, child: _ObjRow('true', 'bool', '.toString() — all objects have this')),
                AnimatedFadeUp(delay: 900, child: _ObjRow('(x) => x', 'Function', '.call(), .toString(), runtimeType')),
                AnimatedFadeUp(delay: 1000, child: _ObjRow('null', 'Null', 'null is an object of type Null')),
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
                code: '''// Everything inherits from Object
int x = 42;
print(x.runtimeType);     // int
print(x is Object);       // true!
print(x.toString());      // "42"

// Integers have methods
print(42.isEven);         // true
print((-7).abs());        // 7
print(255.toRadixString(16)); // ff

// Strings have methods
String s = 'hello dart';
print(s.length);          // 10
print(s.toUpperCase());   // HELLO DART
print(s.contains('dart')); // true
print(s.split(' '));       // [hello, dart]

// Functions are objects too
var fn = (int x) => x * 2;
print(fn.runtimeType);    // (int) => int
print(fn(5));             // 10

// null is an object
print(null.runtimeType);  // Null
print(null is Object?);   // true''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ObjRow extends StatelessWidget {
  final String value;
  final String type;
  final String methods;
  const _ObjRow(this.value, this.type, this.methods);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Row(
        children: [
          SizedBox(width: 70,
              child: Text(value, style: const TextStyle(color: AppColors.dartCyan, fontSize: 14, fontFamily: 'monospace', fontWeight: FontWeight.bold))),
          SizedBox(width: 70,
              child: Text(type, style: const TextStyle(color: Colors.orangeAccent, fontSize: 13, fontFamily: 'monospace'))),
          Expanded(child: Text(methods, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12))),
        ],
      ),
    );
  }
}

// ── Frame 2: Syntactic Sugar — Constructor ─────────────────────────────────────

class _SyntacticSugarFrame extends StatelessWidget {
  const _SyntacticSugarFrame();

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
                code: '''class Point {
  final double x;
  final double y;

  // Initializing formal — this.x auto-assigns
  const Point(this.x, this.y);

  // Named constructor
  Point.origin() : this(0, 0);

  // Named constructor from JSON
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']!;

  // Computed getter
  double get distanceToOrigin =>
      (x * x + y * y);

  @override
  String toString() => 'Point(\$x, \$y)';
}

class Circle extends Point {
  final double radius;

  // Passes x, y to parent constructor
  Circle(super.x, super.y, this.radius);

  double get area => 3.14159 * radius * radius;
}

void main() {
  var p = Point(3.0, 4.0);
  var origin = Point.origin();
  var c = Circle(0, 0, 5);

  print(p);                // Point(3.0, 4.0)
  print(c.area);           // 78.53...
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
                  child: const Text('SYNTACTIC SUGAR',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Dart reduces boilerplate significantly.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _SugarBox('this.x in constructor', AppColors.dartBlue,
                    'Automatically assigns the argument to the field — no manual this.x = x needed.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 550, child: _SugarBox('Named constructors', Colors.orangeAccent,
                    'Multiple factory patterns in one class: Point.origin(), Point.fromJson(), etc.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 700, child: _SugarBox('get (getters)', const Color(0xFF7C4DFF),
                    'Computed properties accessed like fields — no parentheses needed at call site.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 850, child: _SugarBox('super.x shorthand', Colors.greenAccent,
                    'Pass fields to the parent constructor directly — Circle(super.x, super.y, this.radius).')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SugarBox extends StatelessWidget {
  final String feature;
  final Color color;
  final String desc;
  const _SugarBox(this.feature, this.color, this.desc);

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
          Text(feature, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, height: 1.4)),
        ],
      ),
    );
  }
}

// ── Frame 3: Java Comparison — Constructors ────────────────────────────────────

class _JavaCompareFrame extends StatelessWidget {
  const _JavaCompareFrame();

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
              'The same class in Java vs Dart — notice the difference in boilerplate.',
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
                      code: '''class Point {
    private final double x;
    private final double y;

    // Constructor: manual assignment
    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    // Getters: required for encapsulation
    public double getX() { return x; }
    public double getY() { return y; }

    @Override
    public String toString() {
        return "Point(" + x + ", " + y + ")";
    }
}

// Usage
Point p = new Point(3.0, 4.0);
System.out.println(p.getX()); // 3.0''',
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: AnimatedFadeUp(
                    delay: 500,
                    child: _LangBlock(
                      lang: 'Dart',
                      color: AppColors.dartCyan,
                      code: '''class Point {
  final double x;
  final double y;

  // this.x auto-assigns — no body needed
  const Point(this.x, this.y);

  // getter: accessed as property
  double get magnitude => x * x + y * y;

  @override
  String toString() => 'Point(\$x, \$y)';
}

// Usage
var p = Point(3.0, 4.0);
print(p.x);         // 3.0 (direct access)
print(p.magnitude); // 25.0 (no parentheses)
print(p);           // Point(3.0, 4.0)''',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          AnimatedFadeUp(
            delay: 700,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.dartBlue.withAlpha(20),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.dartBlue.withAlpha(50)),
              ),
              child: const Text(
                'Java: 18 lines for the same class. Dart: 11 lines. No getters, no explicit assignments, no new keyword, no semicolons in method calls.',
                style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
              ),
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
