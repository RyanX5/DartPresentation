import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/code_display.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class RohanSlide4 extends StatefulWidget {
  const RohanSlide4({super.key});

  @override
  State<RohanSlide4> createState() => _RohanSlide4State();
}

class _RohanSlide4State extends State<RohanSlide4> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Semantic Analysis',
      subtitle: "Meaning, not just structure.",
      childrenSlides: [
        const _WhatIsSemantic(),
        const _TypeInferenceLock(),
        const _SoundnessExplained(),
        const _FlowAnalysisSimulator(),
        const _NullOperatorPlayground(),
        const _StaticVsDynamicBattle(),
      ],
    );
  }
}

class _WhatIsSemantic extends StatelessWidget {
  const _WhatIsSemantic();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('What is Semantic Analysis?', style: TextStyles().title()),
            const SizedBox(height: 16),
            const Text(
              'Syntax checks structure.  Semantics checks meaning.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 19),
            ),
            const SizedBox(height: 50),
            // Pipeline diagram
            AnimatedFadeUp(
              delay: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _PipelineStep(
                    label: 'Source\nCode',
                    icon: Icons.edit_note,
                    color: Colors.white38,
                  ),
                  _Arrow(),
                  _PipelineStep(
                    label: 'Lexer\n(tokens)',
                    icon: Icons.format_list_bulleted,
                    color: Colors.white54,
                  ),
                  _Arrow(),
                  _PipelineStep(
                    label: 'Parser\n(AST)',
                    icon: Icons.account_tree_outlined,
                    color: Colors.white70,
                  ),
                  _Arrow(),
                  _PipelineStep(
                    label: 'Semantic\nAnalyzer',
                    icon: Icons.psychology_outlined,
                    color: AppColors.dartCyan,
                    highlight: true,
                  ),
                  _Arrow(),
                  _PipelineStep(
                    label: 'Code\nGen',
                    icon: Icons.memory,
                    color: Colors.white38,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedFadeUp(
                  delay: 400,
                  child: _TaskCard(
                    icon: Icons.category_outlined,
                    title: 'Type Checking',
                    desc: 'Verifies every value is used as the correct type.',
                  ),
                ),
                const SizedBox(width: 20),
                AnimatedFadeUp(
                  delay: 600,
                  child: _TaskCard(
                    icon: Icons.account_tree_outlined,
                    title: 'Flow Analysis',
                    desc: 'Tracks nullability through every branch.',
                  ),
                ),
                const SizedBox(width: 20),
                AnimatedFadeUp(
                  delay: 800,
                  child: _TaskCard(
                    icon: Icons.warning_amber_outlined,
                    title: 'Dead Code & Linting',
                    desc: 'Flags unreachable logic and anti-patterns.',
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

class _TypeInferenceLock extends StatefulWidget {
  const _TypeInferenceLock();

  @override
  State<_TypeInferenceLock> createState() => _TypeInferenceLockState();
}

class _TypeInferenceLockState extends State<_TypeInferenceLock> {
  int _selected = 0;

  final List<Map<String, dynamic>> _cases = [
    {
      'code': 'var x = 42;',
      'inferred': 'int',
      'ok': true,
      'note': 'x is permanently int',
    },
    {
      'code': 'var s = "hello";',
      'inferred': 'String',
      'ok': true,
      'note': 's is permanently String',
    },
    {
      'code': 'var x = 42;\nx = "hi";',
      'inferred': 'int',
      'ok': false,
      'note': "String can't be assigned to int",
    },
    {
      'code': 'var items = [1, 2, 3];',
      'inferred': 'List<int>',
      'ok': true,
      'note': 'Inferred from literal',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final info = _cases[_selected];
    final bool isOk = info['ok'] as bool;

    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Type Inference', style: TextStyles().title()),
            const SizedBox(height: 16),
            const Text(
              'var looks flexible, but the analyzer locks the type at first assignment.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: List.generate(_cases.length, (i) {
                final active = i == _selected;
                return InkWell(
                  onTap: () => setState(() => _selected = i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: active
                          ? AppColors.dartBlue
                          : Colors.white.withAlpha(8),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: active ? AppColors.dartCyan : Colors.white10,
                      ),
                    ),
                    child: Text(
                      _cases[i]['code'] as String,
                      style: TextStyle(
                        color: active ? Colors.white : Colors.white38,
                        fontFamily: 'monospace',
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 36),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Container(
                key: ValueKey(_selected),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: isOk
                      ? Colors.greenAccent.withAlpha(15)
                      : Colors.redAccent.withAlpha(15),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isOk
                        ? Colors.greenAccent.withAlpha(80)
                        : Colors.redAccent.withAlpha(80),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isOk ? Icons.check_circle_outline : Icons.error_outline,
                      color: isOk ? Colors.greenAccent : Colors.redAccent,
                      size: 32,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Inferred: ${info['inferred']}',
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          info['note'] as String,
                          style: TextStyle(
                            color: isOk ? Colors.greenAccent : Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
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

class _SoundnessExplained extends StatelessWidget {
  const _SoundnessExplained();

  @override
  Widget build(BuildContext context) {
    const code = '''
String? name = null; // nullable — explicitly opted in

// Without a null check, the analyzer rejects this:
// print(name.length); // COMPILE ERROR

// After a null check, Dart PROMOTES the type:
if (name != null) {
  // Inside here, name is treated as String, not String?
  print(name.length); // SAFE: no ? needed
}

// Java: @Nullable is a hint, ignored at runtime
// Dart: ? is enforced which means the compiler GUARANTEES safety''';

    return _CodeFrameLayout(
      title: 'Sound Null Safety',
      subtitle:
          '"Sound" = the compiler gives a full guarantee, no loopholes or runtime surprises.',
      child: CodeDisplay(code: code),
    );
  }
}

class _FlowAnalysisSimulator extends StatefulWidget {
  const _FlowAnalysisSimulator();

  @override
  State<_FlowAnalysisSimulator> createState() => _FlowAnalysisSimulatorState();
}

class _FlowAnalysisSimulatorState extends State<_FlowAnalysisSimulator> {
  bool _hasCheck = false;

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flow Analysis & Type Promotion', style: TextStyles().title()),
            const SizedBox(height: 16),
            const Text(
              'The analyzer builds a control-flow graph and tracks type information through every branch.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 17),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'CODE',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 11,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _PromotionCodeView(isPromoted: _hasCheck),
                  ],
                ),
                const SizedBox(width: 60),
                Column(
                  children: [
                    const Text(
                      'ANALYZER VERDICT',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 11,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        key: ValueKey(_hasCheck),
                        _hasCheck ? Icons.check_circle : Icons.error,
                        color: _hasCheck
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        size: 64,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        key: ValueKey(_hasCheck),
                        _hasCheck
                            ? 'PROMOTED:\nString? → String'
                            : 'SEMANTIC ERROR:\nNullable method call',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: _hasCheck
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Switch(
                          value: _hasCheck,
                          onChanged: (v) => setState(() => _hasCheck = v),
                          activeThumbColor: Colors.greenAccent,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Add null check',
                          style: TextStyle(color: Colors.white54, fontSize: 14),
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

class _NullOperatorPlayground extends StatefulWidget {
  const _NullOperatorPlayground();

  @override
  State<_NullOperatorPlayground> createState() =>
      _NullOperatorPlaygroundState();
}

class _NullOperatorPlaygroundState extends State<_NullOperatorPlayground> {
  String? _input;

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Null Operators', style: TextStyles().title()),
            const SizedBox(height: 16),
            const Text(
              'Dart provides three operators for working with nullable values safely.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _OperatorCard(
                  op: '??',
                  name: 'Null Fallback',
                  expression:
                      '${_input == null ? 'null' : '"$_input"'} ?? "Guest"',
                  result: _input ?? 'Guest',
                  desc: 'Returns right side if left is null.',
                ),
                const SizedBox(width: 20),
                _OperatorCard(
                  op: '?.',
                  name: 'Safe Call',
                  expression:
                      '${_input == null ? 'null' : '"$_input"'}?.toUpperCase()',
                  result: _input?.toUpperCase() ?? 'null',
                  desc:
                      "Calls method only if not null. Returns null otherwise.",
                ),
                const SizedBox(width: 20),
                _OperatorCard(
                  op: '??=',
                  name: 'Null Assign',
                  expression: 'x ??= "Default"',
                  result: _input == null ? '"Default"' : 'unchanged',
                  desc: 'Assigns value only if variable is currently null.',
                ),
              ],
            ),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _input = null),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent.withAlpha(40),
                    foregroundColor: Colors.redAccent,
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                  child: const Text('input = null'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => setState(() => _input = 'Rohan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.dartBlue.withAlpha(40),
                    foregroundColor: AppColors.dartCyan,
                    side: const BorderSide(color: AppColors.dartBlue),
                  ),
                  child: const Text('input = "Rohan"'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StaticVsDynamicBattle extends StatelessWidget {
  const _StaticVsDynamicBattle();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Compile-Time vs. Runtime Errors',
              style: TextStyles().title(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Static typing lets the analyzer catch bugs before a single line runs.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                _CrashCard(
                  lang: 'PYTHON  (Dynamic)',
                  code:
                      'x = "10"\nprint(x + 5)\n# TypeError at RUNTIME\n# Users see the crash',
                  verdict: 'CRASHES AT RUNTIME',
                  sub: 'Error surfaces only when executed',
                  verdictColor: Colors.redAccent,
                  icon: Icons.bug_report,
                ),
                const SizedBox(width: 32),
                _CrashCard(
                  lang: 'DART  (Static)',
                  code:
                      'var x = "10";\nprint(x + 5);\n// COMPILE ERROR\n// Analyzer rejects this',
                  verdict: 'CAUGHT BY ANALYZER',
                  sub: 'Zero risk — never reaches users',
                  verdictColor: AppColors.dartCyan,
                  icon: Icons.security,
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

  const _CodeFrameLayout({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyles().title()),
            const SizedBox(height: 12),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 19,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 48),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 850),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _PipelineStep({
  required String label,
  required IconData icon,
  required Color color,
  bool highlight = false,
}) {
  return AnimatedFadeUp(
    delay: highlight ? 400 : 100,
    child: Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: highlight
            ? AppColors.dartBlue.withAlpha(40)
            : Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: highlight ? AppColors.dartCyan : Colors.white12,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: color, fontSize: 11, height: 1.3),
          ),
        ],
      ),
    ),
  );
}

Widget _Arrow() => const Padding(
  padding: EdgeInsets.symmetric(horizontal: 6),
  child: Icon(Icons.arrow_forward, color: Colors.white24, size: 20),
);

Widget _TaskCard({
  required IconData icon,
  required String title,
  required String desc,
}) {
  return Container(
    width: 230,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white.withAlpha(5),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white10),
    ),
    child: Column(
      children: [
        Icon(icon, color: AppColors.dartCyan, size: 30),
        const SizedBox(height: 14),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
            height: 1.4,
          ),
        ),
      ],
    ),
  );
}

class _PromotionCodeView extends StatelessWidget {
  final bool isPromoted;
  const _PromotionCodeView({required this.isPromoted});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'String? name = getValue();',
            style: TextStyle(
              color: Colors.white38,
              fontFamily: 'monospace',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'if (name != null) {',
            style: TextStyle(
              color: isPromoted ? Colors.greenAccent : Colors.white70,
              fontWeight: isPromoted ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'monospace',
              fontSize: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 4),
            child: Text(
              'print(name.length); // PROMOTED ✓',
              style: TextStyle(
                color: isPromoted ? Colors.greenAccent : Colors.white24,
                fontFamily: 'monospace',
                fontSize: 14,
              ),
            ),
          ),
          const Text(
            '}',
            style: TextStyle(
              color: Colors.white70,
              fontFamily: 'monospace',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _OperatorCard({
  required String op,
  required String name,
  required String expression,
  required dynamic result,
  required String desc,
}) {
  return Container(
    width: 240,
    padding: const EdgeInsets.all(22),
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
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.dartCyan,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          name,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          expression,
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 12,
            fontFamily: 'monospace',
          ),
          textAlign: TextAlign.center,
        ),
        const Divider(height: 28, color: Colors.white10),
        Text(
          '$result',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
            height: 1.4,
          ),
        ),
      ],
    ),
  );
}

Widget _CrashCard({
  required String lang,
  required String code,
  required String verdict,
  required String sub,
  required Color verdictColor,
  required IconData icon,
}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Text(
            lang,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              code,
              style: const TextStyle(
                color: Colors.white70,
                fontFamily: 'monospace',
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: verdictColor, size: 20),
              const SizedBox(width: 10),
              Text(
                verdict,
                style: TextStyle(
                  color: verdictColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            sub,
            style: const TextStyle(color: Colors.white24, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
