import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide17Concurrency extends StatelessWidget {
  const Slide17Concurrency({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Concurrency & Isolates',
      subtitle: 'Safe parallelism without shared memory.',
      childrenSlides: [
        _NoSharedMemoryFrame(),
        _IsolatesFrame(),
        _MessagePassingFrame(),
      ],
    );
  }
}

// ── Frame 1: No Shared Memory ──────────────────────────────────────────────────

class _NoSharedMemoryFrame extends StatelessWidget {
  const _NoSharedMemoryFrame();

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
                  child: const Text('THE PROBLEM WITH THREADS',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Dart\'s concurrency model avoids the biggest pitfall of traditional threading.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _ProbCard(
                    icon: Icons.dangerous,
                    color: const Color(0xFFFF6B6B),
                    title: 'Data Races',
                    desc: 'Two threads read/write the same memory simultaneously → unpredictable, hard-to-debug bugs.',
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 550,
                  child: _ProbCard(
                    icon: Icons.lock_clock,
                    color: Colors.orangeAccent,
                    title: 'Deadlocks',
                    desc: 'Thread A holds Lock 1, waits for Lock 2. Thread B holds Lock 2, waits for Lock 1. Both freeze.',
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 700,
                  child: _ProbCard(
                    icon: Icons.bolt,
                    color: Colors.amberAccent,
                    title: 'Race Conditions',
                    desc: 'The outcome depends on the order threads execute — which is non-deterministic at runtime.',
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(
                  delay: 900,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withAlpha(15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.greenAccent.withAlpha(50)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.greenAccent, size: 20),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Dart\'s solution: no shared memory between concurrent units. This eliminates these bugs by design.',
                            style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.4),
                          ),
                        ),
                      ],
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
              delay: 400,
              child: _ThreadDiagram(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThreadDiagram extends StatelessWidget {
  const _ThreadDiagram();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withAlpha(15)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Traditional Threading', style: TextStyle(color: Colors.white54, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _ThreadBox('Thread A', AppColors.dartBlue),
              _ThreadBox('Thread B', Colors.orangeAccent),
            ],
          ),
          const SizedBox(height: 16),
          const Icon(Icons.sync_alt, color: Color(0xFFFF6B6B), size: 32),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B6B).withAlpha(20),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFF6B6B).withAlpha(60)),
            ),
            child: const Column(
              children: [
                Text('Shared Memory', style: TextStyle(color: Color(0xFFFF6B6B), fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('⚠ Data Race Risk', style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Divider(color: Colors.white10),
          const SizedBox(height: 16),
          const Text('Dart Isolates', style: TextStyle(color: Colors.greenAccent, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _IsolateBox('Isolate A', AppColors.dartBlue),
              _IsolateBox('Isolate B', Colors.greenAccent),
            ],
          ),
          const SizedBox(height: 16),
          const Icon(Icons.swap_horiz, color: Colors.greenAccent, size: 28),
          const SizedBox(height: 6),
          const Text('Messages only (no shared state)', style: TextStyle(color: Colors.greenAccent, fontSize: 12)),
        ],
      ),
    );
  }
}

class _ThreadBox extends StatelessWidget {
  final String label;
  final Color color;
  const _ThreadBox(this.label, this.color);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: color.withAlpha(25), borderRadius: BorderRadius.circular(10), border: Border.all(color: color.withAlpha(80))),
    child: Text(label, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold)),
  );
}

class _IsolateBox extends StatelessWidget {
  final String label;
  final Color color;
  const _IsolateBox(this.label, this.color);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: color.withAlpha(20), borderRadius: BorderRadius.circular(10), border: Border.all(color: color.withAlpha(70))),
    child: Column(
      children: [
        Text(label, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text('own heap', style: TextStyle(color: color.withAlpha(150), fontSize: 10)),
      ],
    ),
  );
}

