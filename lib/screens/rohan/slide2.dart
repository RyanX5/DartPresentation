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
        const _OperatorSugar(),
        const _CommentsMetadata(),
      ],
    );
  }
}

// ── FRAME 1: PROGRAM STRUCTURE (Expanded) ───────────────────────────────────

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
            const SizedBox(height: 60),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: [
                _SyntaxCard(
                  title: 'Top-Level Main',
                  desc:
                      'Execution starts at void main(). No boilerplate class wrappers required.',
                  icon: Icons.play_circle_outline,
                  delay: 200,
                ),
                _SyntaxCard(
                  title: 'Required Semicolons',
                  desc:
                      'Unlike JS or Kotlin, semicolons are mandatory to terminate statements.',
                  icon: Icons.code,
                  delay: 400,
                ),
                _SyntaxCard(
                  title: 'Unified Objects',
                  desc:
                      'Everything is an object. Even types like int and bool are classes under the hood.',
                  icon: Icons.auto_awesome_motion,
                  delay: 600,
                ),
                _SyntaxCard(
                  title: 'Library Privacy',
                  desc:
                      'Privacy is file-level. Use an underscore (_) prefix to mark members as private.',
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

// ── FRAME 2: BOILERPLATE BATTLE (Centered Comparison) ────────────────────────

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
        System.out.println("Hello, World!");
    }
}''';

  final String _dartCode = '''
void main() {
  print('Hello, World!');
}''';

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Syntactic Efficiency', style: TextStyles().title()),
            const SizedBox(height: 40),
            Row(
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
            const SizedBox(height: 50),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: ConstrainedBox(
                key: ValueKey(_showJava),
                constraints: const BoxConstraints(maxWidth: 800),
                child: CodeDisplay(code: _showJava ? _javaCode : _dartCode),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── FRAME 3: INTERPOLATION (Revamped Comparison) ────────────────────────────

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
            const SizedBox(height: 60),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    _ComparisonRow(
                      lang: 'Java',
                      code: '"Hello, " + name + "!"',
                      note: 'Manual Concatenation',
                    ),
                    const Divider(color: Colors.white10, height: 50),
                    _ComparisonRow(
                      lang: 'Python',
                      code: 'f"Hello, {name}!"',
                      note: 'Prefix Required',
                    ),
                    const Divider(color: Colors.white10, height: 50),
                    _ComparisonRow(
                      lang: 'Dart',
                      code: "'Hello, \$name!'",
                      note: 'Native & Clean',
                      isDart: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── FRAME 4: INTERPOLATION PLAYGROUND ────────────────────────────────────────

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
            Text('Expression Logic', style: TextStyles().title()),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'ADJUST VALUE',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Slider(
                      value: _price,
                      min: 10,
                      max: 200,
                      activeColor: AppColors.dartCyan,
                      onChanged: (v) => setState(() => _price = v),
                    ),
                    Text(
                      '\$${_price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(width: 80),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'INTERPOLATED CODE',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "'\${price > 100 ? \"Expensive\" : \"Deal!\"}'",
                        style: TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.greenAccent,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Result: ${_price > 100 ? "Expensive" : "Deal!"}',
                      style: const TextStyle(
                        fontSize: 32,
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
      ),
    );
  }
}

// ── FRAME 5: ARROW SYNTAX (NEW) ──────────────────────────────────────────────

class _ArrowSyntax extends StatelessWidget {
  const _ArrowSyntax();

  @override
  Widget build(BuildContext context) {
    const code = '''
// Standard Block Body
int add(int a, int b) {
  return a + b;
}

// Arrow Syntax (Expression Body)
int add(int a, int b) => a + b;''';

    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Arrow Syntax', style: TextStyles().title()),
            const SizedBox(height: 30),
            const Text(
              'Short-hand for single-expression functions.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 20),
            ),
            const SizedBox(height: 50),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: CodeDisplay(code: code),
            ),
          ],
        ),
      ),
    );
  }
}

// ── FRAME 6: OPERATOR SUGAR (NEW) ────────────────────────────────────────────

class _OperatorSugar extends StatelessWidget {
  const _OperatorSugar();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Modern Operators', style: TextStyles().title()),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SugarBox(
                  op: '??',
                  label: 'If-Null',
                  desc: 'Returns right if left is null.',
                ),
                const SizedBox(width: 24),
                _SugarBox(
                  op: '~/',
                  label: 'Int Division',
                  desc: 'Truncating division result.',
                ),
                const SizedBox(width: 24),
                _SugarBox(
                  op: '..',
                  label: 'Cascade',
                  desc: 'Chain operations on one object.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── FRAME 7: COMMENTS & METADATA (NEW) ───────────────────────────────────────

class _CommentsMetadata extends StatelessWidget {
  const _CommentsMetadata();

  @override
  Widget build(BuildContext context) {
    const code = '''
/// This is a documentation comment.
/// It supports [Markdown] and is used by dartdoc.
@deprecated
void oldMethod() {
  // Standard comment
  /* Multi-line comment */
}''';

    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Documentation & Metadata', style: TextStyles().title()),
            const SizedBox(height: 50),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: CodeDisplay(code: code),
            ),
          ],
        ),
      ),
    );
  }
}

// ── REUSABLE UI COMPONENTS ───────────────────────────────────────────────────

Widget _SyntaxCard({
  required String title,
  required String desc,
  required IconData icon,
  required int delay,
}) {
  return AnimatedFadeUp(
    delay: delay,
    child: Container(
      width: 280,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.dartCyan, size: 36),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
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
          width: 100,
          child: Text(
            lang,
            style: TextStyle(
              color: isDart ? AppColors.dartCyan : Colors.white54,
              fontWeight: isDart ? FontWeight.bold : FontWeight.normal,
              fontSize: 18,
            ),
          ),
        ),
        Expanded(
          child: Text(
            code,
            style: TextStyle(
              color: isDart ? Colors.white : Colors.white38,
              fontFamily: 'monospace',
              fontSize: 20,
            ),
          ),
        ),
        Text(
          note,
          style: const TextStyle(
            color: Colors.white24,
            fontStyle: FontStyle.italic,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

Widget _SugarBox({
  required String op,
  required String label,
  required String desc,
}) {
  return Container(
    width: 220,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white.withAlpha(5),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white10),
    ),
    child: Column(
      children: [
        Text(
          op,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.dartCyan,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
      ],
    ),
  );
}
