import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:flutter/material.dart';

class CoverSlide extends StatelessWidget {
  const CoverSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const _SlideBackground(),
          const _DecorativeGrid(),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Glowing Category Chip
                AnimatedFadeUp(
                  delay: 200,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.dartCyan.withAlpha(100),
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.dartBlue.withAlpha(30),
                    ),
                    child: const Text(
                      'CSCI 282: PROGRAMMING LANGUAGES',
                      style: TextStyle(
                        color: AppColors.dartCyan,
                        letterSpacing: 3,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Main Title
                AnimatedFadeUp(
                  delay: 400,
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.white, AppColors.dartCyan],
                    ).createShader(bounds),
                    child: const Text(
                      'Dart',
                      style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -4,
                      ),
                    ),
                  ),
                ),

                // Subtitle
                AnimatedFadeUp(
                  delay: 600,
                  child: Text(
                    'Conceptual & Practical Analysis',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white.withAlpha(150),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                // Presenters
                AnimatedFadeUp(
                  delay: 800,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _PresenterTag(
                        name: 'Rohan Upadhyay',
                        role: 'Presenter 1',
                      ),
                      const SizedBox(width: 40),
                      _PresenterTag(
                        name: 'Supreme Dallakoti',
                        role: 'Presenter 2',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Instruction hint
          const Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: AnimatedFadeUp(
              delay: 1200,
              child: Center(
                child: Text(
                  'Press → to Begin',
                  style: TextStyle(
                    color: Colors.white24,
                    letterSpacing: 2,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusing your background components for seamless transitions
class _SlideBackground extends StatelessWidget {
  const _SlideBackground();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.3, -0.4),
          radius: 1.4,
          colors: [Color(0xFF0D1B2A), Color(0xFF060D14)],
        ),
      ),
    );
  }
}

class _DecorativeGrid extends StatelessWidget {
  const _DecorativeGrid();
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.1,
      child: CustomPaint(
        painter: _DotGridPainter(),
        child: const SizedBox.expand(),
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.dartBlue;
    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PresenterTag extends StatelessWidget {
  final String name, role;
  const _PresenterTag({required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          role,
          style: const TextStyle(
            color: AppColors.dartCyan,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
