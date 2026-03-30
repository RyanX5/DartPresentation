import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:dart_presentation/widgets/dartpad/dartpad_embed.dart';

class SupremeSlide5 extends StatefulWidget {
  const SupremeSlide5({super.key});

  @override
  State<SupremeSlide5> createState() => _SupremeSlide5State();
}

class _SupremeSlide5State extends State<SupremeSlide5> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      childrenSlides: [
        SupremeSlide5Frame1(),
        SupremeSlide5Frame2(),
        SupremeSlide5Frame3(),
        SupremeSlide5Frame4(),
        SupremeSlide5Frame5(),
        SupremeSlide5Frame6(),
      ],
      title: 'Unique Features',
      subtitle: 'What makes dart special?',
    );
  }
}

// Frame 1
Widget SupremeSlide5Frame1() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("The Event Loop", style: TextStyles().title()),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  spacing: 25,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    AnimatedFadeUp(
                      delay: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Dart runs single-threaded by default",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    AnimatedFadeUp(
                      delay: 500,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Handles concurrency using Future and Stream without blocking the main thread",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

//Frame 2
Widget SupremeSlide5Frame2() {
  String code = '''
  Future<void> fetchUserData() async {
    print('Fetching...');
    // The event loop is free to do other things while waiting
    String data = await api.getUser(); 
    print('Data loaded: \$data');
  }
''';

  return Wrapper(
    child: Center(
      child: Column(
        spacing: 50,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: Text(
              "Sample code",
              style: TextStyles(color: Colors.black).heading1(),
            ),
          ),
          AnimatedFadeUp(
            delay: 300,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 350, maxWidth: 700),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 3
Widget SupremeSlide5Frame3() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Garbage Collection", style: TextStyles().title()),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  spacing: 25,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    AnimatedFadeUp(
                      delay: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Dart handles memory allocation and deallocation automatically",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    AnimatedFadeUp(
                      delay: 500,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Features Generational GC with one young space and one old space",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget SupremeSlide5Frame4() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Dual Compiler", style: TextStyles().title()),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  spacing: 25,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    AnimatedFadeUp(
                      delay: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Dart has two compilation modes, Just-In-Time and Ahead-Of-Time",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget SupremeSlide5Frame5() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Ahead-Of-Time", style: TextStyles().title()),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  spacing: 25,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    AnimatedFadeUp(
                      delay: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Used for production, compiles down to native ARM/x64 code, very fast.",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget SupremeSlide5Frame6() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Just-In-Time", style: TextStyles().title()),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  spacing: 25,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    AnimatedFadeUp(
                      delay: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Used during development, allows stateful hot reload",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    AnimatedFadeUp(
                      delay: 500,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Can compile only the part that changed, like UI components",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
