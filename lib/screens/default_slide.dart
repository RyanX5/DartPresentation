import 'package:dart_presentation/screens/router.dart';
import 'package:dart_presentation/services/remote_state.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultSlide extends StatefulWidget {
  final List<Widget> childrenSlides;
  final String title;
  final String subtitle;

  const DefaultSlide({
    super.key,
    required this.childrenSlides,
    required this.title,
    required this.subtitle,
  });

  @override
  State<DefaultSlide> createState() => _DefaultSlideState();
}

class _DefaultSlideState extends State<DefaultSlide> {
  int _currentIndex = 0;
  bool get _movedToCorner =>
      _currentIndex != 0 && _currentIndex != _slides.length - 1;

  late FocusNode _focusNode;
  late List<Widget> _slides;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _slides = [
      const SizedBox.shrink(),
      ...widget.childrenSlides,
      const SizedBox.shrink(),
    ];
    remoteGoToNotifier.addListener(_onRemoteState);
  }

  @override
  void dispose() {
    remoteGoToNotifier.removeListener(_onRemoteState);
    _focusNode.dispose();
    super.dispose();
  }

  void _onRemoteState() {
    if (!mounted) return;
    final state = remoteGoToNotifier.value;
    if (state == null) return;
    // Ignore events meant for other slides
    final myIndex = SlideIndex.of(context);
    if (state.slide != myIndex) return;
    // frame 0 = title centered, frame N = content slide N
    final targetIndex = state.frame.clamp(0, widget.childrenSlides.length);
    if (targetIndex != _currentIndex) {
      setState(() => _currentIndex = targetIndex);
    }
  }

  void _next() {
    if (_currentIndex < _slides.length - 1) {
      setState(() => _currentIndex++);
    }
  }

  void _prev() {
    setState(() {
      _currentIndex = (_currentIndex - 1).clamp(0, _slides.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode..requestFocus(),
      onKeyEvent: (event) {
        if (!keyboardEnabledNotifier.value) return;
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.keyD)
            _next();
          else if (event.logicalKey == LogicalKeyboardKey.keyA)
            _prev();
        }
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            const _SlideBackground(),

            const _DecorativeGrid(),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      AppColors.dartBlue,
                      AppColors.dartCyan,
                      AppColors.dartBlue,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 1,
                color: AppColors.dartBlue.withAlpha(40),
              ),
            ),

            AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: _movedToCorner ? Alignment.topLeft : Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: AnimatedScale(
                  scale: _movedToCorner ? 0.62 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                    opacity: _movedToCorner ? 0.75 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: _TitleBlock(
                      title: widget.title,
                      subtitle: widget.subtitle,
                      centered: !_movedToCorner,
                    ),
                  ),
                ),
              ),
            ),

            ClipRect(
              child: _AnimatedSlideItem(
                key: ValueKey(_currentIndex),
                child: _slides[_currentIndex],
              ),
            ),

            if (_movedToCorner)
              Positioned(
                bottom: 28,
                left: 0,
                right: 0,
                child: _FrameDots(
                  total: _slides.length - 2,
                  current: _currentIndex - 1,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ── Background ───────────────────────────────────────────────────────────────

class _SlideBackground extends StatelessWidget {
  const _SlideBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.3, -0.4),
          radius: 1.4,
          colors: [
            Color(0xFF0D1B2A), // dark navy center
            Color(0xFF060D14), // near-black edges
          ],
        ),
      ),
    );
  }
}

// ── Subtle dot grid overlay ───────────────────────────────────────────────────

class _DecorativeGrid extends StatelessWidget {
  const _DecorativeGrid();

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.18,
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
    final paint = Paint()
      ..color = AppColors.dartBlue
      ..strokeWidth = 1;

    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Title block ───────────────────────────────────────────────────────────────

class _TitleBlock extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool centered;

  const _TitleBlock({
    required this.title,
    required this.subtitle,
    required this.centered,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Glowing blue label chip
        if (centered)
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.dartBlue.withAlpha(120),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.dartBlue.withAlpha(25),
            ),
            child: const Text(
              'DART PROGRAMMING LANGUAGE',
              style: TextStyle(
                color: AppColors.dartCyan,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.5,
              ),
            ),
          ),

        // Title with gradient shimmer
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, AppColors.dartCyan],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            title,
            textAlign: centered ? TextAlign.center : TextAlign.start,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 52,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              height: 1.1,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Subtitle
        Text(
          subtitle,
          textAlign: centered ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: Colors.white.withAlpha(130),
            fontSize: 22,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3,
          ),
        ),

        // Decorative line under title when centered
        if (centered) ...[
          const SizedBox(height: 28),
          Container(
            width: 60,
            height: 2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.dartBlue, AppColors.dartCyan],
              ),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
        ],
      ],
    );
  }
}

// ── Frame dots ────────────────────────────────────────────────────────────────

class _FrameDots extends StatelessWidget {
  final int total;
  final int current;
  const _FrameDots({required this.total, required this.current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final active = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: active ? AppColors.dartBlue : Colors.white.withAlpha(40),
          ),
        );
      }),
    );
  }
}

// ── Slide content fade-in ─────────────────────────────────────────────────────

class _AnimatedSlideItem extends StatelessWidget {
  final Widget child;
  const _AnimatedSlideItem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
      tween: Tween<double>(begin: 30, end: 0),
      builder: (context, value, child) {
        return Opacity(
          opacity: (1 - (value / 30)).clamp(0.0, 1.0),
          child: child,
        );
      },
      child: child,
    );
  }
}
