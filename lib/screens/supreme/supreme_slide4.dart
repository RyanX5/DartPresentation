import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class SupremeSlide4 extends StatefulWidget {
  const SupremeSlide4({super.key});

  @override
  State<SupremeSlide4> createState() => _SupremeSlide4State();
}

class _SupremeSlide4State extends State<SupremeSlide4> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      childrenSlides: [
        SupremeSlide4Frame1(),
        SupremeSlide4Frame2(),
        SupremeSlide4Frame3(),
        SupremeSlide4Frame4(),
        SupremeSlide4Frame5(),
        SupremeSlide4Frame6(),
        SupremeSlide4Frame7(),
        SupremeSlide4Frame8(),
        SupremeSlide4Frame9(),
        SupremeSlide4Frame10(),
      ],
      title: "Subroutines and Control Abstraction",
      subtitle: "Pass anything.",
    );
  }
}

// Frame 1
Widget SupremeSlide4Frame1() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Parameter Passing Mechanics", style: TextStyles().title()),
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
                              "Dart passes the reference to an object by value",
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
                              "Immutable core types, new object created when value is changed",
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
Widget SupremeSlide4Frame2() {
  String code = '''
  void modify(int a, List<int> list) {
    a = 99;
    list.add(99);   // Mutates the referenced object (Original changed)
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
              style: TextStyles(color: Colors.white).heading1(),
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
Widget SupremeSlide4Frame3() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("First-Class Functions", style: TextStyles().title()),
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
                              "Functions are objects of type Function",
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
                              "Can assign to variables, pass as arguments, or return them from functions",
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
Widget SupremeSlide4Frame4() {
  String code = '''
  void sayHello(String name) => print('Hello \$name');

  void executeCallback(Function callback) {
    callback('Alice'); // Executing the passed function
  }

  var myFunc = sayHello; // Assigned to a variable
  executeCallback(myFunc);
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
              style: TextStyles(color: Colors.white).heading1(),
            ),
          ),
          AnimatedFadeUp(
            delay: 300,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 450, maxWidth: 700),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 5
Widget SupremeSlide4Frame5() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Anonymous Functions and Lambdas", style: TextStyles().title()),
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
                              "Lamdas used for callbacks and collection iteration",
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
                              "Can use both Block Syntax {} and Arrow Syntax =>",
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
Widget SupremeSlide4Frame6() {
  String code = '''
  var list = ['Apples', 'Bananas', 'Oranges'];

  // Block syntax
  list.forEach((item) {
    print(item); 
  });

  // Arrow syntax (Lambda equivalent)
  var loudList = list.map((item) => item.toUpperCase());
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
              style: TextStyles(color: Colors.white).heading1(),
            ),
          ),
          AnimatedFadeUp(
            delay: 300,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 450, maxWidth: 700),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 7
Widget SupremeSlide4Frame7() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Generators or Coroutines", style: TextStyles().title()),
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
                              "To produce a sequence of values on-demand using keyword yield",
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
                              "Synchronous type returns an Iterable, pausing execution until next value is requested",
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
                              "Asynchronous type returns a Stream, yields value over time",
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
Widget SupremeSlide4Frame8() {
  String code1 = '''
  // Synchronous Generator
  Iterable<int> countDown(int max) sync* {
    while (max > 0) {
      yield max; // Emits value, then pauses until next iteration
      max--;
    }
  }

  print(countDown(3).toList()); // Outputs: [3, 2, 1]
''';

  String code2 = '''
  // Defining a specific function signature
  typedef MathOperation = int Function(int a, int b);

  int add(int a, int b) => a + b;
  int multiply(int a, int b) => a * b;

  void calculate(MathOperation op) {
    print(op(5, 5)); // Guaranteed to take two ints and return an int
  }

  calculate(multiply); // Outputs: 25
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
              style: TextStyles(color: Colors.white).heading1(),
            ),
          ),
          Row(
            spacing: 200,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedFadeUp(
                delay: 300,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 500, maxWidth: 600),
                  child: Center(child: CodeDisplay(code: code1)),
                ),
              ),
              AnimatedFadeUp(
                delay: 300,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 550, maxWidth: 600),
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

// Frame 9
Widget SupremeSlide4Frame9() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Function Types", style: TextStyles().title()),
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
                              "Keyword typedef allows definition of a specific signature for a function",
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
                              "Replaces the need for C# style delegates",
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
Widget SupremeSlide4Frame10() {
  String code = '''
  // Defining a specific function signature
  typedef MathOperation = int Function(int a, int b);

  int add(int a, int b) => a + b;
  int multiply(int a, int b) => a * b;

  void calculate(MathOperation op) {
    print(op(5, 5)); // Guaranteed to take two ints and return an int
  }

  calculate(multiply); // Outputs: 25
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
              style: TextStyles(color: Colors.white).heading1(),
            ),
          ),
          AnimatedFadeUp(
            delay: 300,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 550, maxWidth: 700),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}
