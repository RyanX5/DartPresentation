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
import 'package:dart_presentation/services/remote_state.dart';
import 'package:dart_presentation/services/socket_service.dart';
import 'package:dart_presentation/utils/theme.dart';

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
          if (!keyboardEnabledNotifier.value) return;
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

              // Slide counter — bottom right
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

              // Keyboard toggle — bottom left
              Positioned(
                bottom: 16,
                left: 24,
                child: ValueListenableBuilder<bool>(
                  valueListenable: keyboardEnabledNotifier,
                  builder: (context, enabled, _) {
                    return Tooltip(
                      message: enabled
                          ? 'Keyboard navigation ON — click to disable'
                          : 'Keyboard navigation OFF — click to enable',
                      child: InkWell(
                        onTap: () {
                          keyboardEnabledNotifier.value = !enabled;
                          // Re-request focus so keyboard still fires through the listener
                          _focusNode.requestFocus();
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: enabled
                                ? AppColors.dartBlue.withAlpha(30)
                                : Colors.transparent,
                            border: Border.all(
                              color: enabled
                                  ? AppColors.dartBlue.withAlpha(80)
                                  : Colors.white.withAlpha(25),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                enabled
                                    ? Icons.keyboard
                                    : Icons.keyboard_hide,
                                size: 16,
                                color: enabled
                                    ? AppColors.dartCyan
                                    : Colors.white.withAlpha(60),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                enabled ? 'Keys ON' : 'Keys OFF',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: enabled
                                      ? AppColors.dartCyan
                                      : Colors.white.withAlpha(60),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
