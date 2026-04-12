import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide18Compilation extends StatelessWidget {
  const Slide18Compilation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Compilation & Memory',
      subtitle: 'JIT, AOT, and generational garbage collection.',
      childrenSlides: [
        _JitFrame(),
        _AotFrame(),
        _GcFrame(),
      ],
    );
  }
}

// ── Frame 1: JIT - Hot Reload ──────────────────────────────────────────────────

class _JitFrame extends StatefulWidget {
  const _JitFrame();

  @override
  State<_JitFrame> createState() => _JitFrameState();
}

class _JitFrameState extends State<_JitFrame> {
  bool _isReloading = false;
  int _reloadCount = 0;
  Color _boxColor = AppColors.dartBlue;
  double _boxSize = 100;
  String _terminalLog = '> flutter run --debug\n> Dart VM started\n> Ready.';

  static const _colors = [AppColors.dartBlue, Colors.orangeAccent, Colors.greenAccent, Colors.purpleAccent];

  Future<void> _simulateHotReload() async {
    if (_isReloading) return;
    setState(() {
      _isReloading = true;
      _terminalLog += '\n> Performing hot reload...';
    });
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() {
      _reloadCount++;
      _boxColor = _colors[_reloadCount % _colors.length];
      _boxSize = _boxSize == 100 ? 130 : 100;
      _isReloading = false;
      _terminalLog += '\n> Reloaded in ${350 + _reloadCount * 12}ms ✓';
    });
  }

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
                  child: const Text('JIT COMPILATION',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Just-In-Time compilation enables instant Hot Reload during development.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _JitFact(Icons.bolt, Colors.amberAccent,
                    'Sub-second feedback', 'Hot reload injects updated code into the running VM - typically under 500ms.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 550, child: _JitFact(Icons.memory, AppColors.dartBlue,
                    'State preserved', 'Unlike a full restart, hot reload keeps app state - scroll position, form data, etc.')),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 700, child: _JitFact(Icons.speed, Colors.greenAccent,
                    'Developer productivity', 'The REPL-like development loop Dart/Flutter is famous for - no rebuild cycle.')),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 850,
                  child: ElevatedButton.icon(
                    onPressed: _simulateHotReload,
                    icon: _isReloading
                        ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                        : const Icon(Icons.refresh, size: 18),
                    label: Text(_isReloading ? 'Reloading...' : 'Simulate Hot Reload'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Terminal
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFFF5F56), shape: BoxShape.circle)),
                      const SizedBox(width: 6),
                      Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFFFFBD2E), shape: BoxShape.circle)),
                      const SizedBox(width: 6),
                      Container(width: 10, height: 10, decoration: const BoxDecoration(color: Color(0xFF27C93F), shape: BoxShape.circle)),
                      const SizedBox(width: 12),
                      const Text('flutter terminal', style: TextStyle(color: Colors.white38, fontSize: 11)),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0D1117),
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
                  ),
                  child: Text(
                    _terminalLog,
                    style: const TextStyle(color: Colors.greenAccent, fontSize: 12, fontFamily: 'monospace', height: 1.6),
                  ),
                ),
                const SizedBox(height: 24),
                // Device preview
                Container(
                  height: 180,
                  width: 160,
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white24, width: 3),
                  ),
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      width: _boxSize,
                      height: _boxSize,
                      decoration: BoxDecoration(
                        color: _boxColor.withAlpha(60),
                        borderRadius: BorderRadius.circular(_boxSize == 100 ? 12 : 60),
                        border: Border.all(color: _boxColor, width: 2),
                      ),
                      child: _isReloading
                          ? const Center(child: CircularProgressIndicator(color: Colors.white54, strokeWidth: 2))
                          : Icon(Icons.flutter_dash, color: _boxColor, size: 40),
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

class _JitFact extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _JitFact(this.icon, this.color, this.title, this.desc);

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

// ── Frame 2: AOT - Production Native Code ────────────────────────────────────

