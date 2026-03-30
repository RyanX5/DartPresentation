import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/vs2015.dart';

class CodeDisplay extends StatelessWidget {
  final String code;
  const CodeDisplay({Key? key, required this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E), // Standard VS Code dark background
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
        children: [
          // Window Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xFF2D2D2D), // Slightly lighter header
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
              ],
            ),
          ),

          // Syntax Highlighted Code
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: HighlightView(
              code,
              language: 'dart',
              theme: vs2015Theme,
              padding: EdgeInsets.zero,
              textStyle: const TextStyle(
                wordSpacing: 2.0,
                fontFamily:
                    'FiraCode', // Fallback to standard monospace if not imported
                fontSize: 24,
                height: 1.4, // Improves readability
              ),
            ),
          ),
        ],
      ),
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
