import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide20Conclusion extends StatelessWidget {
  const Slide20Conclusion({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Conclusion',
      subtitle: 'What we learned about Dart.',
      childrenSlides: [
        _SummaryFrame(),
        _FinalThoughtFrame(),
        _QAFrame(),
      ],
    );
  }
}

// ── Frame 1: Summary ──────────────────────────────────────────────────────────

class _SummaryFrame extends StatelessWidget {
  const _SummaryFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('KEY TAKEAWAYS',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 16),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Dart bridges rapid development and high-performance execution.',
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800, height: 1.2),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    AnimatedFadeUp(delay: 300, child: _SummaryCard(
                      icon: Icons.bolt,
                      color: Colors.amberAccent,
                      title: 'Dual Compilation',
                      desc: 'JIT for fast development cycles. AOT for production-grade native performance.',
                    )),
                    const SizedBox(height: 16),
                    AnimatedFadeUp(delay: 500, child: _SummaryCard(
                      icon: Icons.security,
                      color: Colors.greenAccent,
                      title: 'Sound Type System',
                      desc: 'Null safety enforced at compile time. No NullPointerExceptions by design.',
                    )),
                    const SizedBox(height: 16),
                    AnimatedFadeUp(delay: 700, child: _SummaryCard(
                      icon: Icons.hub,
                      color: AppColors.dartCyan,
                      title: 'Isolates',
                      desc: 'Safe parallelism without shared memory. True concurrency, zero data races.',
                    )),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  children: [
                    AnimatedFadeUp(delay: 400, child: _SummaryCard(
                      icon: Icons.layers,
                      color: Colors.orangeAccent,
                      title: 'Rich OOP',
                      desc: 'Single inheritance, mixins, implicit interfaces, and library-level encapsulation.',
                    )),
                    const SizedBox(height: 16),
                    AnimatedFadeUp(delay: 600, child: _SummaryCard(
                      icon: Icons.functions,
                      color: const Color(0xFF7C4DFF),
                      title: 'Functional Features',
                      desc: 'First-class functions, lambdas, generators, and a powerful collection API.',
                    )),
                    const SizedBox(height: 16),
                    AnimatedFadeUp(delay: 800, child: _SummaryCard(
                      icon: Icons.sync_alt,
                      color: const Color(0xFFFF6B6B),
                      title: 'One Language, Six Platforms',
                      desc: 'Mobile, web, desktop, server - all from a single Dart codebase with Flutter.',
                    )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _SummaryCard({required this.icon, required this.color, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withAlpha(12),
        borderRadius: BorderRadius.circular(16),
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

// ── Frame 2: Final Thought ─────────────────────────────────────────────────────

class _FinalThoughtFrame extends StatelessWidget {
  const _FinalThoughtFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedFadeUp(
              delay: 100,
              child: const Text('FINAL THOUGHT',
                  style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 36),
            AnimatedFadeUp(
              delay: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LangPill('Java', Colors.orangeAccent, 'Type-safety\n& OOP rigor'),
                  const SizedBox(width: 20),
                  const Text('+', style: TextStyle(color: Colors.white38, fontSize: 40, fontWeight: FontWeight.w300)),
                  const SizedBox(width: 20),
                  _LangPill('Python', Colors.yellowAccent, 'Conciseness\n& developer UX'),
                  const SizedBox(width: 20),
                  const Text('=', style: TextStyle(color: Colors.white38, fontSize: 40, fontWeight: FontWeight.w300)),
                  const SizedBox(width: 20),
                  _LangPill('Dart', AppColors.dartCyan, 'Both worlds\nfor modern UI'),
                ],
              ),
            ),
            const SizedBox(height: 48),
            AnimatedFadeUp(
              delay: 500,
              child: SizedBox(
                width: 700,
                child: Text(
                  'Dart successfully blends the strict type-safety and object-orientation of Java with the conciseness and developer-friendly features of Python - and adds unique capabilities like sound null safety, isolates, and dual compilation that neither language has.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withAlpha(160), fontSize: 18, height: 1.7),
                ),
              ),
            ),
            const SizedBox(height: 48),
            AnimatedFadeUp(
              delay: 750,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _LanguageStat('Type Safety', 'Java ✓  Dart ✓  Python ~', Colors.greenAccent),
                  const SizedBox(width: 32),
                  _LanguageStat('Conciseness', 'Python ✓  Dart ✓  Java ~', Colors.amberAccent),
                  const SizedBox(width: 32),
                  _LanguageStat('Null Safety', 'Dart ✓  Python ~  Java ✗', AppColors.dartCyan),
                  const SizedBox(width: 32),
                  _LanguageStat('Portability', 'Dart ✓  Java ✓  Python ~', Colors.purpleAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LangPill extends StatelessWidget {
  final String lang;
  final Color color;
  final String desc;
  const _LangPill(this.lang, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(80)),
      ),
      child: Column(
        children: [
          Text(lang, style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          Text(desc, textAlign: TextAlign.center,
              style: TextStyle(color: color.withAlpha(160), fontSize: 13, height: 1.4)),
        ],
      ),
    );
  }
}

class _LanguageStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _LanguageStat(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white54, fontSize: 12, fontFamily: 'monospace')),
      ],
    );
  }
}

// ── Frame 3: Q&A ──────────────────────────────────────────────────────────────

class _QAFrame extends StatelessWidget {
  const _QAFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedFadeUp(
              delay: 100,
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.white, AppColors.dartCyan],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'Questions?',
                  style: TextStyle(color: Colors.white, fontSize: 72, fontWeight: FontWeight.w900, letterSpacing: -2),
                ),
              ),
            ),
            const SizedBox(height: 24),
            AnimatedFadeUp(
              delay: 300,
              child: Text(
                'The floor is open - feel free to ask anything.',
                style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 22, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 56),
            AnimatedFadeUp(
              delay: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _Presenter('Rohan Upadhyay', 'Sections 1–9', AppColors.dartBlue),
                  const SizedBox(width: 48),
                  _Presenter('Supreme Dallakoti', 'Sections 10–20', Colors.orangeAccent),
                ],
              ),
            ),
            const SizedBox(height: 40),
            AnimatedFadeUp(
              delay: 700,
              child: Text(
                '⏱  Total presentation time: ~25 minutes',
                style: TextStyle(color: Colors.white.withAlpha(60), fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 24),
            AnimatedFadeUp(
              delay: 900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _StatChip(Icons.check_circle_outline, '0 Errors', Colors.greenAccent),
                  const SizedBox(width: 16),
                  _StatChip(Icons.warning_amber_outlined, '0 Warnings', Colors.amberAccent),
                  const SizedBox(width: 16),
                  _StatChip(Icons.code, '20 Slides', AppColors.dartCyan),
                  const SizedBox(width: 16),
                  _StatChip(Icons.psychology, '6 Sections', Colors.purpleAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Presenter extends StatelessWidget {
  final String name;
  final String role;
  final Color color;
  const _Presenter(this.name, this.role, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withAlpha(40),
            radius: 28,
            child: Icon(Icons.person, color: color, size: 28),
          ),
          const SizedBox(height: 14),
          Text(name, style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(role, style: TextStyle(color: color.withAlpha(150), fontSize: 13)),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _StatChip(this.icon, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
