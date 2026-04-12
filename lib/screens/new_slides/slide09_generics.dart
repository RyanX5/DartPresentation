import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide09Generics extends StatelessWidget {
  const Slide09Generics({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Advanced Types & Generics',
      subtitle: 'Value vs reference, generics, and dart:io.',
      childrenSlides: [
        _ValueRefFrame(),
        _GenericsFrame(),
        _DartIoFrame(),
      ],
    );
  }
}

// ── Frame 1: Value vs Reference Semantics ─────────────────────────────────────

class _ValueRefFrame extends StatelessWidget {
  const _ValueRefFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeUp(
                  delay: 100,
                  child: const Text('VALUE VS REFERENCE',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'How are variables copied\nand compared in Dart?',
                    style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800, height: 1.2),
                  ),
                ),
                const SizedBox(height: 36),
                AnimatedFadeUp(
                  delay: 400,
                  child: _SemCard(
                    icon: Icons.content_copy,
                    color: AppColors.dartBlue,
                    title: 'Value Semantics',
                    subtitle: 'int, double, bool, String',
                    desc: 'When you assign or pass these, you get an independent copy. Changing one does not affect the other.',
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(
                  delay: 600,
                  child: _SemCard(
                    icon: Icons.link,
                    color: Colors.orangeAccent,
                    title: 'Reference Semantics',
                    subtitle: 'List, Map, Set, Objects',
                    desc: 'Variables hold a reference to the same object in memory. Mutating it through one variable affects all references.',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 6,
            child: AnimatedFadeUp(
              delay: 300,
              child: CodeDisplay(
                fontSize: 14,
                code: '''// Primitives: copied
int a = 10, b = a;
b = 99;
print(a); // 10 - unaffected

// Objects: shared reference
var list1 = [1, 2, 3];
var list2 = list1;
list2.add(4);
print(list1); // [1, 2, 3, 4]!

var copy = [...list1]; // explicit copy''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SemCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String desc;
  const _SemCard({required this.icon, required this.color, required this.title, required this.subtitle, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withAlpha(55)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.white54, fontSize: 12, fontFamily: 'monospace')),
                const SizedBox(height: 8),
                Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Frame 2: Generics ──────────────────────────────────────────────────────────

class _GenericsFrame extends StatelessWidget {
  const _GenericsFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: AnimatedFadeUp(
              delay: 200,
              child: CodeDisplay(
                fontSize: 14,
                code: '''class Box<T> {
  T value;
  Box(this.value);
}

var intBox = Box<int>(42);
var strBox = Box<String>('hi');

List<String> names = ['Alice', 'Bob'];
// names.add(42); // COMPILE ERROR

T first<T>(List<T> items) => items[0];
print(first([10, 20, 30])); // 10

double sum<T extends num>(List<T> list) =>
    list.fold(0.0, (a, e) => a + e);''',
              ),
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeUp(
                  delay: 100,
                  child: const Text('GENERICS',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Write once, type-safe for any type.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _GenPoint(Icons.widgets, AppColors.dartBlue,
                    'Generic classes', 'Box<T> works with int, String, or any type - type-checked at compile time.')),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 550, child: _GenPoint(Icons.functions, Colors.orangeAccent,
                    'Generic functions', 'Functions can have their own type parameters, inferred from arguments.')),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 700, child: _GenPoint(Icons.fence, const Color(0xFF7C4DFF),
                    'Bounded type params', '<T extends num> constrains T to numeric types - gives access to arithmetic operators.')),
                const SizedBox(height: 24),
                AnimatedFadeUp(
                  delay: 850,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white.withAlpha(20)),
                    ),
                    child: const Text(
                      'Unlike Java, Dart generics are reified at runtime - you can actually check List<int> vs List<String> with is.',
                      style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _GenPoint(IconData icon, Color color, String title, String desc) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, color: color, size: 22),
      const SizedBox(width: 14),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.bold)),
            Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.4)),
          ],
        ),
      ),
    ],
  );
}

// ── Frame 3: dart:io File Handling ─────────────────────────────────────────────

class _DartIoFrame extends StatelessWidget {
  const _DartIoFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeUp(
                  delay: 100,
                  child: const Text('DART:IO',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Standard file and I/O handling for desktop and server.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _IoFeature(Icons.file_open, AppColors.dartBlue,
                    'File reading/writing', 'Synchronous and async variants. readAsStringSync(), writeAsStringSync().')),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 550, child: _IoFeature(Icons.folder_open, Colors.orangeAccent,
                    'Directory operations', 'List, create, delete directories. Directory(\'/path\').listSync().')),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 700, child: _IoFeature(Icons.http, Colors.greenAccent,
                    'HTTP client/server', 'dart:io provides low-level HTTP. Use the http package for higher-level.')),
                const SizedBox(height: 16),
                AnimatedFadeUp(delay: 850, child: _IoFeature(Icons.warning, const Color(0xFFFF6B6B),
                    'Desktop/server only', 'dart:io is not available on Flutter web - use dart:html or packages instead.')),
              ],
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            flex: 6,
            child: AnimatedFadeUp(
              delay: 300,
              child: CodeDisplay(
                fontSize: 14,
                code: """import 'dart:io';

// Synchronous read
String readSync(String path) =>
    File(path).readAsStringSync();

// Async read (preferred)
Future<String> readAsync(String path) async =>
    await File(path).readAsString();

// Write
void write(String path, String data) =>
    File(path).writeAsStringSync(data);

// List a directory
void listDir(String path) {
  for (var e in Directory(path).listSync()) {
    print(e.path);
  }
}

void main() async {
  write('/tmp/test.txt', 'Hello Dart!');
  print(await readAsync('/tmp/test.txt'));
}""",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IoFeature extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _IoFeature(this.icon, this.color, this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.bold)),
              Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13, height: 1.3)),
            ],
          ),
        ),
      ],
    );
  }
}
