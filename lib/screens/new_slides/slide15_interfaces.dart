import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide15Interfaces extends StatelessWidget {
  const Slide15Interfaces({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Interfaces & Polymorphism',
      subtitle: 'How Dart achieves interface contracts.',
      childrenSlides: [
        _OverrideFrame(),
        _ImplicitInterfaceFrame(),
        _JavaCompareFrame(),
      ],
    );
  }
}

// ── Frame 1: @override & Polymorphism ─────────────────────────────────────────

class _OverrideFrame extends StatelessWidget {
  const _OverrideFrame();

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
                  child: const Text('POLYMORPHISM',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Objects of different types respond to the same message differently.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _PolyCard(
                    icon: Icons.swap_vert,
                    color: AppColors.dartBlue,
                    title: '@override annotation',
                    desc: 'Signals that this method intentionally replaces the parent\'s version. Dart will produce a warning if you override without it.',
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 550,
                  child: _PolyCard(
                    icon: Icons.dynamic_form,
                    color: Colors.orangeAccent,
                    title: 'Dynamic dispatch',
                    desc: 'When calling a method through a base class reference, Dart calls the most-derived override at runtime.',
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 700,
                  child: _PolyCard(
                    icon: Icons.verified,
                    color: Colors.greenAccent,
                    title: 'Type checking with is',
                    desc: 'Use obj is MyClass to check the runtime type. Dart automatically promotes the type in the if block.',
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
                code: '''abstract class Shape {
  double area(); // abstract method
  void describe() => print('Area: \${area()}');
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);

  @override
  double area() => 3.14159 * radius * radius;
}

class Rectangle extends Shape {
  final double width, height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;
}

class Triangle extends Shape {
  final double base, height;
  Triangle(this.base, this.height);

  @override
  double area() => 0.5 * base * height;
}

void main() {
  // List of different shapes — polymorphic!
  List<Shape> shapes = [
    Circle(5),
    Rectangle(4, 6),
    Triangle(3, 8),
  ];

  // Same method call, different behavior
  for (var shape in shapes) {
    shape.describe(); // dynamic dispatch
    if (shape is Circle) {
      print('Radius: \${shape.radius}'); // promoted!
    }
  }
}''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PolyCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _PolyCard({required this.icon, required this.color, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Frame 2: Implicit Interfaces ───────────────────────────────────────────────

class _ImplicitInterfaceFrame extends StatelessWidget {
  const _ImplicitInterfaceFrame();

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
                fontSize: 13,
                code: '''// In Dart, there is no "interface" keyword.
// Every class implicitly defines an interface.

class Logger {
  // These become the "interface contract"
  void log(String message) =>
      print('[LOG] \$message');

  void error(String message) =>
      print('[ERROR] \$message');
}

// "implements" uses the interface, not the implementation
// You MUST provide all methods — no inheritance here
class ConsoleLogger implements Logger {
  @override
  void log(String message) =>
      print('[CONSOLE] \$message');

  @override
  void error(String message) =>
      print('[CONSOLE ERROR] \$message');
}

class FileLogger implements Logger {
  @override
  void log(String message) =>
      writeToFile('[FILE] \$message');

  @override
  void error(String message) =>
      writeToFile('[FILE ERROR] \$message');

  void writeToFile(String msg) { /* ... */ }
}

// A class can implement multiple interfaces
class AuditLogger implements Logger, Serializable {
  @override void log(String msg) { /* ... */ }
  @override void error(String msg) { /* ... */ }
  @override String serialize() => '{"type":"audit"}';
}

// Dependency injection via interface type
void runApp(Logger logger) {
  logger.log('App started');
}

runApp(ConsoleLogger()); // or FileLogger()''',
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
                  child: const Text('IMPLICIT INTERFACES',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'No interface keyword. Every class IS an interface.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _IntBox(Icons.layers, AppColors.dartBlue,
                      'extends → inheritance', 'Gets the parent\'s implementation. Method can optionally be overridden.'),
                ),
                const SizedBox(height: 14),
                AnimatedFadeUp(
                  delay: 550,
                  child: _IntBox(Icons.handshake_outlined, Colors.orangeAccent,
                      'implements → contract only', 'Must provide ALL methods yourself. No implementation is inherited.'),
                ),
                const SizedBox(height: 14),
                AnimatedFadeUp(
                  delay: 700,
                  child: _IntBox(Icons.add_box, Colors.greenAccent,
                      'Implement multiple', 'A class can implements A, B, C — limited only by consistency.'),
                ),
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
                      'This is powerful for dependency injection and testing — you can swap implementations without changing the consuming code.',
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

class _IntBox extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _IntBox(this.icon, this.color, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 14),
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

// ── Frame 3: Java Interface Comparison ────────────────────────────────────────

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
              'Java needs an explicit interface keyword. Dart doesn\'t.',
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
                      code: '''// Must declare interface explicitly
public interface Drawable {
    void draw();
    int getArea();
}

// A separate "interface" file exists
// in the project for each contract

// Implement it
public class Square implements Drawable {
    private int side;
    public Square(int side) {
        this.side = side;
    }

    @Override
    public void draw() { /* ... */ }

    @Override
    public int getArea() {
        return side * side;
    }
}''',
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
                      code: '''// Just write a regular class
// It automatically IS an interface
class Drawable {
  void draw() {}
  int getArea() => 0;
}

// Use "implements" to adopt the contract
// without inheriting the implementation
class Square implements Drawable {
  final int side;
  Square(this.side);

  @override
  void draw() { /* ... */ }

  @override
  int getArea() => side * side;
}

// Square "is-a" Drawable
Drawable d = Square(5);
print(d.getArea()); // 25''',
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
                'In Dart, the same class can be used as both a concrete implementation (via extends) AND as an interface contract (via implements) — a level of flexibility Java doesn\'t have.',
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
