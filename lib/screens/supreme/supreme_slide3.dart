import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class SupremeSlide3 extends StatefulWidget {
  const SupremeSlide3({super.key});

  @override
  State<SupremeSlide3> createState() => _SupremeSlide3State();
}

class _SupremeSlide3State extends State<SupremeSlide3> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      childrenSlides: [
        SupremeSlide3Frame1(),
        SupremeSlide3Frame2(),
        SupremeSlide3Frame3(),
        SupremeSlide3Frame4(),
        SupremeSlide3Frame5(),
        SupremeSlide3Frame6(),
        SupremeSlide3Frame7(),
        SupremeSlide3Frame8(),
        SupremeSlide3Frame9(),
        SupremeSlide3Frame10(),
        SupremeSlide3Frame11(),
        SupremeSlide3Frame12(),
      ],
      title: "Data Abstraction and OOP",
      subtitle: "Dart has it all",
    );
  }
}

// Frame 1
Widget SupremeSlide3Frame1() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Object-Oriented Foundation", style: TextStyles().title()),
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
                              "Everything assinged to a variable is an object",
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
                              "Standard class-based syntax",
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
                              "Uses syntactic sugar to assign parameters to fields instantly",
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
Widget SupremeSlide3Frame2() {
  String code = '''
  class Car {
    String color;
    // Dart's concise constructor syntax
    Car(this.color); 
  }

  var myCar = Car('Red');
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
Widget SupremeSlide3Frame3() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Encapsulation and Visibility", style: TextStyles().title()),
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
                              "Dart completely abandons public, private, or protected keywords",
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
                              "Privacy is restricted at the file level, not class level",
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
                              "Using an _ prefix makes something private to its file",
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
Widget SupremeSlide3Frame4() {
  String code = '''
  class BankAccount {
    // Private variable (only accessible within this specific Dart file)
    double _balance = 0.0; 

    // Public getter method
    double get balance => _balance; 
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
              constraints: BoxConstraints(maxHeight: 400, maxWidth: 700),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 5
Widget SupremeSlide3Frame5() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Inheritance and Polymorphism", style: TextStyles().title()),
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
                              "A class can only inherit from one superclass using keyword extends",
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
                              "Subclasses can override parent methods",
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
                              "All methods are virtual by default, no need to annotate explicitly",
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
Widget SupremeSlide3Frame6() {
  String code = '''
  class Animal {
    void speak() => print('Animal sound');
  }

  class Dog extends Animal {
    @override // Annotation ensures overriding a parent method
    void speak() => print('Woof!');
  }
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
Widget SupremeSlide3Frame7() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Interfaces and Abstract Classes", style: TextStyles().title()),
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
                              "Abstract Classes are declared with keyword abstract class",
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
                              "No keyword for interface, every class implicitly defines an interface",
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
                              "Can extend from one class but can implement multiple class interfaces",
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
Widget SupremeSlide3Frame8() {
  String code = '''
  abstract class Shape {
    void draw(); // Abstract method (no body)
  }

  // Circle must define ALL methods and fields from Shape
  class Circle implements Shape {
    @override
    void draw() { print('Drawing a circle'); }
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
              constraints: BoxConstraints(maxHeight: 450, maxWidth: 700),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 9
Widget SupremeSlide3Frame9() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Mixins", style: TextStyles().title()),
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
                              "A way to reuse a class's code in multiple heiarchies without using extends",
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
Widget SupremeSlide3Frame10() {
  String code = '''
  mixin Swimmer {
    void swim() => print('Swimming!');
  }

  mixin Flyer {
    void fly() => print('Flying!');
  }

  // Duck inherits from Bird, but gets behaviors from Swimmer and Flyer
  class Duck extends Bird with Swimmer, Flyer {}
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
              constraints: BoxConstraints(maxHeight: 500, maxWidth: 700),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}

// Frame 11
Widget SupremeSlide3Frame11() {
  return Wrapper(
    child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Static Members", style: TextStyles().title()),
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
                              "Keyword static for variables or methods that belong to class itself",
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
Widget SupremeSlide3Frame12() {
  String code = '''
  class MathUtils {
    static const double pi = 3.14159; // Class-level constant
    
    static int add(int a, int b) => a + b; // Class-level method
  }

  print(MathUtils.pi); // Accessed without creating a MathUtils object
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
              constraints: BoxConstraints(maxHeight: 500, maxWidth: 700),
              child: Center(child: CodeDisplay(code: code)),
            ),
          ),
        ],
      ),
    ),
  );
}
