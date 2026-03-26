import 'package:dart_presentation/screens/rohan/slide1.dart';
import 'package:dart_presentation/screens/rohan/slide2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SlideRouter extends StatefulWidget {
  const SlideRouter({super.key});

  @override
  State<SlideRouter> createState() => _SlideRouterState();
}

class _SlideRouterState extends State<SlideRouter> {
  final PageController _controller = PageController();
  int _index = 0;

  // just add your slides here
  final List<Widget> _slides = [Slide1(), Slide2()];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // next page logic
  void _next() {
    if (_index < _slides.length - 1) {
      setState(() {
        _index += 1;
      });

      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // previous page logic
  void _previous() {
    if (_index > 0) {
      setState(() {
        _index -= 1;
      });
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      autofocus: true,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            _next();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            _previous();
          }
        }
      },
      child: Material(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: _slides,
            ),

            // a slide number at the bottom?
            Positioned(
              bottom: 24,
              right: 32,
              child: Text(
                '${_index + 1} of ${_slides.length}',
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
