import 'package:dart_presentation/screens/cover_slide.dart';
import 'package:dart_presentation/screens/rohan/slide1.dart';
import 'package:dart_presentation/screens/rohan/slide2.dart';
import 'package:dart_presentation/screens/rohan/slide3.dart';
import 'package:dart_presentation/screens/rohan/slide4.dart';
import 'package:dart_presentation/screens/rohan/slide5.dart';
import 'package:dart_presentation/screens/supreme/supreme_slide1.dart';
import 'package:dart_presentation/screens/supreme/supreme_slide2.dart';
import 'package:dart_presentation/screens/supreme/supreme_slide3.dart';
import 'package:dart_presentation/screens/supreme/supreme_slide4.dart';
import 'package:dart_presentation/screens/supreme/supreme_slide5.dart';
import 'package:dart_presentation/screens/supreme/supreme_slide6.dart';
import 'package:dart_presentation/screens/thank_you_slide.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SlideController extends InheritedWidget {
  final VoidCallback next;
  final VoidCallback previous;

  const SlideController({
    super.key,
    required this.next,
    required this.previous,
    required super.child,
  });

  static SlideController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SlideController>()!;
  }

  @override
  bool updateShouldNotify(SlideController oldWidget) => false;
}

class SlideRouter extends StatefulWidget {
  const SlideRouter({super.key});

  @override
  State<SlideRouter> createState() => _SlideRouterState();
}

class _SlideRouterState extends State<SlideRouter> {
  final PageController _controller = PageController();
  final FocusNode _focusNode = FocusNode();

  int _index = 0;

  final List<Widget> _slides = [
    const CoverSlide(),
    RohanSlide1(),
    RohanSlide2(),
    RohanSlide3(),
    RohanSlide4(),
    RohanSlide5(),
    SupremeSlide1(),
    SupremeSlide2(),
    SupremeSlide3(),
    SupremeSlide4(),
    SupremeSlide5(),
    SupremeSlide6(),
    const ThankYouSlide(),
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _next() {
    if (_index < _slides.length - 1) {
      setState(() {
        _index++;
      });
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previous() {
    if (_index > 0) {
      setState(() {
        _index--;
      });
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideController(
      next: _next,
      previous: _previous,
      child: KeyboardListener(
        focusNode: _focusNode,
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
              Positioned(
                bottom: 24,
                right: 32,
                child: Text(
                  '${_index + 1} of ${_slides.length}',
                  style: const TextStyle(
                    color: Colors.black26,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
