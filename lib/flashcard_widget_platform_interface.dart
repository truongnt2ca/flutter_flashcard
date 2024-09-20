import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flashcard_widget_method_channel.dart';

abstract class FlashcardWidgetPlatform extends PlatformInterface {
  /// Constructs a FlashcardWidgetPlatform.
  FlashcardWidgetPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlashcardWidgetPlatform _instance = MethodChannelFlashcardWidget();

  /// The default instance of [FlashcardWidgetPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlashcardWidget].
  static FlashcardWidgetPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlashcardWidgetPlatform] when
  /// they register themselves.
  static set instance(FlashcardWidgetPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
