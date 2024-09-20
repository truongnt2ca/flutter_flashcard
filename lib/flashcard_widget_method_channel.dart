import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flashcard_widget_platform_interface.dart';

/// An implementation of [FlashcardWidgetPlatform] that uses method channels.
class MethodChannelFlashcardWidget extends FlashcardWidgetPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flashcard_widget');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
