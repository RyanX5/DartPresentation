import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class SupremeSlide1 extends StatefulWidget {
  const SupremeSlide1({super.key});

  @override
  State<SupremeSlide1> createState() => _SupremeSlide1State();
}

class _SupremeSlide1State extends State<SupremeSlide1> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      childrenSlides: [
        SupremeSlide1Frame1(),
        SupremeSlide1Frame2(),
        SupremeSlide1Frame3(),
        SupremeSlide1Frame4(),
        SupremeSlide1Frame5(),
        SupremeSlide1Frame6(),
        SupremeSlide1Frame7(),
        SupremeSlide1Frame8(),
        SupremeSlide1Frame9(),
        SupremeSlide1Frame10(),
        SupremeSlide1Frame11(),
      ],
      title: "Control Flow & Execution",
      subtitle: "Familiar structures with modern, expressive upgrades.",
    );
  }
}

// Frame 1
Widget SupremeSlide1Frame1() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Operator Precedence", style: TextStyles().title()),
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
                              "Higher precendence operators like * evaluate before lower ones like +",
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
                              "Evaluated left-to-right",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedFadeUp(
                      delay: 700,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Parenthesis () override default order",
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
Widget SupremeSlide1Frame2() {
  String code = '''
  int r1 = 5 + 3 * 2;   // 11 (Multiply first)
  int r2 = (5 + 3) * 2; // 16 (Parentheses override)
  bool b = true || false && false; // true (&& beats ||)
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
              constraints: BoxConstraints(maxHeight: 250, maxWidth: 600),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 3
Widget SupremeSlide1Frame3() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Core Control Flow", style: TextStyles().title()),
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
                              "Strictly requires boolean conditions, no Python-style truthy/falsy values",
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
                              "Supports C like standard for, while loops",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedFadeUp(
                      delay: 700,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Supports python like for-in loops",
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

// Frame 4
Widget SupremeSlide1Frame4() {
  String code1 = '''
  if (temp > 72) {
    print('Hot');
  } else {
    print('Cool');
  }
''';

  String code2 = '''
  while (x < 10) {
    print('Score too low!')
    x += 1;
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
          Row(
            spacing: 200,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedFadeUp(
                delay: 300,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 300, maxWidth: 600),
                  child: Center(child: CodeDisplay(code: code1)),
                ),
              ),
              AnimatedFadeUp(
                delay: 300,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 300, maxWidth: 600),
                  child: Center(child: CodeDisplay(code: code2)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Frame 5
Widget SupremeSlide1Frame5() {
  String code1 = '''
  for (int i = 0; i < 5; i++) {
    print(i);
  }
''';

  String code2 = '''
  for (var animal in animalList) {
    print(animal);
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
          Row(
            spacing: 200,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedFadeUp(
                delay: 300,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 220, maxWidth: 600),
                  child: Center(child: CodeDisplay(code: code1)),
                ),
              ),
              AnimatedFadeUp(
                delay: 300,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 220, maxWidth: 600),
                  child: Center(child: CodeDisplay(code: code2)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Frame 6
Widget SupremeSlide1Frame6() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Selection Structures", style: TextStyles().title()),
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
                              "No break; needed in switch cases, prevents accidental fall-through",
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

// Frame 7
Widget SupremeSlide1Frame7() {
  String code1 = '''
  switch (grade) {
    case 'A':
      print('Excellent');
    case 'B':
    case 'C':
      print('Pass');
    default:
      print('Fail');
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
          Row(
            spacing: 200,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedFadeUp(
                delay: 300,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 450, maxWidth: 600),
                  child: Center(child: CodeDisplay(code: code1)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Frame 8
Widget SupremeSlide1Frame8() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Exception Handling", style: TextStyles().title()),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  spacing: 25,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    AnimatedFadeUp(
                      delay: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "try: Wraps code that can be considered risky",
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
                              "on: Catches a specific exception type like in Java",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedFadeUp(
                      delay: 700,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "catch: Catches the error object and stack trace",
                              style: TextStyles().normal(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedFadeUp(
                      delay: 900,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "finally: Executes regardless of success or failure",
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

// Frame 9
Widget SupremeSlide1Frame9() {
  String code1 = '''
  try {
    int result = 10 ~/ 0 ;
  } on UnsupportedError {
    print('Specific error caught!');
  } catch (e) {
    print(e);
  } finally {
    print('Done!');
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
          Row(
            spacing: 200,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedFadeUp(
                delay: 300,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 450, maxWidth: 600),
                  child: Center(child: CodeDisplay(code: code1)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Frame 10
Widget SupremeSlide1Frame10() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Special operations", style: TextStyles().title()),
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
                              "Conditionally or iteratively build lists directly in declaration",
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
                              "Cascade Operator (..) can chain method calls on one object",
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

// Frame 11
Widget SupremeSlide1Frame11() {
  String code1 = '''
    var nav = ['Home', if (isLoggedIn) 'Admin'];

    var doubled = [for (var n in nums) n * 2];

    var car = Car()..color = 'black'..make = 'Toyota';
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
          Row(
            spacing: 200,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedFadeUp(
                delay: 300,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 450, maxWidth: 600),
                  child: Center(child: CodeDisplay(code: code1)),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
