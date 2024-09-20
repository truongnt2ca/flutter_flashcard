import 'package:flutter_test/flutter_test.dart';
import 'package:flashcard_widget/flashcard_widget.dart';
import 'package:flashcard_widget/flashcard_widget_platform_interface.dart';
import 'package:flashcard_widget/flashcard_widget_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlashcardWidgetPlatform
    with MockPlatformInterfaceMixin
    implements FlashcardWidgetPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlashcardWidgetPlatform initialPlatform = FlashcardWidgetPlatform.instance;

  test('$MethodChannelFlashcardWidget is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlashcardWidget>());
  });

  test('getPlatformVersion', () async {
    FlashcardWidget flashcardWidgetPlugin =  FlashcardWidget(japaneseWords: [], japaneseMeanings: [], onSwipeCallback: (int numberNeedPractice, int numberPracticed) {  },);
    MockFlashcardWidgetPlatform fakePlatform = MockFlashcardWidgetPlatform();
    FlashcardWidgetPlatform.instance = fakePlatform;

    expect(await flashcardWidgetPlugin.getPlatformVersion(), '42');
  });
}