class _AotFrame extends StatelessWidget {
  const _AotFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('AOT COMPILATION',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Ahead-Of-Time compilation for production - fully native, fully optimized.',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedFadeUp(delay: 300, child: _AotCard(
                        icon: Icons.memory,
                        color: AppColors.dartBlue,
                        title: 'Compiled ahead of time',
                        desc: 'Your Dart code is fully compiled to native ARM or x64 machine code before the app is run. No VM needed at runtime.',
                      )),
                      const SizedBox(height: 16),
                      AnimatedFadeUp(delay: 450, child: _AotCard(
                        icon: Icons.bolt,
                        color: Colors.amberAccent,
                        title: 'Instant startup',
                        desc: 'No warmup phase. Unlike JVM apps, AOT Dart starts executing immediately - critical for mobile perceived performance.',
                      )),
                      const SizedBox(height: 16),
                      AnimatedFadeUp(delay: 600, child: _AotCard(
                        icon: Icons.speed,
                        color: Colors.greenAccent,
                        title: 'Predictable performance',
                        desc: 'No JIT compilation pauses. Frame rate stays smooth because there\'s no background recompilation.',
                      )),
                    ],
                  ),
                ),
                const SizedBox(width: 48),
                Expanded(
                  flex: 5,
                  child: AnimatedFadeUp(
                    delay: 400,
                    child: _CompPipeline(),
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

class _CompPipeline extends StatelessWidget {
  const _CompPipeline();

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
          const Text('Compilation Pipeline', style: TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _PipeStep('Dart source (.dart)', AppColors.dartCyan),
          _PipeArrow(),
          _PipeStep('Frontend compiler\n(kernel IR)', Colors.white38),
          _PipeArrow(),
          _PipeStep('dart compile exe\n/ flutter build', Colors.orangeAccent),
          _PipeArrow(),
          _PipeStep('Native binary\n(ARM64 / x64)', Colors.greenAccent),
          const SizedBox(height: 20),
          const Text('No VM, no interpreter, no overhead',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.greenAccent, fontSize: 12)),
        ],
      ),
    );
  }
}

class _PipeStep extends StatelessWidget {
  final String label;
  final Color color;
  const _PipeStep(this.label, this.color);
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    decoration: BoxDecoration(
      color: color.withAlpha(20),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: color.withAlpha(60)),
    ),
    child: Text(label, textAlign: TextAlign.center,
        style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold)),
  );
}

class _PipeArrow extends StatelessWidget {
  const _PipeArrow();
  @override
  Widget build(BuildContext context) => const Padding(
    padding: EdgeInsets.symmetric(vertical: 4),
    child: Icon(Icons.arrow_downward, color: Colors.white24, size: 18),
  );
}

class _AotCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _AotCard({required this.icon, required this.color, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withAlpha(12),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withAlpha(45)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
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

// ── Frame 3: Generational Garbage Collector ───────────────────────────────────

class _GcFrame extends StatelessWidget {
  const _GcFrame();

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
                  child: const Text('GENERATIONAL GC',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Memory management optimized for UI rendering patterns.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: _GcCard(
                    'New Space (Young generation)',
                    AppColors.dartBlue,
                    'Short-lived objects (most UI widgets, frame data). Collected very frequently, very cheaply. Objects that survive promotion to Old Space.',
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 550,
                  child: _GcCard(
                    'Old Space (Tenured generation)',
                    Colors.purpleAccent,
                    'Long-lived objects (services, singletons, data models). Collected less frequently. Mark-sweep algorithm.',
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 700,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.dartBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.dartBlue.withAlpha(50)),
                    ),
                    child: const Text(
                      'Why generational? Flutter creates millions of widget objects per second during animations. The generational model collects these quickly without long GC pauses.',
                      style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.6),
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
              child: _GcDiagram(),
            ),
          ),
        ],
      ),
    );
  }
}

class _GcCard extends StatelessWidget {
  final String title;
  final Color color;
  final String desc;
  const _GcCard(this.title, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withAlpha(55)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}

class _GcDiagram extends StatelessWidget {
  const _GcDiagram();

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
          const Text('Memory Heap', style: TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          // New space
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.dartBlue.withAlpha(20),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.dartBlue.withAlpha(60)),
            ),
            child: Column(
              children: [
                const Text('New Space (Young)', style: TextStyle(color: AppColors.dartBlue, fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text('Most allocations → collected fast', style: TextStyle(color: Colors.white54, fontSize: 11)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(7, (i) => Container(
                    width: 24, height: 24,
                    decoration: BoxDecoration(
                      color: i < 5 ? AppColors.dartBlue.withAlpha(60) : Colors.white.withAlpha(10),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  )),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Icon(Icons.arrow_downward, color: Colors.white24, size: 20),
          const Text('survive several GCs', style: TextStyle(color: Colors.white38, fontSize: 11)),
          const Icon(Icons.arrow_downward, color: Colors.white24, size: 20),
          const SizedBox(height: 4),
          // Old space
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purpleAccent.withAlpha(15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.purpleAccent.withAlpha(50)),
            ),
            child: const Column(
              children: [
                Text('Old Space (Tenured)', style: TextStyle(color: Colors.purpleAccent, fontSize: 13, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Long-lived objects → infrequent GC', style: TextStyle(color: Colors.white54, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('GC runs without stopping\nFlutter\'s UI thread',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.greenAccent, fontSize: 12, height: 1.5)),
        ],
      ),
    );
  }
}
