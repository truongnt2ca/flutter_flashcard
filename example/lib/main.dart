import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flashcard_widget/flashcard_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flashcardWidgetPlugin =
      FlashcardWidget(japaneseWords: const [], japaneseMeanings: const [], onSwipeCallback: (int numberNeedPractice, int numberPracticed) {  },);

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flashcardWidgetPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashcardWidgetDemo(),
    );
  }
}

class FlashcardWidgetDemo extends StatelessWidget {
  const FlashcardWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> japaneseWords = [
      "愛", // Ai
      "風", // Kaze
      "日", // Hi
      "山", // Yama
      "川", // Kawa
      "花", // Hana
      "海", // Umi
      "空", // Sora
      "月", // Tsuki
      "星" // Hoshi
    ];
    List<String> japaneseMeanings = [
      "Tình yêu",
      "Gió",
      "Mặt trời",
      "Núi",
      "Sông",
      "Hoa",
      "Biển",
      "Bầu trời",
      "Mặt trăng",
      "Ngôi sao"
    ];
    List<String> compoundWords = [
      "愛国", // Aikoku
      "風速", // Fuusoku
      "日光", // Nikkou
      "山頂", // Sanchou
      "河川", // Kasen
      "花火", // Hanabi
      "海岸", // Kaigan
      "天空", // Tenkuu
      "月光", // Gekkou
      "星座" // Seiza
    ];

    List<String> compoundMeanings = [
      "Yêu nước",
      "Tốc độ gió",
      "Ánh sáng mặt trời",
      "Đỉnh núi",
      "Sông ngòi",
      "Pháo hoa",
      "Bờ biển",
      "Bầu trời cao",
      "Ánh sáng mặt trăng",
      "Chòm sao"
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Flashcard Widget Example')),
      body: Center(
        child: FlashcardWidget(
            japaneseWords: japaneseWords,
            japaneseMeanings: japaneseMeanings,
            compoundWords: compoundWords,
            compoundMeanings: compoundMeanings, onSwipeCallback: (int numberNeedPractice, int numberPracticed) {  },),
      ),
    );
  }
}
