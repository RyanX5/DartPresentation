import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class RohanSlide2 extends StatefulWidget {
  const RohanSlide2({super.key});

  @override
  State<RohanSlide2> createState() => _RohanSlide2State();
}

class _RohanSlide2State extends State<RohanSlide2> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Syntax',
      subtitle: 'Familiar, but with upgrades.',
      childrenSlides: [
        const _StructureSpotlight(),
        const _BoilerplateBattle(),
        const _InterpolationTheory(),
        const _InterpolationPlayground(),
        const _ArrowSyntax(),
        const _CollectionLiterals(),
        const _NamedParams(),
        const _DocComments(),
      ],
    );
  }
}

class _StructureSpotlight extends StatelessWidget {
  const _StructureSpotlight();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Program Structure', style: TextStyles().title()),
            const SizedBox(height: 50),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _SyntaxCard(
                  title: 'Top-Level main()',
                  desc:
                      'Execution starts at void main(). No boilerplate class wrapper required unlike Java.',
                  icon: Icons.play_circle_outline,
                  delay: 200,
                ),
                _SyntaxCard(
                  title: 'Required Semicolons',
                  desc:
                      'Semicolons are mandatory to terminate statements. Unlike JS or Kotlin which allow omission.',
                  icon: Icons.code,
                  delay: 400,
                ),
                _SyntaxCard(
                  title: 'Everything is an Object',
                  desc:
                      'int, double, bool, null, all are objects. There are no primitive types like in Java.',
                  icon: Icons.auto_awesome_motion,
                  delay: 600,
                ),
                _SyntaxCard(
                  title: 'Library-Level Privacy',
                  desc:
                      'No public/private keywords. Prefix with _ to mark a name as private to its library file.',
                  icon: Icons.lock_outline,
                  delay: 800,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BoilerplateBattle extends StatefulWidget {
  const _BoilerplateBattle();

  @override
  State<_BoilerplateBattle> createState() => _BoilerplateBattleState();
}

class _BoilerplateBattleState extends State<_BoilerplateBattle> {
  bool _showJava = true;

  final String _javaCode = '''
public class HelloWorld {
    public static void main(String[] args) {
        String name = "Dart";
        int year = 2011;
        System.out.println("Hello from " + name + "! Year: " + year);
    }
}''';

  final String _dartCode = '''
void main() {
  String name = 'Dart';
  int year = 2011;
  print('Hello from \$name! Year: \$year');
}''';

  @override
  Widget build(BuildContext context) {
    return _CodeFrameLayout(
      title: 'Syntactic Efficiency',
      subtitle: 'Less ceremony. Same result.',
      header: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ToggleOption(
            label: 'JAVA',
            isActive: _showJava,
            onTap: () => setState(() => _showJava = true),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Icon(Icons.bolt, color: AppColors.dartCyan),
          ),
          _ToggleOption(
            label: 'DART',
            isActive: !_showJava,
            onTap: () => setState(() => _showJava = false),
          ),
        ],
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: CodeDisplay(
          key: ValueKey(_showJava),
          code: _showJava ? _javaCode : _dartCode,
        ),
      ),
    );
  }
}

