import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide14Inheritance extends StatelessWidget {
  const Slide14Inheritance({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Inheritance & Mixins',
      subtitle: 'Single inheritance, extended with Mixins.',
      childrenSlides: [
        _InheritanceFrame(),
        _MixinsFrame(),
        _QuizFrame(),
      ],
    );
  }
}

// ── Frame 1: Single Inheritance ────────────────────────────────────────────────

class _InheritanceFrame extends StatelessWidget {
  const _InheritanceFrame();

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
                  child: const Text('SINGLE INHERITANCE',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Dart uses a single inheritance model via the extends keyword.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _InhPoint(Icons.account_tree, AppColors.dartBlue,
                    'extends', 'A class can extend exactly one parent class - the same model as Java.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 550, child: _InhPoint(Icons.upgrade, Colors.orangeAccent,
                    'Method overriding', 'Use @override annotation to replace a parent method. Dart enforces this annotation exists.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 700, child: _InhPoint(Icons.call_made, Colors.greenAccent,
                    'super keyword', 'Call the parent class constructor or method: super() or super.methodName().')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 850, child: _InhPoint(Icons.lock_outline, Colors.purpleAccent,
                    'abstract classes', 'Define a class with abstract to prevent instantiation and force subclasses to implement methods.')),
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
                code: '''abstract class Animal {
  String name;
  Animal(this.name);
  String speak(); // must override
  void describe() => print('\$name: \${speak()}');
}

class Dog extends Animal {
  Dog(super.name);
  @override String speak() => 'Woof!';
}

class Cat extends Animal {
  Cat(super.name);
  @override String speak() => 'Meow!';
}

[Dog('Rex'), Cat('Whiskers')].forEach((a) => a.describe());''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InhPoint extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _InhPoint(this.icon, this.color, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withAlpha(25),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: color.withAlpha(70)),
          ),
          child: Text(title, style: TextStyle(color: color, fontSize: 12, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4))),
      ],
    );
  }
}

// ── Frame 2: Mixins ────────────────────────────────────────────────────────────

class _MixinsFrame extends StatelessWidget {
  const _MixinsFrame();

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
                code: '''mixin Flyable { void fly() => print('\$runtimeType flying'); }
mixin Swimmable { void swim() => print('\$runtimeType swimming'); }

class Animal { String name; Animal(this.name); }

class Duck extends Animal with Flyable, Swimmable {
  Duck(super.name);
}

class Penguin extends Animal with Swimmable {
  Penguin(super.name);
  // fly() not available - compile error if called
}

Duck('Donald')..fly()..swim();
Penguin('Tux').swim();''',
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
                  child: const Text('MIXINS',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Reuse behavior across class hierarchies - without multiple inheritance.',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.dartBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.dartBlue.withAlpha(60)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Why mixins?', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(
                          'The Diamond Problem: if A and B both define speak(), and C extends both - whose speak() does C use?\n\nDart\'s answer: don\'t allow it. Use mixins for horizontal code reuse instead.',
                          style: TextStyle(color: Colors.white.withAlpha(160), fontSize: 13, height: 1.6),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(
                  delay: 600,
                  child: _MixRule('mixin Flyable', AppColors.dartBlue, 'Declared with mixin. Cannot be instantiated.'),
                ),
                const SizedBox(height: 10),
                AnimatedFadeUp(
                  delay: 700,
                  child: _MixRule('with Flyable, Runnable', Colors.orangeAccent, 'Apply multiple mixins - composing behaviors.'),
                ),
                const SizedBox(height: 10),
                AnimatedFadeUp(
                  delay: 800,
                  child: _MixRule('on Animal', Colors.greenAccent, 'Optional: restrict which classes can use the mixin.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MixRule extends StatelessWidget {
  final String syntax;
  final Color color;
  final String desc;
  const _MixRule(this.syntax, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(color: color.withAlpha(25), borderRadius: BorderRadius.circular(6)),
          child: Text(syntax, style: TextStyle(color: color, fontSize: 11, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 10),
        Expanded(child: Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13))),
      ],
    );
  }
}

// ── Frame 3: Quiz - Two Base Classes ──────────────────────────────────────────

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
                'Can a Dart class inherit\nfrom two different base classes?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800, height: 1.2),
              ),
            ),
            const SizedBox(height: 28),
            AnimatedFadeUp(
              delay: 350,
              child: SizedBox(
                width: 560,
                child: CodeDisplay(
                  code: '''// Is this valid Dart?
class C extends A, B {
  // ...
}''',
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
                  width: 720,
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.withAlpha(15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.orangeAccent.withAlpha(100)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.close_rounded, color: Colors.orangeAccent, size: 40),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('No - single inheritance only!',
                                  style: TextStyle(color: Colors.orangeAccent, fontSize: 22, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Text(
                                'A Dart class can only extend one base class. However, it CAN apply multiple mixins with the with keyword - pulling in behavior from many sources.\n\nclass C extends A with BehaviorMixin, AnotherMixin { }',
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
