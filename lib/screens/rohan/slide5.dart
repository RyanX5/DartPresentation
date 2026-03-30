import 'package:dart_presentation/screens/default_slide.dart';
import 'package:dart_presentation/screens/router.dart';
import 'package:dart_presentation/utils/theme.dart';
import 'package:dart_presentation/widgets/animated_fade_up.dart';
import 'package:dart_presentation/widgets/wrapper.dart';
import 'package:dart_presentation/widgets/dartpad/dartpad_embed.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RohanSlide5 extends StatefulWidget {
  const RohanSlide5({super.key});

  @override
  State<RohanSlide5> createState() => _RohanSlide5State();
}

class _RohanSlide5State extends State<RohanSlide5> {
  @override
  Widget build(BuildContext context) {
    return DefaultSlide(
      title: 'Demo',
      subtitle: 'Hands-on with Dart logic.',
      childrenSlides: [const _DemoFrame()],
    );
  }
}

class _DemoFrame extends StatelessWidget {
  const _DemoFrame();

  // ── PRE-MADE CODE SNIPPETS ─────────────────────────────────────────────────

  final String _syntaxCode = '''
void main() {
  var name = 'Rohan';
  int year = 2025;
  
  // String Interpolation
  print('Hello, \$name!');
  print('Graduating in \${year + 1}');
}''';

  final String _scopesCode = '''
Function makeCounter() {
  int count = 0; // Captured by closure
  return () => print('Count: \${++count}');
}

void main() {
  var c = makeCounter();
  c(); // 1
  c(); // 2
}''';

  final String _nullSafetyCode = '''
void main() {
  String? nickname;
  
  // Null Fallback (??)
  print(nickname ?? 'Guest'); 
  
  nickname = 'RK';
  
  // Type Promotion via Flow Analysis
  if (nickname != null) {
    print('Length: \${nickname.length}');
  }
}''';

  void _copyToClipboard(BuildContext context, String code, String label) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('\$label copied to clipboard! Paste into DartPad.'),
        backgroundColor: AppColors.dartBlue,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Stack(
        children: [
          Column(
            children: [
              AnimatedFadeUp(
                delay: 100,
                child: Text(
                  'Interactive Playground',
                  style: TextStyles().heading1(),
                ),
              ),
              const SizedBox(height: 24),

              // ── TOOLBAR: CONCEPT BUTTONS ───────────────────────────────────
              AnimatedFadeUp(
                delay: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SnippetButton(
                      label: 'SYNTAX',
                      onPressed: () =>
                          _copyToClipboard(context, _syntaxCode, 'Syntax demo'),
                    ),
                    const SizedBox(width: 12),
                    _SnippetButton(
                      label: 'SCOPES',
                      onPressed: () => _copyToClipboard(
                        context,
                        _scopesCode,
                        'Closure demo',
                      ),
                    ),
                    const SizedBox(width: 12),
                    _SnippetButton(
                      label: 'NULL SAFETY',
                      onPressed: () => _copyToClipboard(
                        context,
                        _nullSafetyCode,
                        'Null safety demo',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // ── DARTPAD EMBED ──────────────────────────────────────────────
              Expanded(
                child: AnimatedFadeUp(
                  delay: 300,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white.withAlpha(30)),
                        color: Colors.black26,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: const DartpadEmbed(
                        embedUrl:
                            'https://dartpad.dev/embed-dart.html?theme=dark&run=false',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: AnimatedFadeUp(
              delay: 500,
              child: ElevatedButton.icon(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  SlideController.of(context).next();
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('NEXT SECTION: SUPREME'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.dartBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SnippetButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const _SnippetButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.content_copy, size: 16),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.dartCyan,
        side: const BorderSide(color: AppColors.dartCyan),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
