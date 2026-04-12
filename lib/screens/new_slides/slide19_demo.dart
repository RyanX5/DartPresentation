import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/dartpad/dartpad_embed.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide19Demo extends StatelessWidget {
  const Slide19Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Live Demo',
      subtitle: 'Dart in action - on DartPad.',
      childrenSlides: [
        _SetupFrame(),
        _HelloWorldFrame(),
        _FibonacciFrame(),
      ],
    );
  }
}

// ── Frame 1: Setup / DartPad ────────────────────────────────────────────────────

class _SetupFrame extends StatelessWidget {
  const _SetupFrame();

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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.dartBlue.withAlpha(30),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.dartCyan.withAlpha(80)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.terminal, color: AppColors.dartCyan, size: 18),
                    SizedBox(width: 10),
                    Text('LIVE DEMO', style: TextStyle(color: AppColors.dartCyan, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            AnimatedFadeUp(
              delay: 250,
              child: const Text(
                'We\'re switching over to DartPad.',
                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 16),
            AnimatedFadeUp(
              delay: 400,
              child: Text(
                'dartpad.dev - a browser-based Dart & Flutter IDE',
                style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 22),
              ),
            ),
            const SizedBox(height: 56),
            AnimatedFadeUp(
              delay: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _DemoCard(Icons.code, AppColors.dartBlue, 'Basic Syntax', 'Hello World and core patterns'),
                  const SizedBox(width: 24),
                  _DemoCard(Icons.construction, Colors.orangeAccent, 'Classes', 'Dart constructor shorthand'),
                  const SizedBox(width: 24),
                  _DemoCard(Icons.functions, Colors.greenAccent, 'Algorithm', 'Fibonacci sequence'),
                ],
              ),
            ),
            const SizedBox(height: 48),
            AnimatedFadeUp(
              delay: 900,
              child: Text(
                'No install required. Runs entirely in the browser.',
                style: TextStyle(color: Colors.white.withAlpha(80), fontSize: 16, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DemoCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _DemoCard(this.icon, this.color, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 36),
          const SizedBox(height: 16),
          Text(title, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(desc, textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}

// ── Frame 2: Hello World (live DartPad) ─────────────────────────────────────────

class _HelloWorldFrame extends StatelessWidget {
  const _HelloWorldFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: AnimatedFadeUp(
              delay: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const DartpadEmbed(
                  embedUrl: 'https://dartpad.dev/embed-dart.html?theme=dark&run=true',
                ),
              ),
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeUp(
                  delay: 100,
                  child: const Text('THE BASICS',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Hello World - showcasing core Dart features.',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _Point(AppColors.dartBlue, 'Type inference', 'var name = \'Dart\' infers String.')),
                const SizedBox(height: 12),
                AnimatedFadeUp(delay: 500, child: _Point(Colors.orangeAccent, 'Interpolation', '\$name and \${expr} inline values in strings.')),
                const SizedBox(height: 12),
                AnimatedFadeUp(delay: 600, child: _Point(Colors.greenAccent, 'for-in loop', 'Iterate over any Iterable cleanly.')),
                const SizedBox(height: 12),
                AnimatedFadeUp(delay: 700, child: _Point(Colors.purpleAccent, 'Null coalescing', '?? provides a fallback for null values.')),
                const SizedBox(height: 12),
                AnimatedFadeUp(delay: 800, child: _Point(AppColors.dartCyan, 'Named params', 'greeting: \'Hello\' - self-documenting calls.')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Point extends StatelessWidget {
  final Color color;
  final String title;
  final String desc;
  const _Point(this.color, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.circle, color: color, size: 8),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(text: '$title: ', style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold)),
                TextSpan(text: desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Frame 3: Fibonacci (live DartPad) ──────────────────────────────────────────

class _FibonacciFrame extends StatelessWidget {
  const _FibonacciFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: AnimatedFadeUp(
              delay: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const DartpadEmbed(
                  embedUrl: 'https://dartpad.dev/embed-dart.html?theme=dark',
                ),
              ),
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeUp(
                  delay: 100,
                  child: const Text('FIBONACCI',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'A single program showing everything we covered.',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 350, child: _FibPoint(AppColors.dartBlue,
                    'Class with constructor shorthand (this.limit)')),
                const SizedBox(height: 10),
                AnimatedFadeUp(delay: 450, child: _FibPoint(Colors.orangeAccent,
                    'sync* generator producing Fibonacci lazily')),
                const SizedBox(height: 10),
                AnimatedFadeUp(delay: 550, child: _FibPoint(Colors.greenAccent,
                    'Getter (sum) as a computed property')),
                const SizedBox(height: 10),
                AnimatedFadeUp(delay: 650, child: _FibPoint(Colors.purpleAccent,
                    'Static factory constructor')),
                const SizedBox(height: 10),
                AnimatedFadeUp(delay: 750, child: _FibPoint(AppColors.dartCyan,
                    '.map() and .reduce() on an Iterable')),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 900,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.dartBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.dartBlue.withAlpha(50)),
                    ),
                    child: const Text(
                      'Output: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34\nSum: 88',
                      style: TextStyle(color: Colors.greenAccent, fontSize: 14, fontFamily: 'monospace', height: 1.5),
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

class _FibPoint extends StatelessWidget {
  final Color color;
  final String text;
  const _FibPoint(this.color, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.arrow_right, color: color, size: 20),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: TextStyle(color: color.withAlpha(200), fontSize: 14, height: 1.4))),
      ],
    );
  }
}
