import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class Slide16Encapsulation extends StatelessWidget {
  const Slide16Encapsulation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Encapsulation & Static Members',
      subtitle: 'Privacy, statics, and library-level access control.',
      childrenSlides: [
        _StaticFrame(),
        _PrivacyFrame(),
        _ComparisonFrame(),
      ],
    );
  }
}

// ── Frame 1: Static Members ────────────────────────────────────────────────────

class _StaticFrame extends StatelessWidget {
  const _StaticFrame();

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
                  child: const Text('STATIC MEMBERS',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Static members belong to the class, not an instance.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(delay: 400, child: _StatBox(
                  'static variable',
                  AppColors.dartBlue,
                  'Shared across all instances. Lives for the lifetime of the class.',
                  'Counter.count',
                )),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 550, child: _StatBox(
                  'static method',
                  Colors.orangeAccent,
                  'Called on the class, not on an object. No access to this.',
                  'MathUtils.clamp(v, 0, 100)',
                )),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 700, child: _StatBox(
                  'static const',
                  Colors.greenAccent,
                  'Compile-time constant attached to the class - a common pattern for configuration.',
                  'Config.maxRetries',
                )),
                const SizedBox(height: 14),
                AnimatedFadeUp(delay: 850, child: _StatBox(
                  'factory constructor',
                  Colors.purpleAccent,
                  'A constructor that returns an existing instance (e.g., singleton pattern).',
                  'Database.instance',
                )),
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
                code: '''class Counter {
  static int _count = 0;
  Counter() { _count++; }
  static int get count => _count;
}
Counter(); Counter();
print(Counter.count); // 2 - shared state

// Singleton via factory constructor
class Database {
  static final Database _instance = Database._();
  Database._();
  factory Database() => _instance;
}
print(identical(Database(), Database())); // true

class Config {
  static const int maxRetries = 3;
}''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String type;
  final Color color;
  final String desc;
  final String example;
  const _StatBox(this.type, this.color, this.desc, this.example);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withAlpha(12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(45)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(type, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(example, style: const TextStyle(color: Colors.white38, fontSize: 11, fontFamily: 'monospace')),
            ],
          ),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, height: 1.4)),
        ],
      ),
    );
  }
}

// ── Frame 2: Library-Level Privacy ────────────────────────────────────────────

class _PrivacyFrame extends StatelessWidget {
  const _PrivacyFrame();

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
                code: '''class BankAccount {
  double _balance;      // private (file-level)
  final String owner;

  BankAccount(this.owner, double initial)
      : _balance = initial;

  double get balance => _balance; // public getter

  bool deposit(double amount) {
    if (amount <= 0) return false;
    _balance += amount;
    return true;
  }
}

// From another file:
// acct._balance = 999; // COMPILE ERROR
// acct.balance;        // OK - public getter''',
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
                  child: const Text('LIBRARY-LEVEL ENCAPSULATION',
                      style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 16),
                AnimatedFadeUp(
                  delay: 250,
                  child: const Text(
                    'Privacy is at the library level, not the class level.',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800, height: 1.3),
                  ),
                ),
                const SizedBox(height: 32),
                AnimatedFadeUp(
                  delay: 400,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.dartBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.dartBlue.withAlpha(60)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Key rule', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(
                          'Prefix any identifier with _ to make it private to its library (file).\n\nThis means two classes in the same file CAN access each other\'s private members.',
                          style: TextStyle(color: Colors.white.withAlpha(160), fontSize: 14, height: 1.6),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedFadeUp(delay: 600, child: _PrivBox('_variable', AppColors.dartBlue, 'Private field or variable')),
                const SizedBox(height: 10),
                AnimatedFadeUp(delay: 700, child: _PrivBox('_method()', Colors.orangeAccent, 'Private method')),
                const SizedBox(height: 10),
                AnimatedFadeUp(delay: 800, child: _PrivBox('_ClassName', const Color(0xFF7C4DFF), 'Private class (rare but valid)')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivBox extends StatelessWidget {
  final String syntax;
  final Color color;
  final String desc;
  const _PrivBox(this.syntax, this.color, this.desc);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withAlpha(15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Row(
        children: [
          Text(syntax, style: TextStyle(color: color, fontSize: 14, fontFamily: 'monospace', fontWeight: FontWeight.bold)),
          const SizedBox(width: 12),
          Expanded(child: Text(desc, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13))),
        ],
      ),
    );
  }
}

