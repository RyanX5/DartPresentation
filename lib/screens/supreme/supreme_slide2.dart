import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class SupremeSlide2 extends StatefulWidget {
  const SupremeSlide2({super.key});

  @override
  State<SupremeSlide2> createState() => _SupremeSlide2State();
}

class _SupremeSlide2State extends State<SupremeSlide2> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      childrenSlides: [
        SupremeSlide2Frame1(),
        SupremeSlide2Frame2(),
        SupremeSlide2Frame3(),
        SupremeSlide2Frame4(),
        SupremeSlide2Frame5(),
        SupremeSlide2Frame6(),
        SupremeSlide2Frame7(),
        SupremeSlide2Frame8(),
        SupremeSlide2Frame9(),
        SupremeSlide2Frame10(),
        SupremeSlide2Frame11(),
        SupremeSlide2Frame12(),
      ],
      title: 'The Dart Type System',
      subtitle: "It is deceiving.",
    );
  }
}

// Frame 1
Widget SupremeSlide2Frame1() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Typing Implementation", style: TextStyles().title()),
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
                              "Static and Strongly Typed, checked at compile-time",
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
                              "Type Inference using keyword 'var'",
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
                              "Can explicitly bypass static typing using keyword 'dynamic'",
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
Widget SupremeSlide2Frame2() {
  String code = '''
  String name = 'Alice'; // Explicit static type
  var age = 30;          // Inferred as int
  dynamic anything = 5;  // Dynamic typing
  anything = 'hello';    // Allowed only because of 'dynamic'
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
              constraints: BoxConstraints(maxHeight: 300, maxWidth: 700),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 3
Widget SupremeSlide2Frame3() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No Primitives at alllllll", style: TextStyles().title()),
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
                              "Everything in Dart is an Object",
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
                              "Core types are int, double, bool, String, Null, etc.",
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
                              "Variables store references to objects.",
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

//Frame 4
Widget SupremeSlide2Frame4() {
  String code = '''
  int a = 10;
  int b = a;
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
              constraints: BoxConstraints(maxHeight: 200, maxWidth: 300),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
          AnimatedFadeUp(
            delay: 5000,
            child: Text(
              "Both point to the same '10' object in the memory",
              style: TextStyles(color: Colors.black).heading1(),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 5
Widget SupremeSlide2Frame5() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Composite Data Types", style: TextStyles().title()),
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
                              "Zero-indexed Lists that act like arrays",
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
                              "Sets and Maps are also available",
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
                              "No direct memory pointers like in C/C++",
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

//Frame 6
Widget SupremeSlide2Frame6() {
  String code = '''
  List<String> colors = ['Red', 'Green', 'Blue'];
  Set<int> uniqueNumbers = {1, 2, 3, 3}; // Contains {1, 2, 3}
  Map<String, int> scores = {'Alice': 95, 'Bob': 88};
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
              constraints: BoxConstraints(maxHeight: 250, maxWidth: 800),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 7
Widget SupremeSlide2Frame7() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Records", style: TextStyles().title()),
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
                              "Introduced in Dart 3",
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
                              "Immutable in nature",
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
                              "Perfect for returning multiple values from a function",
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

//Frame 8
Widget SupremeSlide2Frame8() {
  String code = '''
  // Defining a record
  (String, int, {bool isActive}) user = ('Alice', 25, isActive: true);

  // Accessing fields (positional using \$1, named directly)
  print(user.\$1); // 'Alice'
  print(user.isActive); // true
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
              constraints: BoxConstraints(maxHeight: 400, maxWidth: 800),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 9
Widget SupremeSlide2Frame9() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Generics and File Handling", style: TextStyles().title()),
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
                              "Generics are fulling supported for type-safe collections and classes <T>",
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
                              "File Handling is done through dart:io library",
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

//Frame 10
Widget SupremeSlide2Frame10() {
  String code = '''
  // Generics
  List<int> numbers = [1, 2, 3]; 

  // File Handling (requires 'import dart:io;')
  var file = File('data.txt');
  String contents = await file.readAsString(); // Async
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
              constraints: BoxConstraints(maxHeight: 350, maxWidth: 800),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 11
Widget SupremeSlide2Frame11() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Null Safety", style: TextStyles().title()),
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
                              "By default, types cannot contain null.",
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
                              "Eliminates null reference exceptions at runtime",
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

//Frame 12
Widget SupremeSlide2Frame12() {
  String code = '''
  String a = 'Hello, World!';
  String? b = null; // The '?' makes it nullable
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
              constraints: BoxConstraints(maxHeight: 350, maxWidth: 800),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
          AnimatedFadeUp(
            delay: 5000,
            child: Text(
              "String and String? are not the same",
              style: TextStyles(color: Colors.black).heading1(),
            ),
          ),
        ],
      ),
    ),
  );
}
