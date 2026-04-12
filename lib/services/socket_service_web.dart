// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:dart_presentation/services/remote_state.dart';

/// Connects to the Socket.IO server (served from the same origin) and
/// forwards stateUpdate events into [remoteGoToNotifier].
void initSocketService() {
  try {
    // io() is the global Socket.IO client function injected via
    // <script src="/socket.io/socket.io.js"> in web/index.html.
    final socket = js.context.callMethod('io') as js.JsObject;

    socket.callMethod('on', [
      'stateUpdate',
      js.allowInterop((dynamic data) {
        if (data == null) return;
        final obj = data as js.JsObject;
        final slide = (obj['slide'] as num).toInt();
        final frame = (obj['frame'] as num).toInt();
        remoteGoToNotifier.value = (slide: slide, frame: frame);
      }),
    ]);
  } catch (e) {
    // Socket.IO script not loaded (e.g. running outside the Node server).
    // Silently ignore - keyboard navigation still works normally.
  }
}
