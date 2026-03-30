import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class RohanSlide3 extends StatefulWidget {
  const RohanSlide3({super.key});

  @override
  State<RohanSlide3> createState() => _RohanSlide3State();
}

class _RohanSlide3State extends State<RohanSlide3> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Names, Scopes & Bindings',
      subtitle: 'How Dart connects names to values.',
      childrenSlides: [
        const _DeclKeywords(),
        const _BindingTime(),
        const _FinalVsConstBattle(),
        const _LexicalScopeVisual(),
        const _ScopeShadowing(),
        const _ClosureMachine(),
        const _LateBindings(),
      ],
    );
  }
}

class _DeclKeywords extends StatelessWidget {
  const _DeclKeywords();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Declaration Keywords', style: TextStyles().title()),
            const SizedBox(height: 20),
            const Text(
              'Dart gives you three ways to declare a name, each with a different contract.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _KeywordCard(
                  keyword: 'var',
                  color: AppColors.dartBlue,
                  label: 'INFERRED',
                  desc:
                      'Type determined at first assignment. Can be reassigned to any value of the same type.',
                ),
                const SizedBox(width: 24),
                _KeywordCard(
                  keyword: 'final',
                  color: Colors.orangeAccent,
                  label: 'RUNTIME IMMUTABLE',
                  desc:
                      'Set once and evaluated when the line runs. Cannot be reassigned after initialization.',
                ),
                const SizedBox(width: 24),
                _KeywordCard(
                  keyword: 'const',
                  color: Colors.greenAccent,
                  label: 'COMPILE-TIME',
                  desc:
                      'Must be known at compile time. Hard-coded into the binary. Deeply immutable.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BindingTime extends StatelessWidget {
  const _BindingTime();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Binding Time', style: TextStyles().title()),
            const SizedBox(height: 16),
            const Text(
              'In PL theory, binding time = when a name gets connected to its value or type.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeUp(
                  delay: 200,
                  child: _BindingTimeCard(
                    phase: 'Compile Time',
                    color: Colors.greenAccent,
                    icon: Icons.build_outlined,
                    examples: [
                      'const pi = 3.14  →  value baked into binary',
                      'var x = 42  →  type inferred as int',
                      'Type errors flagged before execution',
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                AnimatedFadeUp(
                  delay: 450,
                  child: _BindingTimeCard(
                    phase: 'Load Time',
                    color: Colors.orangeAccent,
                    icon: Icons.upload_outlined,
                    examples: [
                      'Top-level variables initialized',
                      'Static class fields set up',
                      'Library imports resolved',
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                AnimatedFadeUp(
                  delay: 700,
                  child: _BindingTimeCard(
                    phase: 'Runtime',
                    color: AppColors.dartCyan,
                    icon: Icons.play_arrow_outlined,
                    examples: [
                      'final now = DateTime.now()',
                      'Instance fields via constructors',
                      'Function parameters per call',
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
}

class _FinalVsConstBattle extends StatelessWidget {
  const _FinalVsConstBattle();

  @override
  Widget build(BuildContext context) {
    const code = '''
void main() {
  // FINAL is evaluated at runtime, set once
  final now = DateTime.now(); // OK: runtime value
  // now = DateTime.now();    // ERROR: can't reassign

  // CONST must be known at compile time
  const pi = 3.14159;
  // const t = DateTime.now(); // ERROR: not compile-time

  // const gives deep immutability on collections
  const colors = ['red', 'green', 'blue'];
  // colors.add('yellow'); // ERROR because immutable list
  
  final mutable = ['red', 'green'];
  mutable.add('blue'); // OK: final != immutable contents
}''';

    return _CodeFrameLayout(
      title: 'final vs const',
      subtitle: 'Both prevent reassignment, but const goes deeper.',
      child: CodeDisplay(code: code),
    );
  }
}

class _LexicalScopeVisual extends StatelessWidget {
  const _LexicalScopeVisual();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Lexical Scoping', style: TextStyles().title()),
            const SizedBox(height: 16),
            const Text(
              "A name's scope is determined by where it's written, NOT where it's called from.",
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
            const SizedBox(height: 40),
            // Nested scope diagram
            Container(
              constraints: const BoxConstraints(maxWidth: 860),
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.dartBlue, width: 2),
                borderRadius: BorderRadius.circular(20),
                color: AppColors.dartBlue.withAlpha(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ScopeLabel('TOP-LEVEL SCOPE'),
                  const SizedBox(height: 6),
                  const Text(
                    'var x = 10;',
                    style: TextStyle(
                      color: Colors.white54,
                      fontFamily: 'monospace',
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.dartCyan, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.dartCyan.withAlpha(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _ScopeLabel('FUNCTION SCOPE'),
                        const SizedBox(height: 6),
                        const Text(
                          'var y = 20;',
                          style: TextStyle(
                            color: Colors.white54,
                            fontFamily: 'monospace',
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.greenAccent.withAlpha(120),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.greenAccent.withAlpha(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _ScopeLabel('INNER SCOPE  (if / for / block)'),
                              const SizedBox(height: 6),
                              const Text(
                                'print(x); //  sees top-level x\nprint(y); //  sees function y\n// x and y not visible from outer scopes',
                                style: TextStyle(
                                  color: Colors.greenAccent,
                                  fontFamily: 'monospace',
                                  fontSize: 14,
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
            ),
          ],
        ),
      ),
    );
  }
}

class _ScopeShadowing extends StatelessWidget {
  const _ScopeShadowing();

  @override
  Widget build(BuildContext context) {
    const code = '''
var name = 'Global';  // top-level binding

void greet() {
  var name = 'Local'; // shadows the outer 'name'
  print(name);        // Local inner binding wins
}

void main() {
  greet();        // prints: Local
  print(name);    // prints: Global outer untouched
}''';

    return _CodeFrameLayout(
      title: 'Variable Shadowing',
      subtitle:
          "An inner scope can redeclare a name from an outer scope. The outer binding isn't destroyed, just hidden.",
      child: CodeDisplay(code: code),
    );
  }
}

class _ClosureMachine extends StatefulWidget {
  const _ClosureMachine();

  @override
  State<_ClosureMachine> createState() => _ClosureMachineState();
}

class _ClosureMachineState extends State<_ClosureMachine> {
  int _count = 0;
  final List<String> _logs = [];

  void _call() => setState(() {
    _count++;
    _logs.insert(0, 'call #$_count  →  count = $_count');
  });

  void _reset() => setState(() {
    _count = 0;
    _logs.clear();
  });

  @override
  Widget build(BuildContext context) {
    const code = '''
Function makeCounter() {
  int count = 0;      // captured variable
  return () {
    count++;          // mutates the captured env
    print(count);
  };
}

// Each call to makeCounter() gets its OWN count
var c1 = makeCounter();
var c2 = makeCounter();
c1(); c1(); // 1, 2
c2();       // 1 = independent environment''';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Closures', style: TextStyles().title()),
                const SizedBox(height: 10),
                const Text(
                  'A function that captures and retains its enclosing environment,\neven after the outer function has returned.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                CodeDisplay(code: code),
              ],
            ),
          ),
          const SizedBox(width: 40),
          // Live state box
          Container(
            width: 280,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'ENVIRONMENT STATE',
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 10,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 12),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    'count: $_count',
                    key: ValueKey(_count),
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _call,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.dartBlue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('counter()'),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: _reset,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white54,
                        side: const BorderSide(color: Colors.white12),
                      ),
                      child: const Text('reset'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: _logs.length,
                    itemBuilder: (_, i) => Text(
                      _logs[i],
                      style: TextStyle(
                        color: Colors.white.withAlpha(i == 0 ? 160 : 50),
                        fontSize: 11,
                        fontFamily: 'monospace',
                      ),
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

class _LateBindings extends StatelessWidget {
  const _LateBindings();

  @override
  Widget build(BuildContext context) {
    const code = '''
class DatabaseService {
  // Declared non-nullable, but not yet bound to a value.
  // Dart trusts you to initialize it before use.
  late String connectionString;

  void connect(String url) {
    connectionString = url;  // binding happens here
  }

  void query(String sql) {
    // If connect() was never called, this throws LateInitializationError
    print('\$connectionString: \$sql');
  }
}

// Also useful for lazy initialization (computed once, on first access):
late List<int> expensiveData = _compute(); // only runs when first read''';

    return _CodeFrameLayout(
      title: 'Late Bindings',
      subtitle:
          'Deferred binding: The name exists now, the value arrives later.',
      child: CodeDisplay(code: code),
    );
  }
}

class _CodeFrameLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const _CodeFrameLayout({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedFadeUp(
              delay: 100,
              child: Text(title, style: TextStyles().title()),
            ),
            const SizedBox(height: 8),
            AnimatedFadeUp(
              delay: 200,
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 28),
            AnimatedFadeUp(
              delay: 300,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 860),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _KeywordCard({
  required String keyword,
  required Color color,
  required String label,
  required String desc,
}) {
  return Container(
    width: 240,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: color.withAlpha(12),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: color.withAlpha(100)),
    ),
    child: Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          keyword,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ],
    ),
  );
}

Widget _BindingTimeCard({
  required String phase,
  required Color color,
  required IconData icon,
  required List<String> examples,
}) {
  return Container(
    width: 260,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: color.withAlpha(12),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: color.withAlpha(80)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(width: 10),
            Text(
              phase,
              style: TextStyle(
                color: color,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        ...examples.map(
          (e) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('·  ', style: TextStyle(color: color, fontSize: 18)),
                Expanded(
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _ScopeLabel(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      color: Colors.white38,
    ),
  );
}
