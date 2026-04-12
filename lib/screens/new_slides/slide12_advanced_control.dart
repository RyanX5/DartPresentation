import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide12AdvancedControl extends StatelessWidget {
  const Slide12AdvancedControl({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Advanced Control',
      subtitle: 'Generators, yield, and exception propagation.',
      childrenSlides: [
        _GeneratorsFrame(),
        _YieldFrame(),
        _ExceptionPropFrame(),
      ],
    );
  }
}

// ── Frame 1: Generators ────────────────────────────────────────────────────────

class _GeneratorsFrame extends StatelessWidget {
  const _GeneratorsFrame();

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
                  child: const Text('GENERATORS',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Produce sequences lazily - only computing the next value when requested.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 36),
                AnimatedFadeUp(
                  delay: 400,
                  child: _GenCard(
                    label: 'sync*',
                    color: AppColors.dartBlue,
                    returnType: 'Iterable<T>',
                    desc: 'Synchronous generator. Produces values one at a time using yield. Pauses between yields.',
                    use: 'Infinite sequences, lazy data pipelines, tree traversal.',
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(
                  delay: 600,
                  child: _GenCard(
                    label: 'async*',
                    color: Colors.orangeAccent,
                    returnType: 'Stream<T>',
                    desc: 'Asynchronous generator. Produces values over time using yield. Can await between yields.',
                    use: 'Real-time data, web sockets, event streams.',
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
                code: '''// sync* - returns Iterable (lazy)
Iterable<int> countdown(int n) sync* {
  for (int i = n; i >= 0; i--) yield i;
}
for (var n in countdown(5)) print(n); // 5 4 3 2 1 0

// async* - returns Stream
Stream<String> ticker(int n) async* {
  for (int i = 0; i < n; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield 'Tick \$i';
  }
}
await for (var msg in ticker(3)) print(msg);''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GenCard extends StatelessWidget {
  final String label;
  final Color color;
  final String returnType;
  final String desc;
  final String use;
  const _GenCard({required this.label, required this.color, required this.returnType, required this.desc, required this.use});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label,
                  style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.w900, fontFamily: 'monospace')),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: color.withAlpha(25),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text('returns $returnType',
                    style: TextStyle(color: color.withAlpha(200), fontSize: 12, fontFamily: 'monospace')),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.4)),
          const SizedBox(height: 10),
          Text('Use for: $use', style: TextStyle(color: color.withAlpha(180), fontSize: 12, fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}

// ── Frame 2: yield Keyword ─────────────────────────────────────────────────────

class _YieldFrame extends StatelessWidget {
  const _YieldFrame();

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
                code: '''// yield emits value, then pauses
Iterable<int> range(int s, int e) sync* {
  for (int i = s; i <= e; i++) yield i;
}

// yield* delegates to another generator
Iterable<int> combined() sync* {
  yield* range(1, 3); yield 99;
}
print(combined().toList()); // [1,2,3,99]

// Infinite fib - only computes on demand
Iterable<int> fib() sync* {
  int a = 0, b = 1;
  while (true) { yield a; var t=a+b; a=b; b=t; }
}
print(fib().take(5).toList()); // [0,1,1,2,3]''',
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
                  child: const Text('THE yield KEYWORD',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Emit a value and pause - resume on next request.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _YieldBox('yield value', AppColors.dartBlue,
                    'Emit one value. Function execution pauses until the next value is requested.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 550, child: _YieldBox('yield* iterable', Colors.orangeAccent,
                    'Delegate - emits all values from another generator or iterable, one at a time.')),
                const SizedBox(height: 28),
                AnimatedFadeUp(
                  delay: 700,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.dartBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.dartBlue.withAlpha(50)),
                    ),
                    child: const Text(
                      'Key insight: generators are lazy. An infinite sequence like fibonacci() only computes values as they\'re consumed - it never tries to generate all of them.',
                      style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6),
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

class _YieldBox extends StatelessWidget {
  final String syntax;
  final Color color;
  final String desc;
  const _YieldBox(this.syntax, this.color, this.desc);

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
          Text(syntax, style: TextStyle(color: color, fontSize: 15, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}

// ── Frame 3: Exception Propagation ─────────────────────────────────────────────

class _ExceptionPropFrame extends StatelessWidget {
  const _ExceptionPropFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('EXCEPTION PROPAGATION',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Exceptions bubble up the call stack until caught.',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: AnimatedFadeUp(
                    delay: 300,
                    child: _CallStack(),
                  ),
                ),
                const SizedBox(width: 48),
                Expanded(
                  flex: 6,
                  child: AnimatedFadeUp(
                    delay: 300,
                    child: CodeDisplay(
                      fontSize: 13,
                      code: '''void c() => throw FormatException('bad data');
void b() => c(); // propagates up

void a() {
  try {
    b();
  } on FormatException catch (e, stack) {
    print('Caught: \${e.message}');
  }
}

// Rethrow - log then re-propagate
try {
  b();
} catch (e) {
  print('Logging...');
  rethrow;
}''',
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

class _CallStack extends StatelessWidget {
  const _CallStack();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _StackFrame('main()', Colors.white30, false),
        _StackArrow(),
        _StackFrame('a()', Colors.greenAccent, true, label: '✓ catch here'),
        _StackArrow(),
        _StackFrame('b()', Colors.white30, false),
        _StackArrow(),
        _StackFrame('c()', const Color(0xFFFF6B6B), false, label: 'throw ↑'),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withAlpha(20)),
          ),
          child: const Text(
            'If a() had no try/catch, the exception would continue up to main(), then crash the program with a full stack trace.',
            style: TextStyle(color: Colors.white54, fontSize: 13, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class _StackFrame extends StatelessWidget {
  final String name;
  final Color color;
  final bool highlighted;
  final String? label;
  const _StackFrame(this.name, this.color, this.highlighted, {this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: color.withAlpha(highlighted ? 30 : 10),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withAlpha(highlighted ? 100 : 30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: TextStyle(color: color, fontSize: 16, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
          if (label != null)
            Text(label!, style: TextStyle(color: color.withAlpha(180), fontSize: 12)),
        ],
      ),
    );
  }
}

class _StackArrow extends StatelessWidget {
  const _StackArrow();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Icon(Icons.arrow_upward, color: Color(0xFFFF6B6B), size: 20),
    );
  }
}
