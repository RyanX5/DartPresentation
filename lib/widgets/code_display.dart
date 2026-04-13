import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/vs2015.dart';

class CodeDisplay extends StatefulWidget {
  final String code;
  final double fontSize;

  const CodeDisplay({Key? key, required this.code, this.fontSize = 15})
    : super(key: key);

  @override
  State<CodeDisplay> createState() => _CodeDisplayState();
}

class _CodeDisplayState extends State<CodeDisplay> {
  late double _fontSize;

  static const double _step = 1.5;
  static const double _min = 10;
  static const double _max = 26;

  @override
  void initState() {
    super.initState();
    _fontSize = widget.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    final lines = widget.code.split('\n');
    final lineCount = lines.length;

    return LayoutBuilder(
      builder: (context, constraints) {
        final bounded = constraints.hasBoundedHeight;
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(100),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: bounded ? MainAxisSize.max : MainAxisSize.min,
            children: [
              // Window Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFF2D2D2D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Row(
                  children: [
                    _buildWindowControl(const Color(0xFFFF5F56)),
                    const SizedBox(width: 8),
                    _buildWindowControl(const Color(0xFFFFBD2E)),
                    const SizedBox(width: 8),
                    _buildWindowControl(const Color(0xFF27C93F)),
                    const Spacer(),
                    // Zoom controls
                    _ZoomButton(
                      icon: Icons.remove,
                      enabled: _fontSize > _min,
                      onTap: () => setState(() => _fontSize = (_fontSize - _step).clamp(_min, _max)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        '${_fontSize.toStringAsFixed(0)}px',
                        style: const TextStyle(
                          color: Colors.white30,
                          fontSize: 11,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    _ZoomButton(
                      icon: Icons.add,
                      enabled: _fontSize < _max,
                      onTap: () => setState(() => _fontSize = (_fontSize + _step).clamp(_min, _max)),
                    ),
                  ],
                ),
              ),
              // Code body with line numbers
              if (bounded)
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: _codeBody(lineCount),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _codeBody(lineCount),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _codeBody(int lineCount) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Line numbers
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            lineCount,
            (i) => Text(
              '${i + 1}',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: _fontSize,
                height: 1.5,
                color: Colors.white24,
              ),
            ),
          ),
        ),
        Container(
          width: 1,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          color: Colors.white12,
        ),
        // Highlighted code
        Flexible(
          child: HighlightView(
            widget.code,
            language: 'dart',
            theme: vs2015Theme,
            padding: EdgeInsets.zero,
            textStyle: TextStyle(
              fontFamily: 'monospace',
              fontSize: _fontSize,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWindowControl(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _ZoomButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _ZoomButton({required this.icon, required this.enabled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: enabled ? Colors.white10 : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          size: 13,
          color: enabled ? Colors.white54 : Colors.white15,
        ),
      ),
    );
  }
}
