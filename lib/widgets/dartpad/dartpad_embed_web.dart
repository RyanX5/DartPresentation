import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

class DartpadEmbed extends StatefulWidget {
  final String embedUrl;
  const DartpadEmbed({
    super.key,
    this.embedUrl = 'https://dartpad.dev/embed-dart.html?theme=dark',
  });

  @override
  State<DartpadEmbed> createState() => _DartpadEmbedState();
}

class _DartpadEmbedState extends State<DartpadEmbed> {
  late String viewId;

  @override
  void initState() {
    super.initState();
    viewId = 'dartpad-embed-${DateTime.now().microsecondsSinceEpoch}';
    
    ui_web.platformViewRegistry.registerViewFactory(
      viewId,
      (int id) => html.IFrameElement()
        ..src = widget.embedUrl
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%',
    );
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: viewId);
  }
}
