import 'package:flutter/foundation.dart';

/// Holds the remote-controlled state broadcast by the server.
/// Slide and frame are both 0-indexed.
typedef RemoteState = ({int slide, int frame});

/// Fires whenever the server sends a stateUpdate.
/// SlideRouter and DefaultSlide both listen to this.
final remoteGoToNotifier = ValueNotifier<RemoteState?>(null);

/// Whether keyboard navigation (arrow keys / A-D) is active.
final keyboardEnabledNotifier = ValueNotifier<bool>(true);