// ── Frame 3: Java / Python / Dart Privacy Comparison ─────────────────────────

class _ComparisonFrame extends StatelessWidget {
  const _ComparisonFrame();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedFadeUp(
            delay: 100,
            child: const Text('JAVA / PYTHON / DART COMPARISON',
                style: TextStyle(color: AppColors.dartCyan, fontSize: 13, letterSpacing: 3, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          AnimatedFadeUp(
            delay: 200,
            child: const Text(
              'Three very different approaches to privacy.',
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(height: 28),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: AnimatedFadeUp(delay: 300, child: _PrivPanel(
                  lang: 'Java',
                  color: Colors.orangeAccent,
                  mechanism: 'private keyword',
                  enforcement: 'Compile-time',
                  granularity: 'Class-level',
                  notes: [
                    'private, protected, public, package',
                    'Verbose - must annotate every member',
                    'private in same class; package for library',
                    'Enforced strictly by the compiler',
                  ],
                  code: '''private double balance;
public double getBalance() {
    return balance;
}''',
                ))),
                const SizedBox(width: 16),
                Expanded(child: AnimatedFadeUp(delay: 450, child: _PrivPanel(
                  lang: 'Python',
                  color: Colors.yellowAccent,
                  mechanism: '_ convention',
                  enforcement: 'Convention only',
                  granularity: 'None (just hints)',
                  notes: [
                    '_name: "please don\'t touch"',
                    '__name: name mangling (weak protection)',
                    'Nothing is truly private - duck typing',
                    'Relies on developer discipline',
                  ],
                  code: '''self._balance = 0  # soft private
self.__balance = 0 # name mangled
# Both accessible from outside!''',
                ))),
                const SizedBox(width: 16),
                Expanded(child: AnimatedFadeUp(delay: 600, child: _PrivPanel(
                  lang: 'Dart',
                  color: AppColors.dartCyan,
                  mechanism: '_ prefix',
                  enforcement: 'Compile-time',
                  granularity: 'Library-level',
                  notes: [
                    'Simple: just prefix with _',
                    'Enforced by the compiler - not convention',
                    'Private to the whole file, not just the class',
                    'No modifiers, no verbosity',
                  ],
                  code: '''double _balance = 0;
double get balance => _balance;
// _balance inaccessible from other files''',
                ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivPanel extends StatelessWidget {
  final String lang;
  final Color color;
  final String mechanism;
  final String enforcement;
  final String granularity;
  final List<String> notes;
  final String code;
  const _PrivPanel({required this.lang, required this.color, required this.mechanism,
    required this.enforcement, required this.granularity, required this.notes, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha(10),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withAlpha(55)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            ),
            child: Row(
              children: [
                Text(lang, style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _MiniRow('Mechanism', mechanism, color),
                _MiniRow('Enforcement', enforcement, color),
                _MiniRow('Granularity', granularity, color),
                const SizedBox(height: 12),
                ...notes.map((n) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.circle, color: color.withAlpha(150), size: 6),
                      const SizedBox(width: 8),
                      Expanded(child: Text(n, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, height: 1.3))),
                    ],
                  ),
                )),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(8)),
                  child: Text(code, style: TextStyle(color: color.withAlpha(200), fontSize: 11, fontFamily: 'monospace', height: 1.5)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _MiniRow(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(width: 6),
          Expanded(child: Text(value, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
