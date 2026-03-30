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
      subtitle: 'How Dart binds values to names.',
      childrenSlides: [
        const _DeclKeywords(),
        const _FinalVsConstBattle(),
        const _LexicalScopeVisual(),
        const _ClosureMachine(),
        const _LateBindings(),
        const _NullSafetyPromotion(),
        const _NullOperatorPlayground(),
      ],
    );
  }
}

// ── FRAME 1: DECLARATION KEYWORDS ────────────────────────────────────────────

class _DeclKeywords extends StatelessWidget {
  const _DeclKeywords();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Declaration Styles', style: TextStyles().title()),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _KeywordCard(
                  keyword: 'var',
                  color: AppColors.dartBlue,
                  label: 'INFERRED',
                  desc: 'Type determined at first assignment. Reassignable.',
                ),
                const SizedBox(width: 24),
                _KeywordCard(
                  keyword: 'final',
                  color: Colors.orangeAccent,
                  label: 'RUNTIME',
                  desc: 'Immutable once set. Initialized when accessed.',
                ),
                const SizedBox(width: 24),
                _KeywordCard(
                  keyword: 'const',
                  color: Colors.greenAccent,
                  label: 'COMPILE-TIME',
                  desc: 'Deeply immutable. Hard-coded into the binary.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── FRAME 2: FINAL VS CONST (The Logic Battle) ──────────────────────────────

class _FinalVsConstBattle extends StatelessWidget {
  const _FinalVsConstBattle();

  @override
  Widget build(BuildContext context) {
    const code = '''
void main() {
  // FINAL: Can be set via a runtime calculation
  final now = DateTime.now(); 
  
  // CONST: Must be known at compile time
  const pi = 3.14159;
  
  // const time = DateTime.now(); // ERROR!
}''';

    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Runtime vs. Compile-time', style: TextStyles().title()),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ConstraintBox(
                  title: 'FINAL',
                  points: [
                    'Evaluated at runtime',
                    'Instance-level',
                    'Set once per object',
                  ],
                ),
                const SizedBox(width: 40),
                const Icon(Icons.bolt, color: Colors.orangeAccent, size: 40),
                const SizedBox(width: 40),
                _ConstraintBox(
                  title: 'CONST',
                  points: [
                    'Evaluated at compile-time',
                    'Canonicalized (Memory efficient)',
                    'Deeply immutable collections',
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: CodeDisplay(code: code),
            ),
          ],
        ),
      ),
    );
  }
}

