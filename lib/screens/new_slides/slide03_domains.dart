import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide03Domains extends StatelessWidget {
  const Slide03Domains({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Application Domains',
      subtitle: 'Where Dart lives - and its trade-offs.',
      childrenSlides: [
        _DomainsFrame(),
        _AdvantagesFrame(),
        _DisadvantagesFrame(),
      ],
    );
  }
}

// ── Frame 1: Interactive Domain Explorer ───────────────────────────────────────

class _DomainsFrame extends StatefulWidget {
  const _DomainsFrame();

  @override
  State<_DomainsFrame> createState() => _DomainsFrameState();
}

class _DomainsFrameState extends State<_DomainsFrame> {
  String _active = 'Mobile';

  final _domains = {
    'Mobile': {
      'icon': Icons.phone_iphone,
      'color': AppColors.dartCyan,
      'headline': 'Best-in-class mobile UI',
      'detail': 'Flutter runs Dart on iOS and Android from a single codebase, producing 60/120 FPS native-feeling apps via the Impeller rendering engine.',
      'tags': ['iOS', 'Android', 'AOT compiled', 'Impeller engine'],
    },
    'Web': {
      'icon': Icons.language,
      'color': Colors.orangeAccent,
      'headline': 'Near-native web performance',
      'detail': 'Dart compiles to JavaScript or WebAssembly, enabling pixel-perfect Flutter UIs in the browser with CanvasKit.',
      'tags': ['WebAssembly', 'dart2js', 'PWA', 'CanvasKit'],
    },
    'Desktop': {
      'icon': Icons.laptop,
      'color': const Color(0xFF7C4DFF),
      'headline': 'Native desktop applications',
      'detail': 'Flutter targets Windows, macOS, and Linux with native C++ embedders, full file system access, and system tray support.',
      'tags': ['Windows', 'macOS', 'Linux', 'FFI support'],
    },
    'Server': {
      'icon': Icons.dns,
      'color': Colors.greenAccent,
      'headline': 'Concurrency without locks',
      'detail': 'Dart\'s Isolate model makes it ideal for microservices and CLI tools - concurrent without shared memory or race conditions.',
      'tags': ['Isolates', 'dart:io', 'CLI tools', 'Microservices'],
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = _domains[_active]!;
    final color = data['color'] as Color;

    return Wrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tab selector
          SizedBox(
            width: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _domains.keys.map((key) {
                final isActive = key == _active;
                final tabColor = _domains[key]!['color'] as Color;
                return GestureDetector(
                  onTap: () => setState(() => _active = key),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: isActive ? tabColor.withAlpha(30) : Colors.white.withAlpha(8),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: isActive ? tabColor.withAlpha(120) : Colors.white.withAlpha(15)),
                    ),
                    child: Row(
                      children: [
                        Icon(_domains[key]!['icon'] as IconData, color: isActive ? tabColor : Colors.white38, size: 22),
                        const SizedBox(width: 14),
                        Text(key,
                            style: TextStyle(
                              color: isActive ? Colors.white : Colors.white38,
                              fontSize: 17,
                              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                            )),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 40),
          // Detail panel
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 280),
              child: Container(
                key: ValueKey(_active),
                padding: const EdgeInsets.all(36),
                decoration: BoxDecoration(
                  color: color.withAlpha(12),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: color.withAlpha(60)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(data['icon'] as IconData, color: color, size: 40),
                        const SizedBox(width: 20),
                        Text(_active,
                            style: TextStyle(color: color, fontSize: 32, fontWeight: FontWeight.w900)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(data['headline'] as String,
                        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    Text(data['detail'] as String,
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 16, height: 1.6)),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: (data['tags'] as List<String>).map((t) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: color.withAlpha(25),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: color.withAlpha(80)),
                        ),
                        child: Text(t, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w600)),
                      )).toList(),
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

// ── Frame 2: Key Advantages ────────────────────────────────────────────────────

class _AdvantagesFrame extends StatelessWidget {
  const _AdvantagesFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('KEY ADVANTAGES',
                style: TextStyle(color: Colors.greenAccent, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'What makes Dart stand out?',
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 44),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    AnimatedFadeUp(delay: 300, child: _AdvCard(
                      icon: Icons.bolt,
                      color: Colors.amberAccent,
                      title: 'Dual Compilation',
                      desc: 'JIT during development enables instant Hot Reload. AOT for production outputs optimized native machine code.',
                    )),
                    const SizedBox(height: 20),
                    AnimatedFadeUp(delay: 500, child: _AdvCard(
                      icon: Icons.security,
                      color: Colors.greenAccent,
                      title: 'Sound Null Safety',
                      desc: 'Null-reference errors are caught at compile time. Variables cannot be null unless you explicitly allow it with ?.',
                    )),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  children: [
                    AnimatedFadeUp(delay: 400, child: _AdvCard(
                      icon: Icons.sync_alt,
                      color: AppColors.dartCyan,
                      title: 'Highly Portable',
                      desc: 'One language, one codebase, six targets: iOS, Android, Web, Windows, macOS, Linux.',
                    )),
                    const SizedBox(height: 20),
                    AnimatedFadeUp(delay: 600, child: _AdvCard(
                      icon: Icons.speed,
                      color: const Color(0xFF7C4DFF),
                      title: 'Fast Startup',
                      desc: 'AOT-compiled Dart binaries start instantly - no VM warmup period like JVM-based languages.',
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

class _AdvCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _AdvCard({required this.icon, required this.color, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color.withAlpha(12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Frame 3: Disadvantages ─────────────────────────────────────────────────────

class _DisadvantagesFrame extends StatelessWidget {
  const _DisadvantagesFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('KEY DISADVANTAGES',
                style: TextStyle(color: Color(0xFFFF6B6B), fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 20),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Where Dart falls short.',
              style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 44),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    AnimatedFadeUp(delay: 300, child: _DisadvCard(
                      icon: Icons.hub_outlined,
                      title: 'Smaller Backend Ecosystem',
                      desc: 'Python has FastAPI, Django, Flask. Java has Spring. Dart\'s backend libraries (shelf, dart_frog) are maturing but much smaller.',
                    )),
                    const SizedBox(height: 20),
                    AnimatedFadeUp(delay: 450, child: _DisadvCard(
                      icon: Icons.group_outlined,
                      title: 'Smaller Community',
                      desc: 'StackOverflow, GitHub, and job listings show significantly fewer Dart engineers than Python or Java developers.',
                    )),
                    const SizedBox(height: 20),
                    AnimatedFadeUp(delay: 600, child: _DisadvCard(
                      icon: Icons.flutter_dash,
                      title: 'Flutter-Centric',
                      desc: 'The vast majority of Dart usage is inside Flutter. Using Dart for non-UI work means going against the grain.',
                    )),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                flex: 4,
                child: AnimatedFadeUp(
                  delay: 700,
                  child: Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withAlpha(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Bottom Line',
                            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        Text(
                          'If you\'re building a Flutter app, Dart is the obvious - and only - choice.\n\nFor backend or data science work, Python or Java will give you a much larger ecosystem and community.',
                          style: TextStyle(color: Colors.white.withAlpha(160), fontSize: 15, height: 1.7),
                        ),
                      ],
                    ),
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

class _DisadvCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  const _DisadvCard({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B6B).withAlpha(10),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFF6B6B).withAlpha(45)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFFF6B6B), size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
