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
      _currentIndex != 0 && _currentIndex != widget.childrenSlides.length - 1;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    widget.childrenSlides.insert(0, const SizedBox.shrink());
    widget.childrenSlides.add(const SizedBox.shrink());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentIndex < widget.childrenSlides.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _prev() {
    setState(() {
      _currentIndex = (_currentIndex - 1).clamp(
        0,
        widget.childrenSlides.length - 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode..requestFocus(),
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.keyD) {
            _next();
          } else if (event.logicalKey == LogicalKeyboardKey.keyA) {
            _prev();
          }
        }
      },
      child: Material(
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: _movedToCorner ? Alignment.topLeft : Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: AnimatedScale(
                  scale: _movedToCorner ? 0.7 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                    opacity: _movedToCorner ? 0.85 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: _movedToCorner
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        Text(widget.title, style: TextStyles().title()),
                        const SizedBox(height: 10),
                        Text(widget.subtitle, style: TextStyles().subtitle()),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            _AnimatedSlideItem(
              key: ValueKey(_currentIndex),
              child: widget.childrenSlides[_currentIndex],
            ),
          ],
        ),
      ),
    );
  }
}

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
