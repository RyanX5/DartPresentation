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
      subtitle: 'The "Brain" of the Dart Language.',
      childrenSlides: [
        const _AnalyzerOverview(),
        const _TypeInferenceLock(),
        const _SoundnessVisual(),
        const _FlowAnalysisSimulator(),
        const _StaticVsDynamicBattle(),
        const _LinterSimulation(),
      ],
    );
  }
}

// ── FRAME 1: ANALYZER OVERVIEW ──────────────────────────────────────────────

class _AnalyzerOverview extends StatelessWidget {
  const _AnalyzerOverview();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The Role of the Analyzer', style: TextStyles().title()),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _AnalyzerTaskCard(
                  icon: Icons.search_rounded,
                  title: 'Static Verification',
                  desc:
                      'Validates code without executing it. Finds bugs at author-time.',
                  delay: 200,
                ),
                const SizedBox(width: 24),
                _AnalyzerTaskCard(
                  icon: Icons.account_tree_outlined,
                  title: 'Semantic Mapping',
                  desc:
                      'Builds a graph of types, scopes, and variable lifetimes.',
                  delay: 400,
                ),
                const SizedBox(width: 24),
                _AnalyzerTaskCard(
                  icon: Icons.fact_check_outlined,
                  title: 'Flow-Sensitive Tracking',
                  desc: 'Checks every possible execution branch for safety.',
                  delay: 600,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── FRAME 2: TYPE INFERENCE LOCK (Interactive) ──────────────────────────────

class _TypeInferenceLock extends StatefulWidget {
  const _TypeInferenceLock();

  @override
  State<_TypeInferenceLock> createState() => _TypeInferenceLockState();
}

class _TypeInferenceLockState extends State<_TypeInferenceLock> {
  bool _isAssigned = false;

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Type Inference Logic', style: TextStyles().title()),
            const SizedBox(height: 40),
            const Text(
              'Static types are resolved, then strictly enforced.',
              style: TextStyle(color: Colors.white54, fontSize: 18),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CodeActionBox(
                  label: 'STEP 1: DECLARE',
                  code: 'var x;',
                  isActive: true,
                ),
                const Icon(Icons.arrow_forward, color: Colors.white24),
                _CodeActionBox(
                  label: 'STEP 2: INITIALIZE',
                  code: 'x = 42;',
                  isActive: _isAssigned,
                  onTap: () => setState(() => _isAssigned = true),
                  highlightColor: Colors.greenAccent,
                ),
                const Icon(Icons.arrow_forward, color: Colors.white24),
                _CodeActionBox(
                  label: 'STEP 3: RE-ASSIGN',
                  code: 'x = "Hello";',
                  isActive: _isAssigned,
                  isError: _isAssigned,
                  errorMessage:
                      'COMPILE ERROR: String cannot be assigned to int.',
                ),
              ],
            ),
            const SizedBox(height: 40),
            if (!_isAssigned)
              const Text(
                'Click "Initialize" to see the Analyzer lock the type.',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: AppColors.dartCyan,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ── FRAME 3: SOUNDNESS VISUAL ───────────────────────────────────────────────

class _SoundnessVisual extends StatelessWidget {
  const _SoundnessVisual();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The Soundness Guarantee', style: TextStyles().title()),
            const SizedBox(height: 50),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Row(
                children: [
                  Expanded(
                    child: _InfoTile(
                      title: 'No Loopholes',
                      desc:
                          'In a sound system, you can never get into a state where an expression evaluates to a value that doesn\'t match its static type.',
                    ),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: _InfoTile(
                      title: 'Runtime Confidence',
                      desc:
                          'Since types are guaranteed, the AOT compiler can optimize code for performance, knowing a String will NEVER be null or an int.',
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

// ── FRAME 4: FLOW ANALYSIS SIMULATOR (Interactive) ──────────────────────────

class _FlowAnalysisSimulator extends StatefulWidget {
  const _FlowAnalysisSimulator();

  @override
  State<_FlowAnalysisSimulator> createState() => _FlowAnalysisSimulatorState();
}

class _FlowAnalysisSimulatorState extends State<_FlowAnalysisSimulator> {
  bool _hasNullCheck = false;

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flow-Based Promotion', style: TextStyles().title()),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Mock Code Editor
                Container(
                  width: 500,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'void printLength(String? text) {',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () =>
                            setState(() => _hasNullCheck = !_hasNullCheck),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: _hasNullCheck
                                ? Colors.greenAccent.withAlpha(20)
                                : Colors.transparent,
                            border: Border.all(
                              color: _hasNullCheck
                                  ? Colors.greenAccent
                                  : Colors.white24,
                            ),
                          ),
                          child: Text(
                            _hasNullCheck
                                ? '  if (text != null) {'
                                : '  // Missing Null Check',
                            style: TextStyle(
                              color: _hasNullCheck
                                  ? Colors.greenAccent
                                  : Colors.white24,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '    print(text.length);',
                        style: TextStyle(
                          color: _hasNullCheck
                              ? Colors.white
                              : Colors.redAccent,
                          decoration: _hasNullCheck
                              ? null
                              : TextDecoration.lineThrough,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const Text(
                        '  }',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const Text(
                        '}',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                // Analyzer Output
                Column(
                  children: [
                    const Text(
                      'ANALYZER STATUS',
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Icon(
                      _hasNullCheck ? Icons.check_circle : Icons.error,
                      color: _hasNullCheck
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      size: 80,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _hasNullCheck
                          ? 'TYPE PROMOTED:\nString? ➜ String'
                          : 'SEMANTIC ERROR:\nUnsafe call on nullable',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _hasNullCheck
                            ? Colors.greenAccent
                            : Colors.redAccent,
                        fontWeight: FontWeight.bold,
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

// ── FRAME 5: STATIC VS DYNAMIC (Crash Test) ─────────────────────────────────

class _StaticVsDynamicBattle extends StatelessWidget {
  const _StaticVsDynamicBattle();

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Compile-Time vs. Runtime', style: TextStyles().title()),
            const SizedBox(height: 60),
            Row(
              children: [
                _LanguageCrashCard(
                  lang: 'PYTHON (Dynamic)',
                  code: 'x = "10"\nprint(x + 5)',
                  result: 'CRASHES AT RUNTIME',
                  resultColor: Colors.redAccent,
                  icon: Icons.bug_report,
                ),
                const SizedBox(width: 40),
                _LanguageCrashCard(
                  lang: 'DART (Static)',
                  code: 'var x = "10";\nprint(x + 5);',
                  result: 'REJECTED BY ANALYZER',
                  resultColor: AppColors.dartCyan,
                  icon: Icons.security,
                  isCompileError: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ── FRAME 6: LINTER SIMULATION ──────────────────────────────────────────────

class _LinterSimulation extends StatelessWidget {
  const _LinterSimulation();

  @override
  Widget build(BuildContext context) {
    const code = '''
void main() {
  // The Analyzer catches "Logical Errors"
  
  String name = 'Rohan';
  
  if (name == null) { 
    // LINT: This block is dead code. 
    // name is non-nullable and can never be null.
    print('Hello?'); 
  }
  
  // LINT: Unnecessary type annotation
  int age = 23; 
}''';

    return Wrapper(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Beyond Syntax: Linting', style: TextStyles().title()),
            const SizedBox(height: 30),
            const Text(
              'Identifying "dead code" and stylistic anti-patterns.',
              style: TextStyle(color: Colors.white54, fontSize: 18),
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

// ── REUSABLE UI COMPONENTS ───────────────────────────────────────────────────

Widget _AnalyzerTaskCard({
  required IconData icon,
  required String title,
  required String desc,
  required int delay,
}) {
  return AnimatedFadeUp(
    delay: delay,
    child: Container(
      width: 260,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.dartCyan, size: 36),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
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

Widget _CodeActionBox({
  required String label,
  required String code,
  bool isActive = false,
  VoidCallback? onTap,
  bool isError = false,
  String? errorMessage,
  Color highlightColor = AppColors.dartBlue,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 10,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 200,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isActive ? highlightColor.withAlpha(20) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isError
                  ? Colors.redAccent
                  : (isActive ? highlightColor : Colors.white10),
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              code,
              style: TextStyle(
                color: isError
                    ? Colors.redAccent
                    : (isActive ? Colors.white : Colors.white24),
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        if (isError && errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              width: 200,
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

Widget _InfoTile({required String title, required String desc}) {
  return Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      color: Colors.white.withAlpha(5),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.dartCyan,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          desc,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 16,
            height: 1.6,
          ),
        ),
      ],
    ),
  );
}

Widget _LanguageCrashCard({
  required String lang,
  required String code,
  required String result,
  required Color resultColor,
  required IconData icon,
  bool isCompileError = false,
}) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Text(
            lang,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              code,
              style: const TextStyle(
                color: Colors.white70,
                fontFamily: 'monospace',
              ),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: resultColor, size: 20),
              const SizedBox(width: 12),
              Text(
                result,
                style: TextStyle(
                  color: resultColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            isCompileError ? 'Zero risk for users.' : 'Crashes for users.',
            style: const TextStyle(color: Colors.white24, fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