// ── FRAME 3: LEXICAL SCOPE (Visualizing the Nest) ───────────────────────────

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
            const SizedBox(height: 60),
            Container(
              width: 800,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.dartBlue, width: 2),
                borderRadius: BorderRadius.circular(20),
                color: AppColors.dartBlue.withAlpha(10),
              ),
              child: Column(
                children: [
                  _ScopeLabel('TOP-LEVEL SCOPE (void main)'),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.dartCyan, width: 2),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.dartCyan.withAlpha(20),
                    ),
                    child: Column(
                      children: [
                        _ScopeLabel('LOCAL SCOPE (if / for / func)'),
                        const SizedBox(height: 16),
                        const Text(
                          'Inner scopes can see "outward," but outer scopes cannot see "inward."',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 18),
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

// ── FRAME 4: THE CLOSURE MACHINE (Interactive State) ─────────────────────────

class _ClosureMachine extends StatefulWidget {
  const _ClosureMachine();

  @override
  State<_ClosureMachine> createState() => _ClosureMachineState();
}

class _ClosureMachineState extends State<_ClosureMachine> {
  int _internalValue = 0;
  final List<String> _logs = [];

  void _runClosure() {
    setState(() {
      _internalValue++;
      _logs.insert(0, 'Closure called! count is now: $_internalValue');
    });
  }

  @override
  Widget build(BuildContext context) {
    const code = '''
Function makeCounter() {
  int count = 0; // The captured variable
  return () => count++; 
}''';

    return Wrapper(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Closures', style: TextStyles().title()),
                  const SizedBox(height: 24),
                  const Text(
                    'Functions that "capture" their environment.',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CodeDisplay(code: code),
                ],
              ),
            ),
            const SizedBox(width: 80),
            Container(
              width: 350,
              height: 450,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                children: [
                  const Text(
                    'ENVIRONMENT STATE',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'count: $_internalValue',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _runClosure,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.dartBlue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('TRIGGER CLOSURE'),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _logs.length,
                      itemBuilder: (context, i) => Text(
                        _logs[i],
                        style: const TextStyle(
                          color: Colors.white24,
                          fontSize: 12,
                        ),
                      ),
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

// ── FRAME 5: LATE BINDINGS (Lazy Initialization) ────────────────────────────

class _LateBindings extends StatelessWidget {
  const _LateBindings();

  @override
  Widget build(BuildContext context) {
    const code = '''
class ApiService {
  // Promised to be initialized before use
  late String _apiKey;

  void init() {
    _apiKey = 'secret_123';
  }
}''';

    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Late Bindings', style: TextStyles().title()),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _LateIconBox(
                  Icons.timer_outlined,
                  'Lazy Loading',
                  'Only initialized when first accessed.',
                ),
                const SizedBox(width: 24),
                _LateIconBox(
                  Icons.verified_user_outlined,
                  'Non-Nullable',
                  'Allows non-null variables without an immediate value.',
                ),
              ],
            ),
            const SizedBox(height: 60),
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

// ── FRAME 6: FLOW ANALYSIS & PROMOTION (Interactive) ─────────────────────────

class _NullSafetyPromotion extends StatefulWidget {
  const _NullSafetyPromotion();

  @override
  State<_NullSafetyPromotion> createState() => _NullSafetyPromotionState();
}

class _NullSafetyPromotionState extends State<_NullSafetyPromotion> {
  bool _isPromoted = false;

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flow Analysis', style: TextStyles().title()),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'SOURCE CODE',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _PromotionCodeView(isPromoted: _isPromoted),
                  ],
                ),
                const SizedBox(width: 60),
                Column(
                  children: [
                    const Text(
                      'TYPE STATUS',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _TypeChip(label: 'String?', isActive: !_isPromoted),
                    const Icon(Icons.arrow_downward, color: Colors.white24),
                    _TypeChip(
                      label: 'String',
                      isActive: _isPromoted,
                      color: Colors.greenAccent,
                    ),
                    const SizedBox(height: 40),
                    Switch(
                      value: _isPromoted,
                      onChanged: (v) => setState(() => _isPromoted = v),
                      activeColor: Colors.greenAccent,
                    ),
                    const Text(
                      'SIMULATE NULL-CHECK',
                      style: TextStyle(color: Colors.white54, fontSize: 12),
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

// ── FRAME 7: NULL OPERATOR PLAYGROUND ────────────────────────────────────────

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
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _OperatorTrial(
                  op: '??',
                  input: _input,
                  fallback: '"Guest"',
                  result: _input ?? "Guest",
                ),
                const SizedBox(width: 24),
                _OperatorTrial(
                  op: '?.',
                  input: _input,
                  fallback: 'toUpperCase()',
                  result: _input?.toUpperCase() ?? "null",
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _input = null),
                  child: const Text('Set Input to NULL'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => setState(() => _input = "Rohan"),
                  child: const Text('Set Input to "Rohan"'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── REUSABLE UI FRAGMENTS ───────────────────────────────────────────────────

Widget _KeywordCard({
  required String keyword,
  required Color color,
  required String label,
  required String desc,
}) {
  return Container(
    width: 260,
    padding: const EdgeInsets.all(28),
    decoration: BoxDecoration(
      color: color.withAlpha(10),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: color.withAlpha(100)),
    ),
    child: Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          keyword,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: color,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(height: 20),
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
  );
}

Widget _ConstraintBox({required String title, required List<String> points}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
      const SizedBox(height: 20),
      ...points.map(
        (p) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              const Icon(Icons.circle, size: 6, color: AppColors.dartCyan),
              const SizedBox(width: 12),
              Text(p, style: const TextStyle(color: AppColors.textSecondary)),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _ScopeLabel(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      color: Colors.white54,
    ),
  );
}

Widget _LateIconBox(IconData icon, String title, String desc) {
  return Container(
    width: 300,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white.withAlpha(5),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white10),
    ),
    child: Column(
      children: [
        Icon(icon, color: AppColors.dartCyan, size: 32),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
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
      width: 500,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'String? name = getMaybeName();',
            style: TextStyle(color: Colors.white38, fontFamily: 'monospace'),
          ),
          const SizedBox(height: 8),
          Text(
            'if (name != null) {',
            style: TextStyle(
              color: isPromoted ? Colors.greenAccent : Colors.white,
              fontWeight: isPromoted ? FontWeight.bold : FontWeight.normal,
              fontFamily: 'monospace',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 4),
            child: Text(
              'print(name.length); // PROMOTED!',
              style: TextStyle(
                color: isPromoted ? Colors.greenAccent : Colors.white24,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const Text(
            '}',
            style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
          ),
        ],
      ),
    );
  }
}

Widget _TypeChip({
  required String label,
  required bool isActive,
  Color color = AppColors.dartCyan,
}) {
  return AnimatedOpacity(
    duration: const Duration(milliseconds: 300),
    opacity: isActive ? 1.0 : 0.2,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _OperatorTrial({
  required String op,
  required String? input,
  required String fallback,
  required dynamic result,
}) {
  return Container(
    width: 280,
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
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.dartCyan,
            fontFamily: 'monospace',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '${input ?? "null"} $op $fallback',
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 14,
            fontFamily: 'monospace',
          ),
        ),
        const Divider(height: 32, color: Colors.white10),
        Text(
          'RESULT: $result',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
