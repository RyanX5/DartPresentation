import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class RohanSlide1 extends StatefulWidget {
  const RohanSlide1({super.key});

  @override
  State<RohanSlide1> createState() => _RohanSlide1State();
}

class _RohanSlide1State extends State<RohanSlide1> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Background',
      subtitle: 'Where did Dart come from?',
      childrenSlides: [_Frame1(), _Frame2(), _Frame3(), _Frame4()],
    );
  }
}

Widget _Frame1() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Origin', style: TextStyles().title()),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedFadeUp(
                  delay: 300,
                  child: _Bullet(
                    'Created by Lars Bak and Kasper Lund at Google in 2011',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 550,
                  child: _Bullet(
                    'Goal: replace JavaScript as the primary web language — built for scale',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 800,
                  child: _Bullet(
                    'Initial reception was poor — the web community pushed back hard',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 1050,
                  child: _Bullet(
                    'Google planned to ship a Dart VM inside Chrome — never happened',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _Frame2() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('The Flutter Pivot', style: TextStyles().title()),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedFadeUp(
                  delay: 300,
                  child: _Bullet(
                    'In 2017, Google launched Flutter — a cross-platform UI framework',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 550,
                  child: _Bullet(
                    'Flutter chose Dart as its language — this changed everything',
                  ),
                ),
                AnimatedFadeUp(
                  delay: 800,
                  child: _Bullet(
                    "Dart's JIT compiler enables Flutter's hot reload — instant UI preview during development",
                  ),
                ),
                AnimatedFadeUp(
                  delay: 1050,
                  child: _Bullet(
                    "Dart's AOT compiler produces fast native binaries for production",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _Frame3() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Where Dart Runs Today', style: TextStyles().title()),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedFadeUp(
                delay: 300,
                child: _PlatformCard(
                  icon: Icons.phone_android,
                  label: 'Mobile',
                  sub: 'iOS & Android\nvia Flutter',
                ),
              ),
              AnimatedFadeUp(
                delay: 500,
                child: _PlatformCard(
                  icon: Icons.web,
                  label: 'Web',
                  sub: 'Compiles to\nJavaScript',
                ),
              ),
              AnimatedFadeUp(
                delay: 700,
                child: _PlatformCard(
                  icon: Icons.desktop_windows,
                  label: 'Desktop',
                  sub: 'macOS, Windows,\nLinux',
                ),
              ),
              AnimatedFadeUp(
                delay: 900,
                child: _PlatformCard(
                  icon: Icons.terminal,
                  label: 'Server',
                  sub: 'CLI tools &\nbackend scripts',
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _Frame4() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Pros & Cons', style: TextStyles().title()),
          const SizedBox(height: 50),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    AnimatedFadeUp(
                      delay: 200,
                      child: Text(
                        '✓  Advantages',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.shade400,
                        ),
                      ),
                    ),
                    AnimatedFadeUp(
                      delay: 400,
                      child: _Bullet(
                        'Sound null safety — no null pointer surprises',
                      ),
                    ),
                    AnimatedFadeUp(
                      delay: 600,
                      child: _Bullet(
                        'Single codebase for mobile, web, and desktop',
                      ),
                    ),
                    AnimatedFadeUp(
                      delay: 800,
                      child: _Bullet('Fast hot reload during development'),
                    ),
                    AnimatedFadeUp(
                      delay: 1000,
                      child: _Bullet(
                        'Familiar C-style syntax — easy for Java devs',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 60),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    AnimatedFadeUp(
                      delay: 200,
                      child: Text(
                        '✗  Disadvantages',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent.shade200,
                        ),
                      ),
                    ),
                    AnimatedFadeUp(
                      delay: 400,
                      child: _Bullet('Small community outside of Flutter'),
                    ),
                    AnimatedFadeUp(
                      delay: 600,
                      child: _Bullet('Rarely used for backend or systems work'),
                    ),
                    AnimatedFadeUp(
                      delay: 800,
                      child: _Bullet(
                        'Web output (JS transpilation) can be bloated',
                      ),
                    ),
                    AnimatedFadeUp(
                      delay: 1000,
                      child: _Bullet(
                        "Success is tightly coupled to Flutter's fate",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _Bullet(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        '→  ',
        style: TextStyle(color: AppColors.dartCyan, fontSize: 21),
      ),
      Expanded(child: Text(text, style: TextStyles().normal())),
    ],
  );
}

Widget _PlatformCard({
  required IconData icon,
  required String label,
  required String sub,
}) {
  return Container(
    width: 175,
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.dartBlue.withAlpha(80), width: 1.5),
      borderRadius: BorderRadius.circular(16),
      color: AppColors.dartBlue.withAlpha(20),
    ),
    child: Column(
      children: [
        Icon(icon, size: 38, color: AppColors.dartCyan),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          sub,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, color: AppColors.textSecondary),
        ),
      ],
    ),
  );
}