class _InterpolationTheory extends StatelessWidget {
  const _InterpolationTheory();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('String Interpolation', style: TextStyles().title()),
            const SizedBox(height: 20),
            const Text(
              r'Embed values directly in strings using $. No concatenation needed.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
            const SizedBox(height: 40),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Container(
                padding: const EdgeInsets.all(36),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    AnimatedFadeUp(
                      delay: 200,
                      child: _ComparisonRow(
                        lang: 'Java',
                        code: '"Hello, " + name + "! Age: " + age',
                        note: 'Concatenation',
                      ),
                    ),
                    const Divider(color: Colors.white10, height: 40),
                    AnimatedFadeUp(
                      delay: 450,
                      child: _ComparisonRow(
                        lang: 'Python',
                        code: 'f"Hello, {name}! Age: {age}"',
                        note: 'f-prefix required',
                      ),
                    ),
                    const Divider(color: Colors.white10, height: 40),
                    AnimatedFadeUp(
                      delay: 700,
                      child: _ComparisonRow(
                        lang: 'Dart',
                        code: r"'Hello, $name! Age: ${age}'",
                        note: 'Native & clean',
                        isDart: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            AnimatedFadeUp(
              delay: 900,
              child: const Text(
                r'Use $variable for simple names, ${expression} for any Dart expression.',
                style: TextStyle(color: AppColors.textMuted, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InterpolationPlayground extends StatefulWidget {
  const _InterpolationPlayground();

  @override
  State<_InterpolationPlayground> createState() =>
      _InterpolationPlaygroundState();
}

class _InterpolationPlaygroundState extends State<_InterpolationPlayground> {
  double _price = 49.99;

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Expression Interpolation', style: TextStyles().title()),
            const SizedBox(height: 16),
            const Text(
              r'${ } accepts any valid Dart expression including ternaries.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Slider side
                Column(
                  children: [
                    const Text(
                      'ADJUST PRICE',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        letterSpacing: 1.5,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 280,
                      child: Slider(
                        value: _price,
                        min: 10,
                        max: 200,
                        activeColor: AppColors.dartCyan,
                        inactiveColor: Colors.white12,
                        onChanged: (v) => setState(() => _price = v),
                      ),
                    ),
                    Text(
                      '\$${_price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 60),
                // Output side
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DART CODE',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Text(
                        "'\${price > 100 ? 'Expensive' : 'Deal!'}'",
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.greenAccent,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        const Text(
                          'Result:  ',
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          _price > 100 ? '"Expensive"' : '"Deal!"',
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w900,
                            color: AppColors.dartCyan,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ArrowSyntax extends StatelessWidget {
  const _ArrowSyntax();

  @override
  Widget build(BuildContext context) {
    const code = '''
// Standard block body
int add(int a, int b) {
  return a + b;
}

// Arrow syntax: shorthand for a single expression
int add(int a, int b) => a + b;

// Works with lambdas too
var doubled = [1, 2, 3].map((n) => n * 2).toList();
// Result: [2, 4, 6]''';

    return _CodeFrameLayout(
      title: 'Arrow Syntax  ( => )',
      subtitle: 'Single-expression shorthand. Same meaning with less code.',
      child: CodeDisplay(code: code),
    );
  }
}

class _CollectionLiterals extends StatelessWidget {
  const _CollectionLiterals();

  @override
  Widget build(BuildContext context) {
    const code = '''
// List: ordered, zero-indexed
List<String> colors = ['red', 'green', 'blue'];
print(colors[0]); // red

// Set: unordered, unique values only
Set<int> ids = {1, 2, 3, 3}; // {1, 2, 3}

// Map: key/value pairs
Map<String, int> scores = {'Alice': 95, 'Bob': 88};
print(scores['Alice']); // 95

// Collection-if and collection-for (Dart-unique)
bool showAdmin = true;
var nav = ['Home', 'Profile', if (showAdmin) 'Admin'];
var doubled = [for (var n in [1,2,3]) n * 2]; // [2,4,6]''';

    return _CodeFrameLayout(
      title: 'Collection Literals',
      subtitle: 'List, Set, Map plus unique collection-if and collection-for.',
      child: CodeDisplay(code: code),
    );
  }
}

class _NamedParams extends StatelessWidget {
  const _NamedParams();

  @override
  Widget build(BuildContext context) {
    const code = '''
// Named parameters, wrapped in { }
// Caller must use the name at the call site
void createUser({required String name, int age = 0}) {
  print('\$name is \$age years old');
}

createUser(name: 'Alice', age: 25); // clear at call site
createUser(name: 'Bob');            // age defaults to 0

// Positional optional parameters — wrapped in [ ]
String greet(String name, [String greeting = 'Hello']) {
  return '\$greeting, \$name!';
}

greet('Alice');          // Hello, Alice!
greet('Alice', 'Hi');    // Hi, Alice!''';

    return _CodeFrameLayout(
      title: 'Named & Optional Parameters',
      subtitle:
          'Dart makes call sites self-documenting, so no guessing argument order.',
      child: CodeDisplay(code: code),
    );
  }
}

class _DocComments extends StatelessWidget {
  const _DocComments();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Comments & Documentation', style: TextStyles().title()),
            const SizedBox(height: 20),
            const Text(
              'Dart has three comment styles, one of which generates API docs.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AnimatedFadeUp(
                    delay: 200,
                    child: _CommentCard(
                      symbol: '//',
                      label: 'Line Comment',
                      example: '// Explain what this does',
                      desc: 'Standard inline comment. Ignored by the compiler.',
                      color: Colors.white38,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: AnimatedFadeUp(
                    delay: 400,
                    child: _CommentCard(
                      symbol: '/* */',
                      label: 'Block Comment',
                      example: '/* multi\n   line */',
                      desc: 'Spans multiple lines. Rarely used in practice.',
                      color: Colors.white38,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: AnimatedFadeUp(
                    delay: 600,
                    child: _CommentCard(
                      symbol: '///',
                      label: 'Doc Comment',
                      example: '/// Adds [a] and [b].\n/// Returns their sum.',
                      desc:
                          'Generates HTML API docs via dartdoc. Supports Markdown. Unique to Dart.',
                      color: AppColors.dartCyan,
                      isHighlight: true,
                    ),
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

class _CodeFrameLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;
  final Widget? header;

  const _CodeFrameLayout({
    required this.title,
    required this.subtitle,
    required this.child,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 17,
                ),
              ),
            ),
            if (header != null) ...[const SizedBox(height: 24), header!],
            const SizedBox(height: 24),
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

Widget _SyntaxCard({
  required String title,
  required String desc,
  required IconData icon,
  required int delay,
}) {
  return AnimatedFadeUp(
    delay: delay,
    child: Container(
      width: 270,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.dartCyan, size: 34),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
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
    ),
  );
}

Widget _ToggleOption({
  required String label,
  required bool isActive,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? AppColors.dartBlue : Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isActive ? AppColors.dartCyan : Colors.white10,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white54,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.2,
        ),
      ),
    ),
  );
}

class _ComparisonRow extends StatelessWidget {
  final String lang, code, note;
  final bool isDart;
  const _ComparisonRow({
    required this.lang,
    required this.code,
    required this.note,
    this.isDart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            lang,
            style: TextStyle(
              color: isDart ? AppColors.dartCyan : Colors.white54,
              fontWeight: isDart ? FontWeight.bold : FontWeight.normal,
              fontSize: 17,
            ),
          ),
        ),
        Expanded(
          child: Text(
            code,
            style: TextStyle(
              color: isDart ? Colors.white : Colors.white38,
              fontFamily: 'monospace',
              fontSize: 18,
            ),
          ),
        ),
        Text(
          note,
          style: const TextStyle(
            color: Colors.white24,
            fontStyle: FontStyle.italic,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _CommentCard extends StatelessWidget {
  final String symbol, label, example, desc;
  final Color color;
  final bool isHighlight;
  const _CommentCard({
    required this.symbol,
    required this.label,
    required this.example,
    required this.desc,
    required this.color,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isHighlight
            ? AppColors.dartBlue.withAlpha(20)
            : Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isHighlight
              ? AppColors.dartBlue.withAlpha(80)
              : Colors.white10,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            symbol,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
              fontFamily: 'monospace',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              example,
              style: TextStyle(
                fontFamily: 'monospace',
                color: color,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            desc,
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
}
