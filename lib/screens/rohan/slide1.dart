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
      subtitle: 'The evolution of a language.',
      childrenSlides: [
        _OriginTimeline(),
        _ThePivotInteractive(),
        _PlatformEcosystem(),
        _ProsConsBattle(),
      ],
    );
  }
}

// ── FRAME 1: THE ORIGIN (Timeline Approach) ──────────────────────────────────

Widget _OriginTimeline() {
  return Wrapper(
    child: Center(
      child: Column(
        children: [
          Text('The Birth of Dart', style: TextStyles().title()),
          const SizedBox(height: 80),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // The Timeline Line
                Container(
                  width: 4,
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.dartCyan.withAlpha(0),
                        AppColors.dartCyan,
                        AppColors.dartCyan.withAlpha(0),
                      ],
                    ),
                  ),
                ),
                // Timeline Points
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _TimelineNode(
                      year: '2011',
                      title: 'The Google Reveal',
                      desc: 'Created by Lars Bak and Kasper Lund at Google.',
                      isLeft: true,
                      delay: 300,
                    ),
                    _TimelineNode(
                      year: 'Goal',
                      title: 'JS Replacement',
                      desc:
                          'Built to replace JavaScript for large-scale web apps.',
                      isLeft: false,
                      delay: 600,
                    ),
                    _TimelineNode(
                      year: 'Reality',
                      title: 'The Pushback',
                      desc:
                          'The web community resisted; the Chrome VM plan was scrapped.',
                      isLeft: true,
                      delay: 900,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// ── FRAME 2: THE PIVOT (Hot Reload Demo) ─────────────────────────────────────

class _ThePivotInteractive extends StatefulWidget {
  @override
  State<_ThePivotInteractive> createState() => _ThePivotInteractiveState();
}

class _ThePivotInteractiveState extends State<_ThePivotInteractive> {
  // State for our "Live Preview"
  Color _previewColor = AppColors.dartCyan;
  double _borderRadius = 12.0;
  String _buttonText = "TAP ME";
  bool _isReloading = false;
  String _terminalLogs = "> System Ready";

  void _simulateHotReload() async {
    setState(() {
      _isReloading = true;
      _terminalLogs = "> hot reload requested...";
    });

    // Simulate the JIT compiler's speed
    await Future.delayed(const Duration(milliseconds: 400));

    if (mounted) {
      setState(() {
        _previewColor = _previewColor == AppColors.dartCyan
            ? Colors.orangeAccent
            : AppColors.dartCyan;
        _borderRadius = _borderRadius == 12.0 ? 50.0 : 12.0;
        _buttonText = _buttonText == "TAP ME" ? "RELOADED!" : "TAP ME";
        _isReloading = false;
        _terminalLogs = "> Reloaded in 412ms\n> JIT state preserved";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Row(
        children: [
          // ── LEFT: The Technical Depth ──────────────────────────────────────
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('The 2017 Pivot', style: TextStyles().title()),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 200,
                  child: Text(
                    'When Google launched Flutter, they needed a language that could handle two extremes at once:',
                    style: TextStyles().normal(),
                  ),
                ),
                const SizedBox(height: 32),
                _TechDetail(
                  title: 'Just-In-Time (JIT) Compilation',
                  desc:
                      'Used during development to enable "Hot Reload"—instantly updating UI while preserving application state.',
                  icon: Icons.bolt,
                  delay: 400,
                ),
                const SizedBox(height: 20),
                _TechDetail(
                  title: 'Ahead-Of-Time (AOT) Compilation',
                  desc:
                      'Produces fast, native ARM/x64 binaries for production-level performance on mobile and desktop.',
                  icon: Icons.settings_suggest,
                  delay: 600,
                ),
              ],
            ),
          ),

          const SizedBox(width: 40),

          // ── RIGHT: The "IDE" Simulator ─────────────────────────────────────
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Mock IDE Terminal
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Text(
                    _terminalLogs,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      color: Colors.greenAccent,
                      fontSize: 13,
                    ),
                  ),
                ),

                // Device Frame
                Container(
                  height: 400,
                  width: 240,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF121212),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                    border: Border.all(color: Colors.white24, width: 4),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: _previewColor.withAlpha(40),
                            borderRadius: BorderRadius.circular(_borderRadius),
                            border: Border.all(color: _previewColor, width: 2),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.flutter_dash,
                              color: _previewColor,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: AnimatedOpacity(
                            opacity: _isReloading ? 0.3 : 1.0,
                            duration: const Duration(milliseconds: 200),
                            child: ElevatedButton(
                              onPressed: _simulateHotReload,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _previewColor,
                                foregroundColor: Colors.black,
                                shape: const StadiumBorder(),
                              ),
                              child: Text(_buttonText),
                            ),
                          ),
                        ),
                      ),
                      if (_isReloading)
                        const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Click the device button to 'Hot Reload'",
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
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

// Custom widget for the bullet details
Widget _TechDetail({
  required String title,
  required String desc,
  required IconData icon,
  required int delay,
}) {
  return AnimatedFadeUp(
    delay: delay,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.dartCyan, size: 28),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                desc,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 15,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _PlatformEcosystem extends StatefulWidget {
  @override
  State<_PlatformEcosystem> createState() => _PlatformEcosystemState();
}

class _PlatformEcosystemState extends State<_PlatformEcosystem> {
  String _activeTarget = 'Mobile';

  final Map<String, Map<String, dynamic>> _platformData = {
    'Mobile': {
      'icon': Icons.phone_iphone,
      'engine': 'Impeller (iOS) / Skia (Android)',
      'pipeline': 'AOT ➜ Native ARM/x64',
      'highlights': [
        'Hardware-accelerated 60/120 FPS UI',
        'Direct Access: Camera, Bluetooth, Sensors',
        'Smallest runtime footprint (Native)',
        'Predictable performance (No GC stutters)',
      ],
      'bestFor': 'Consumer apps & high-performance UI',
    },
    'Web': {
      'icon': Icons.language,
      'engine': 'CanvasKit (Skia + Wasm)',
      'pipeline': 'dart2js / dart2wasm',
      'highlights': [
        'Wasm support for near-native web speed',
        'PWA support for offline installation',
        'SEO-friendly via HTML rendering mode',
        'CanvasKit for pixel-perfect graphics',
      ],
      'bestFor': 'Enterprise dashboards & SPAs',
    },
    'Desktop': {
      'icon': Icons.laptop,
      'engine': 'Win32 / Cocoa / GTK',
      'pipeline': 'Native C++ Embedder',
      'highlights': [
        'Native C-interop via Dart FFI',
        'System Tray & Multi-window support',
        'Full File System & Hardware access',
        'Standard installer (.exe, .pkg, .deb)',
      ],
      'bestFor': 'Productivity tools & IDEs',
    },
    'Server': {
      'icon': Icons.dns,
      'engine': 'Dart VM (JIT/AOT)',
      'pipeline': 'Self-contained Executable',
      'highlights': [
        'Isolate-based concurrency (No locks)',
        'Low cold-start time (Great for Lambda)',
        'Type-safe JSON & Protobuf handling',
        'Binary-size optimized for Docker',
      ],
      'bestFor': 'Microservices & CLI Tools',
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = _platformData[_activeTarget]!;

    return Wrapper(
      child: Column(
        children: [
          Text('Multi-Platform Mastery', style: TextStyles().title()),
          const SizedBox(height: 60),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── LEFT: Target Selector ────────────────────────────────────
                SizedBox(
                  width: 280,
                  child: Column(
                    children: _platformData.keys.map((target) {
                      bool isActive = _activeTarget == target;
                      return _PlatformTab(
                        label: target,
                        icon: _platformData[target]!['icon'],
                        isActive: isActive,
                        onTap: () => setState(() => _activeTarget = target),
                      );
                    }).toList(),
                  ),
                ),

                const SizedBox(width: 40),

                // ── RIGHT: The "Spec Sheet" ──────────────────────────────────
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      key: ValueKey(_activeTarget),
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _activeTarget.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                  color: AppColors.dartCyan,
                                ),
                              ),
                              _StatusChip('READY FOR BUILD'),
                            ],
                          ),
                          const SizedBox(height: 30),

                          // Technical Specs Grid
                          Row(
                            children: [
                              _SpecBox('Graphics Engine', data['engine']),
                              const SizedBox(width: 20),
                              _SpecBox('Compilation', data['pipeline']),
                            ],
                          ),

                          const SizedBox(height: 40),
                          const Text(
                            'CAPABILITIES',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Feature List
                          ...(data['highlights'] as List<String>).map(
                            (h) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.bolt,
                                    color: Colors.orangeAccent,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    h,
                                    style: const TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const Spacer(),
                          const Divider(color: Colors.white10),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Text(
                                'PRIMARY USE CASE: ',
                                style: TextStyle(
                                  color: AppColors.textMuted,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                data['bestFor'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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

// ── REUSABLE UI FRAGMENTS ───────────────────────────────────────────────────

Widget _PlatformTab({
  required String label,
  required IconData icon,
  required bool isActive,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: isActive ? AppColors.dartBlue : Colors.white.withAlpha(10),
        borderRadius: BorderRadius.circular(12),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: AppColors.dartBlue.withAlpha(100),
                  blurRadius: 15,
                ),
              ]
            : [],
      ),
      child: Row(
        children: [
          Icon(icon, color: isActive ? Colors.white : Colors.white54, size: 24),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white54,
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _SpecBox(String label, String value) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _StatusChip(String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.greenAccent.withAlpha(30),
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.greenAccent.withAlpha(100)),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Colors.greenAccent,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

// ── FRAME 4: PROS & CONS (The Split View) ─────────────────────────────────────

Widget _ProsConsBattle() {
  return Wrapper(
    child: Column(
      children: [
        Text('The Verdict', style: TextStyles().title()),
        const SizedBox(height: 60),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── PROS ──────────────────────────────────────────────────────
              Expanded(
                child: _SimpleVerdictCard(
                  title: 'ADVANTAGES',
                  color: Colors.greenAccent,
                  icon: Icons.check_circle_outline,
                  items: [
                    'Sound Null Safety (No crashes)',
                    '60/120 FPS via Impeller engine',
                    'Near-native Web speed with Wasm',
                    'Productive "Hot Reload" workflow',
                  ],
                  delay: 200,
                ),
              ),

              const SizedBox(width: 40),

              // ── CONS ──────────────────────────────────────────────────────
              Expanded(
                child: _SimpleVerdictCard(
                  title: 'CHALLENGES',
                  color: Colors.redAccent,
                  icon: Icons.highlight_off,
                  items: [
                    'Larger binary sizes than native',
                    'SEO complexity for web apps',
                    'Ecosystem is "Flutter-centric"',
                    'Niche usage for backend/CLI',
                  ],
                  delay: 400,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// ── SIMPLIFIED CARD WIDGET ──────────────────────────────────────────────────

Widget _SimpleVerdictCard({
  required String title,
  required Color color,
  required IconData icon,
  required List<String> items,
  required int delay,
}) {
  return AnimatedFadeUp(
    delay: delay,
    child: Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('•', style: TextStyle(color: color, fontSize: 20)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
// ── HELPER WIDGETS ───────────────────────────────────────────────────────────

Widget _TimelineNode({
  required String year,
  required String title,
  required String desc,
  required bool isLeft,
  required int delay,
}) {
  return AnimatedFadeUp(
    delay: delay,
    child: SizedBox(
      width: 700,
      child: Row(
        mainAxisAlignment: isLeft
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (!isLeft) const Spacer(),
          Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(10),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.dartBlue.withAlpha(50)),
            ),
            child: Column(
              crossAxisAlignment: isLeft
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  year,
                  style: const TextStyle(
                    color: AppColors.dartCyan,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: const TextStyle(color: AppColors.textSecondary),
                  textAlign: isLeft ? TextAlign.right : TextAlign.left,
                ),
              ],
            ),
          ),
          if (isLeft) const Spacer(),
        ],
      ),
    ),
  );
}

Widget _FeaturePill({
  required IconData icon,
  required String text,
  required int delay,
}) {
  return AnimatedFadeUp(
    delay: delay,
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.dartCyan, size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    ),
  );
}

Widget _ModernPlatformCard(IconData icon, String label, String sub, int delay) {
  return AnimatedFadeUp(
    delay: delay,
    child: Container(
      width: 220,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white.withAlpha(20), Colors.white.withAlpha(5)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withAlpha(10)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.dartBlue.withAlpha(40),
            radius: 30,
            child: Icon(icon, color: AppColors.dartCyan, size: 30),
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            sub,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _BattleColumn({
  required String title,
  required Color color,
  required List<String> items,
  required bool isLeft,
}) {
  return Expanded(
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.w900,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 40),
        ...items.asMap().entries.map(
          (e) => AnimatedFadeUp(
            delay: 200 + (e.key * 100),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              child: Row(
                children: [
                  if (!isLeft) Icon(Icons.close, color: color, size: 20),
                  if (isLeft) Icon(Icons.check_circle, color: color, size: 20),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      e.value,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
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
