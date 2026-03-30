import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:flutter/material.dart';
import 'package:dart_presentation/screens/router.dart';

class ThankYouSlide extends StatelessWidget {
  const ThankYouSlide({super.key});

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
                AnimatedFadeUp(
                  delay: 200,
                  child: Icon(
                    Icons.check_circle_outline,
                    color: AppColors.dartCyan,
                    size: 80,
                  ),
                ),
                const SizedBox(height: 32),

                AnimatedFadeUp(
                  delay: 400,
                  child: Text(
                    'Thank You!',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -2,
                    ),
                  ),
                ),

                AnimatedFadeUp(
                  delay: 600,
                  child: Text(
                    'Any Questions?',
                    style: TextStyle(
                      fontSize: 32,
                      color: AppColors.dartCyan,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 4,
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                // Presenter recap
                AnimatedFadeUp(
                  delay: 800,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ContactInfo(
                        name: 'Rohan Upadhyay',
                        handle: 'github.com/RyanX5',
                      ),
                      const SizedBox(width: 60),
                      _ContactInfo(
                        name: 'Supreme Dallakoti',
                        handle: 'github.com/elSupremoo',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Technical Wit Footer
          Positioned(
            bottom: 40,
            left: 40,
            right: 40,
            child: AnimatedFadeUp(
              delay: 1000,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _StatusItem(Icons.error_outline, '0 Errors', Colors.white24),
                  _StatusItem(
                    Icons.warning_amber_outlined,
                    '0 Warnings',
                    Colors.white24,
                  ),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.refresh, size: 16),
                    label: const Text('RESTART DECK'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final String name, handle;
  const _ContactInfo({required this.name, required this.handle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          handle,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 14,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }
}

class _StatusItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _StatusItem(this.icon, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 14),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}

// Reusing background elements for consistency
class _SlideBackground extends StatelessWidget {
  const _SlideBackground();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.3, 0.4),
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
