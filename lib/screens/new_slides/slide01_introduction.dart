import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide01Introduction extends StatelessWidget {
  const Slide01Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Introduction',
      subtitle: 'Demystifying Dart',
      childrenSlides: [
        _TitleFrame(),
        _GoalFrame(),
        _ExpectFrame(),
      ],
    );
  }
}

// ── Frame 1: Title Statement ───────────────────────────────────────────────────

class _TitleFrame extends StatelessWidget {
  const _TitleFrame();

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
                  color: AppColors.dartBlue.withAlpha(30),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppColors.dartCyan.withAlpha(100)),
                ),
                child: const Text(
                  'CSCI 282 · PROGRAMMING LANGUAGES',
                  style: TextStyle(
                    color: AppColors.dartCyan,
                    fontSize: 13,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            AnimatedFadeUp(
              delay: 300,
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.white, AppColors.dartCyan],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: const Text(
                  'Dart: The Language Behind\nthe Modern Web and Mobile UI',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.w900,
                    height: 1.2,
                    letterSpacing: -1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            AnimatedFadeUp(
              delay: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ContextChip(Icons.language, 'Web'),
                  const SizedBox(width: 16),
                  _ContextChip(Icons.phone_iphone, 'Mobile'),
                  const SizedBox(width: 16),
                  _ContextChip(Icons.laptop, 'Desktop'),
                  const SizedBox(width: 16),
                  _ContextChip(Icons.dns, 'Server'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _ContextChip(IconData icon, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      color: Colors.white.withAlpha(10),
      borderRadius: BorderRadius.circular(40),
      border: Border.all(color: Colors.white.withAlpha(25)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppColors.dartCyan, size: 18),
        const SizedBox(width: 10),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 16)),
      ],
    ),
  );
}

// ── Frame 2: Goal ──────────────────────────────────────────────────────────────

class _GoalFrame extends StatelessWidget {
  const _GoalFrame();

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
                  child: Text(
                    'Our Goal',
                    style: TextStyle(
                      color: AppColors.dartCyan,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 200,
                  child: Text(
                    'Analyze Dart from both a\nconceptual and practical perspective.',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                AnimatedFadeUp(
                  delay: 400,
                  child: _GoalPillar(
                    icon: Icons.psychology,
                    color: const Color(0xFF7C4DFF),
                    title: 'Conceptual',
                    desc: 'How Dart solves fundamental language design problems — type safety, concurrency, memory.',
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 600,
                  child: _GoalPillar(
                    icon: Icons.code,
                    color: AppColors.dartBlue,
                    title: 'Practical',
                    desc: 'Real code examples that show Dart\'s syntax, patterns, and tradeoffs in action.',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 60),
          Expanded(
            flex: 3,
            child: AnimatedFadeUp(
              delay: 800,
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withAlpha(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.flutter_dash, color: AppColors.dartCyan, size: 64),
                    const SizedBox(height: 24),
                    const Text(
                      'Powered by Flutter',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Dart is the engine behind Flutter — Google\'s UI toolkit used by millions of apps worldwide.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white.withAlpha(120), fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalPillar extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _GoalPillar({required this.icon, required this.color, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withAlpha(30),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withAlpha(80)),
          ),
          child: Icon(icon, color: color, size: 26),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 15, height: 1.5)),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Frame 3: What to Expect ────────────────────────────────────────────────────

class _ExpectFrame extends StatelessWidget {
  const _ExpectFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text(
              'What to Expect',
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 12),
          AnimatedFadeUp(
            delay: 200,
            child: Text(
              'We look beyond feature lists — here\'s how we\'ll explore Dart:',
              style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 20),
            ),
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              Expanded(
                child: AnimatedFadeUp(
                  delay: 300,
                  child: _ExpectCard(
                    icon: Icons.compare_arrows,
                    color: Colors.orangeAccent,
                    title: 'Java Comparisons',
                    desc: 'How does Dart\'s approach to OOP, types, and null safety stack up against Java?',
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: AnimatedFadeUp(
                  delay: 450,
                  child: _ExpectCard(
                    icon: Icons.auto_awesome,
                    color: Colors.greenAccent,
                    title: 'Python Comparisons',
                    desc: 'Where does Dart share Python\'s conciseness, and where does it diverge?',
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: AnimatedFadeUp(
                  delay: 600,
                  child: _ExpectCard(
                    icon: Icons.code,
                    color: AppColors.dartCyan,
                    title: 'Code Examples',
                    desc: 'Annotated, real Dart code illustrating each concept clearly and concisely.',
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: AnimatedFadeUp(
                  delay: 750,
                  child: _ExpectCard(
                    icon: Icons.quiz,
                    color: const Color(0xFFFF6B6B),
                    title: 'Quick Quizzes',
                    desc: 'Short knowledge checks to test understanding of key Dart behaviors.',
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

class _ExpectCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _ExpectCard({required this.icon, required this.color, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 20),
          Text(title, style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.5)),
        ],
      ),
    );
  }
}
