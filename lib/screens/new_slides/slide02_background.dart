import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide02Background extends StatelessWidget {
  const Slide02Background({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Background & Origins',
      subtitle: 'Where Dart came from.',
      childrenSlides: [
        _CreatorsFrame(),
        _ProblemFrame(),
        _SummaryFrame(),
      ],
    );
  }
}

// ── Frame 1: Creators & Timeline ───────────────────────────────────────────────

class _CreatorsFrame extends StatelessWidget {
  const _CreatorsFrame();

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
                  child: const Text('WHO CREATED IT?',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Designed by\nLars Bak & Kasper Lund',
                    style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900, height: 1.15, letterSpacing: -0.5),
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 400,
                  child: Text(
                    'Developed at Google · Publicly unveiled in 2011',
                    style: TextStyle(color: Colors.white.withAlpha(140), fontSize: 20),
                  ),
                ),
                const SizedBox(height: 48),
                AnimatedFadeUp(
                  delay: 550,
                  child: _FactRow(Icons.person, 'Lars Bak', 'Previously built the V8 JavaScript engine for Chrome'),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(
                  delay: 700,
                  child: _FactRow(Icons.person_2, 'Kasper Lund', 'Co-creator with deep VM and compiler expertise'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 60),
          Expanded(
            flex: 4,
            child: AnimatedFadeUp(
              delay: 400,
              child: _Timeline(),
            ),
          ),
        ],
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 20,
          bottom: 20,
          child: Container(
            width: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.dartCyan.withAlpha(0),
                  AppColors.dartCyan,
                  AppColors.dartBlue,
                  AppColors.dartBlue.withAlpha(0),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            _TimelineItem('2008', 'V8 shipped', 'Lars Bak\'s Chrome JS engine launches, proving fast VMs are possible.', AppColors.dartCyan),
            const SizedBox(height: 32),
            _TimelineItem('2011', 'Dart unveiled', 'Announced at GOTO conference in Aarhus, Denmark.', AppColors.dartBlue),
            const SizedBox(height: 32),
            _TimelineItem('2018', 'Dart 2.0', 'Sound type system and strong mode introduced.', Colors.purpleAccent),
            const SizedBox(height: 32),
            _TimelineItem('2023', 'Dart 3.0', 'Sound null safety, records, and patterns.', Colors.greenAccent),
          ],
        ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String year;
  final String title;
  final String desc;
  final Color color;
  const _TimelineItem(this.year, this.title, this.desc, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: color.withAlpha(120), blurRadius: 8)]),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(year, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1)),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _FactRow(IconData icon, String name, String detail) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.dartBlue.withAlpha(30),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.dartCyan, size: 22),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
            Text(detail, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.4)),
          ],
        ),
      ),
    ],
  );
}

// ── Frame 2: The Problem it Solves ─────────────────────────────────────────────

class _ProblemFrame extends StatelessWidget {
  const _ProblemFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('WHAT PROBLEM DOES IT SOLVE?',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AnimatedFadeUp(
                  delay: 250,
                  child: _ProblemCard(
                    label: 'THE PROBLEM',
                    color: const Color(0xFFFF6B6B),
                    icon: Icons.warning_amber_rounded,
                    title: 'JavaScript\'s Shortcomings',
                    points: [
                      'Dynamic typing leads to runtime surprises',
                      'No built-in null safety → crashes in prod',
                      'Poor scalability for large codebases',
                      'Slow startup for complex web apps',
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                child: AnimatedFadeUp(
                  delay: 500,
                  child: Column(
                    children: [
                      const Icon(Icons.arrow_forward, color: AppColors.dartCyan, size: 32),
                      const SizedBox(height: 8),
                      Text('Pivoted to', style: TextStyle(color: Colors.white.withAlpha(100), fontSize: 13)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: AnimatedFadeUp(
                  delay: 750,
                  child: _ProblemCard(
                    label: 'THE SOLUTION',
                    color: Colors.greenAccent,
                    icon: Icons.check_circle_outline,
                    title: 'Premier Multi-Platform UI Language',
                    points: [
                      'Sound type system with null safety',
                      'Dual compilation: JIT (dev) + AOT (prod)',
                      'Single codebase → mobile, web, desktop',
                      'Backbone of the Flutter framework',
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProblemCard extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;
  final String title;
  final List<String> points;
  const _ProblemCard({required this.label, required this.color, required this.icon, required this.title, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: color.withAlpha(12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 10),
              Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2)),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, height: 1.3)),
          const SizedBox(height: 20),
          ...points.map((p) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.circle, color: color, size: 7),
                const SizedBox(width: 12),
                Expanded(child: Text(p, style: const TextStyle(color: AppColors.textSecondary, fontSize: 15, height: 1.4))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

// ── Frame 3: High-Level Summary ────────────────────────────────────────────────

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
            child: const Text('HIGH-LEVEL SUMMARY',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Dart is a language designed for\nspeed, safety, and scale.',
              style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.w800, height: 1.2),
            ),
          ),
          const SizedBox(height: 52),
          Row(
            children: [
              Expanded(child: AnimatedFadeUp(delay: 350, child: _PillarCard(Icons.widgets, 'Object-Oriented', 'Class-based OOP with single inheritance and mixins.', AppColors.dartBlue))),
              const SizedBox(width: 20),
              Expanded(child: AnimatedFadeUp(delay: 500, child: _PillarCard(Icons.delete_sweep, 'Garbage Collected', 'Automatic memory management via a generational GC.', const Color(0xFF7C4DFF)))),
              const SizedBox(width: 20),
              Expanded(child: AnimatedFadeUp(delay: 650, child: _PillarCard(Icons.text_fields, 'C-Style Syntax', 'Familiar braces, semicolons, and control structures.', Colors.orangeAccent))),
              const SizedBox(width: 20),
              Expanded(child: AnimatedFadeUp(delay: 800, child: _PillarCard(Icons.security, 'Sound Type System', 'Static types with null safety enforced at compile time.', Colors.greenAccent))),
            ],
          ),
        ],
      ),
    );
  }
}

class _PillarCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;
  const _PillarCard(this.icon, this.title, this.desc, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: color.withAlpha(18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(70)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 36),
          const SizedBox(height: 20),
          Text(title, style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.5)),
        ],
      ),
    );
  }
}
