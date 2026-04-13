import 'package:dart_presentation/screens/cover_slide.dart';
import 'package:dart_presentation/screens/thank_you_slide.dart';
import 'package:dart_presentation/screens/new_slides/slide01_introduction.dart';
import 'package:dart_presentation/screens/new_slides/slide02_background.dart';
import 'package:dart_presentation/screens/new_slides/slide03_domains.dart';
import 'package:dart_presentation/screens/new_slides/slide04_conditionals.dart';
import 'package:dart_presentation/screens/new_slides/slide05_iteration.dart';
import 'package:dart_presentation/screens/new_slides/slide06_operators.dart';
import 'package:dart_presentation/screens/new_slides/slide07_type_system.dart';
import 'package:dart_presentation/screens/new_slides/slide08_primitives.dart';
import 'package:dart_presentation/screens/new_slides/slide09_generics.dart';
import 'package:dart_presentation/screens/new_slides/slide10_functions.dart';
import 'package:dart_presentation/screens/new_slides/slide11_lambdas.dart';
import 'package:dart_presentation/screens/new_slides/slide12_advanced_control.dart';
import 'package:dart_presentation/screens/new_slides/slide13_classes.dart';
import 'package:dart_presentation/screens/new_slides/slide14_inheritance.dart';
import 'package:dart_presentation/screens/new_slides/slide15_interfaces.dart';
import 'package:dart_presentation/screens/new_slides/slide16_encapsulation.dart';
import 'package:dart_presentation/screens/new_slides/slide17_concurrency.dart';
import 'package:dart_presentation/screens/new_slides/slide18_compilation.dart';
import 'package:dart_presentation/screens/new_slides/slide19_demo.dart';
import 'package:dart_presentation/screens/new_slides/slide20_conclusion.dart';
import 'package:dart_presentation/services/remote_state.dart';
import 'package:dart_presentation/services/socket_service.dart';

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

const _kCheatCode = 'dart';

class _SlideRouterState extends State<SlideRouter> {
  final PageController _controller = PageController();
  final FocusNode _focusNode = FocusNode();

  int _index = 0;
  final List<String> _keyBuffer = [];

  final List<Widget> _slides = [
    const CoverSlide(),
    const Slide01Introduction(),
    const Slide02Background(),
    const Slide03Domains(),
    const Slide04Conditionals(),
    const Slide05Iteration(),
    const Slide06Operators(),
    const Slide07TypeSystem(),
    const Slide08Primitives(),
    const Slide09Generics(),
    const Slide10Functions(),
    const Slide11Lambdas(),
    const Slide12AdvancedControl(),
    const Slide13Classes(),
    const Slide14Inheritance(),
    const Slide15Interfaces(),
    const Slide16Encapsulation(),
    const Slide17Concurrency(),
    const Slide18Compilation(),
    const Slide19Demo(),
    const Slide20Conclusion(),
    const ThankYouSlide(),
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
    initSocketService();
    remoteGoToNotifier.addListener(_onRemoteState);
  }

  @override
  void dispose() {
    remoteGoToNotifier.removeListener(_onRemoteState);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onRemoteState() {
    final state = remoteGoToNotifier.value;
    if (state == null) return;
    final targetSlide = state.slide.clamp(0, _slides.length - 1);
    if (targetSlide != _index) {
      setState(() => _index = targetSlide);
      _controller.jumpToPage(targetSlide);
    }
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
            // Cheat code detection (always active)
            final char = event.character;
            if (char != null) {
              _keyBuffer.add(char);
              if (_keyBuffer.length > _kCheatCode.length) {
                _keyBuffer.removeAt(0);
              }
              if (_keyBuffer.join() == _kCheatCode) {
                keyboardEnabledNotifier.value = !keyboardEnabledNotifier.value;
                _keyBuffer.clear();
              }
            }

            if (!keyboardEnabledNotifier.value) return;
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

              // Slide counter - bottom right
              Positioned(
                bottom: 24,
                right: 32,
                child: ValueListenableBuilder<int>(
                  valueListenable: ValueNotifier(_index),
                  builder: (_, __, ___) => Text(
                    '${_index + 1} of ${_slides.length}',
                    style: const TextStyle(
                      color: Colors.black26,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
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