class _ProbCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _ProbCard({required this.icon, required this.color, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withAlpha(12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withAlpha(45)),
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
                Text(title, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold)),
                Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Frame 2: Isolates Model ────────────────────────────────────────────────────

class _IsolatesFrame extends StatelessWidget {
  const _IsolatesFrame();

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
                  child: const Text('ISOLATES',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Each isolate has its own memory heap — they cannot share objects.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _IsoFact(Icons.memory, AppColors.dartBlue,
                    'Separate heap', 'Each isolate allocates its own memory. The GC runs independently per isolate.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 550, child: _IsoFact(Icons.people, Colors.orangeAccent,
                    'Actor model', 'Similar to Erlang\'s processes or Akka actors — concurrency via message passing.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 700, child: _IsoFact(Icons.developer_board, Colors.greenAccent,
                    'True parallelism', 'Unlike async/await (single thread), isolates run on separate OS threads — full CPU utilization.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 850, child: _IsoFact(Icons.calculate, Colors.purpleAccent,
                    'When to use', 'CPU-intensive work: image processing, JSON parsing, encryption — anything that would block the UI.')),
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
                code: '''import 'dart:isolate';

// Simple way: Isolate.run() (Dart 2.19+)
Future<void> main() async {
  // Runs in a separate isolate
  // Does not block the main isolate
  int result = await Isolate.run(() {
    // Heavy CPU work here
    return expensiveComputation();
  });
  print('Result: \$result');
}

int expensiveComputation() {
  // Simulate heavy work
  int sum = 0;
  for (int i = 0; i < 100000000; i++) {
    sum += i;
  }
  return sum;
}

// Without isolate — this would freeze the UI
// await expensiveComputation(); // blocks!

// With isolate — UI stays responsive:
// Isolate.run(expensiveComputation); // parallel!''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IsoFact extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _IsoFact(this.icon, this.color, this.title, this.desc);

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
              Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.3)),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Frame 3: Message Passing ───────────────────────────────────────────────────

class _MessagePassingFrame extends StatelessWidget {
  const _MessagePassingFrame();

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
                code: '''import 'dart:isolate';

// Manual isolate with SendPort/ReceivePort
Future<void> main() async {
  // Port to receive messages from the isolate
  final receivePort = ReceivePort();

  // Spawn an isolate, give it the send port
  await Isolate.spawn(
    workerIsolate,
    receivePort.sendPort, // only this is shared
  );

  // Listen for messages
  await for (final message in receivePort) {
    print('Main received: \$message');
    if (message == 'done') {
      receivePort.close();
      break;
    }
  }
}

// This function runs in its own isolate
void workerIsolate(SendPort sendPort) {
  // Send data back to main isolate
  sendPort.send('Processing...');

  // Simulate work
  int result = 0;
  for (int i = 0; i < 1000000; i++) result += i;

  sendPort.send('Result: \$result');
  sendPort.send('done'); // signal completion
}

// Output:
// Main received: Processing...
// Main received: Result: 499999500000
// Main received: done''',
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
                  child: const Text('MESSAGE PASSING',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Isolates communicate by passing serialized messages — never shared pointers.',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _MsgBox('ReceivePort', AppColors.dartBlue, 'A stream of incoming messages from another isolate.')),
                const SizedBox(height: 12),
                AnimatedFadeUp(delay: 500, child: _MsgBox('SendPort', Colors.orangeAccent, 'A handle to send messages to a specific ReceivePort.')),
                const SizedBox(height: 12),
                AnimatedFadeUp(delay: 600, child: _MsgBox('Serialization', Colors.greenAccent, 'Messages are automatically copied (serialized). No shared pointers.')),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 750,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.dartBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.dartBlue.withAlpha(50)),
                    ),
                    child: const Text(
                      'In practice, most Flutter developers use compute() or Isolate.run() — the low-level SendPort API is only needed for persistent background isolates.',
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

class _MsgBox extends StatelessWidget {
  final String type;
  final Color color;
  final String desc;
  const _MsgBox(this.type, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Row(
        children: [
          Text(type, style: TextStyle(color: color, fontSize: 13, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
          const SizedBox(width: 12),
          Expanded(child: Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13))),
        ],
      ),
    );
  }
}
