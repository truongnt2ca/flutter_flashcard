import 'package:audioplayers/audioplayers.dart';
import 'package:flashcard_widget/config/extensions.dart';
import 'package:flashcard_widget/src/card_back.dart';
import 'package:flashcard_widget/src/card_front.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'flashcard_widget_platform_interface.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

abstract class Flashcard {
  Widget buildFront();

  Widget buildBack();
}

class FlashcardFront implements Flashcard {
  final String word;
  final String? example;
  final double? wordFontSize;
  final Color? wordColor;
  final String? frontNote;
  final String? frontAudioUrl;
  final AudioPlayer? audioPlayer;

  FlashcardFront({required this.word,
    this.example,
    this.wordFontSize,
    this.wordColor,
    this.frontNote,
    this.frontAudioUrl,
    this.audioPlayer});

  @override
  Widget buildFront() {
    return CardFront(
      word: word,
      example: example,
      wordFontSize: wordFontSize,
      wordColor: wordColor,
      frontNote: frontNote,
      frontAudioUrl: frontAudioUrl,
      audioPlayer: audioPlayer,
    );
  }

  @override
  Widget buildBack() {
    throw UnimplementedError();
  }
}

class FlashcardBack implements Flashcard {
  final String meaning;
  final String? example;
  final double? meaningFontSize;
  final Color? meaningColor;
  final String? backNote;
  final String? backAudioUrl;
  final AudioPlayer? audioPlayer;

  FlashcardBack({required this.meaning,
    this.example,
    this.meaningFontSize,
    this.meaningColor,
    this.backNote,
    this.backAudioUrl,
    this.audioPlayer});

  @override
  Widget buildFront() {
    throw UnimplementedError();
  }

  @override
  Widget buildBack() {
    return CardBack(
      meaning: meaning,
      example: example,
      meaningFontSize: meaningFontSize,
      meaningColor: meaningColor,
      backAudioUrl: backAudioUrl,
      backNote: backNote,
      audioPlayer: audioPlayer,
    );
  }
}

class FlashcardWidget extends StatefulWidget {
  final List<String>? japaneseWords;
  final List<String>? japaneseMeanings;
  final List<String>? compoundWords;
  final List<String>? compoundMeanings;
  final double? wordFontSize;
  final Color? wordColor;
  final Color? frontCardColor;
  final Color? backCardColor;
  final List<String>? frontNote;
  final List<String>? frontAudioUrl;
  final double? meaningFontSize;
  final Color? meaningColor;
  final List<String>? backNote;
  final List<String>? backAudioUrl;
  final double? cardHeight;
  final FlipDirection? flipDirection;
  final Function(int numberNeedPractice, int numberPracticed) onSwipeCallback;
  final TextStyle? learnTextStyle;
  final int? numberOfCardsDisplayed;

  const FlashcardWidget({super.key,
    required this.japaneseWords,
    required this.japaneseMeanings,
    this.compoundWords,
    this.compoundMeanings,
    this.cardHeight,
    this.wordFontSize,
    this.wordColor,
    this.frontNote,
    this.frontAudioUrl,
    this.meaningFontSize,
    this.meaningColor,
    this.backNote,
    this.backAudioUrl,
    this.frontCardColor,
    this.backCardColor,
    this.flipDirection,
    required this.onSwipeCallback,
    this.learnTextStyle,
    this.numberOfCardsDisplayed});

  @override
  FlashcardWidgetState createState() => FlashcardWidgetState();

  Future<String?> getPlatformVersion() {
    return FlashcardWidgetPlatform.instance.getPlatformVersion();
  }
}

class FlashcardWidgetState extends State<FlashcardWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late CardSwiperController _cardSwiperController;
  late List<GlobalKey<FlipCardState>> cardKeys;
  bool _canFlip = true;
  double widthScreen = 0.0,
      heightScreen = 0.0;
  late Animation<double> _animation;
  AnimationStatus animationStatus = AnimationStatus.dismissed;
  bool? isGotIt;
  int numberNeedPractice = 0,
      numberPracticed = 0,
      totalNumber = 0;
  late AudioPlayer _audioPlayer; // AudioPlayer instance
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Initialize AudioPlayer
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _cardSwiperController = CardSwiperController();

    cardKeys = List.generate(
        widget.japaneseWords?.length ?? 0, (_) => GlobalKey<FlipCardState>());

    _animation
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        animationStatus = status;
      });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose the player when widget is destroyed
    super.dispose();
  }

  void handleTap(int index) {
    if (!_canFlip) return; // If debounce is active, do nothing

    setState(() {
      _canFlip = false; // Disable further taps
    });

    final cardState = cardKeys[index].currentState;
    cardState?.toggleCard(); // Flip card on tap
    _audioPlayer.stop();
    // Enable taps again after 800ms
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        _canFlip = true; // Re-enable taps
      });
    });
  }

  void resetCardFlipping() {
    for (var key in cardKeys) {
      final cardState = key.currentState;
      if (cardState?.isFront == false) {
        cardState?.toggleCard(); // Flip to front
      }
    }
  }

  // Stop audio when swiping
  bool _onSwipe(int previousIndex, int? currentIndex,
      CardSwiperDirection direction) {
    _audioPlayer.stop(); // Stop audio on swipe
    setState(() {
      if (direction == CardSwiperDirection.left) {
        numberNeedPractice++;
      } else {
        numberPracticed++;
      }
      widget.onSwipeCallback(numberNeedPractice, numberPracticed);
    });
    return true;
  }

  bool _onUndo(int? previousIndex,
      int currentIndex,
      CardSwiperDirection direction,) {
    debugPrint(
      'The card $currentIndex was undo from the ${direction.name}',
    );
    return true;
  }

  List<Widget> cards(index, double heightPercent, double widthPercent,
      bool? isGotIt) {
    return List.generate(
      widget.japaneseWords?.length ?? 0,
          (index) =>
          Stack(
            children: [
              FlipCard(
                key: cardKeys[index],
                direction: widget.flipDirection ?? FlipDirection.HORIZONTAL,
                flipOnTouch: false,
                // Disable automatic flip on touch
                front: InkWell(
                  onTap: () {
                    //final cardState = cardKeys[index].currentState;
                    handleTap(index);
                    //cardState?.toggleCard(); // Flip card on tap
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.frontCardColor ?? Colors.white,
                      borderRadius: BorderRadius.circular(16), // Bo tròn góc
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 4), // Độ lệch của shadow
                          blurRadius: 6, // Độ mờ của shadow
                        ),
                      ],
                    ),
                    child: FlashcardFront(
                      word: (widget.japaneseWords != null &&
                          index < widget.japaneseWords!.length)
                          ? widget.japaneseWords![index]
                          : '',
                      example: (widget.compoundWords != null &&
                          index < widget.compoundWords!.length)
                          ? widget.compoundWords![index]
                          : '',
                      wordFontSize: widget.wordFontSize,
                      wordColor: widget.wordColor,
                      frontNote: (widget.frontNote != null &&
                          index < widget.frontNote!.length)
                          ? widget.frontNote![index]
                          : '',
                      frontAudioUrl: (widget.frontAudioUrl != null &&
                          index < widget.frontAudioUrl!.length)
                          ? widget.frontAudioUrl![index]
                          : '',
                      audioPlayer: _audioPlayer,
                    ).buildFront(),
                  ),
                ),
                back: InkWell(
                  onTap: () {
                    handleTap(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.backCardColor ?? const Color(0xFFB3E5FC),
                      borderRadius: BorderRadius.circular(16), // Bo tròn góc
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 4), // Độ lệch của shadow
                          blurRadius: 6, // Độ mờ của shadow
                        ),
                      ],
                    ),
                    child: FlashcardBack(
                      meaning: (widget.japaneseMeanings != null &&
                          index < widget.japaneseMeanings!.length)
                          ? widget.japaneseMeanings![index]
                          : '',
                      example: (widget.compoundMeanings != null &&
                          index < widget.compoundMeanings!.length)
                          ? widget.compoundMeanings![index]
                          : '',
                      meaningFontSize: widget.meaningFontSize,
                      meaningColor: widget.meaningColor,
                      backNote: (widget.backNote != null &&
                          index < widget.backNote!.length)
                          ? widget.backNote![index]
                          : '',
                      backAudioUrl: (widget.backAudioUrl != null &&
                          index < widget.backAudioUrl!.length)
                          ? widget.backAudioUrl![index]
                          : '',
                      audioPlayer: _audioPlayer,
                    ).buildBack(),
                  ),
                ),
              ),
              if (widthPercent <= 1 && heightPercent <= 1)
                AnimatedContainer(
                  decoration: BoxDecoration(
                    color: isGotIt ?? false
                        ? Colors.green
                        .withOpacity(math.max(widthPercent, heightPercent))
                        : Colors.red
                        .withOpacity(math.max(widthPercent, heightPercent)),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)),
                  ),
                  width: double.infinity,
                  height: 70.0,
                  duration: Duration.zero,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateY(math.pi * _animation.value),
                    child: Center(
                      child: Text(
                        isGotIt == true
                            ? "Đã thuộc"
                            : isGotIt == false
                            ? "Chưa thuộc"
                            : '',
                        style: widget.learnTextStyle,
                      ),
                    ),
                  ),
                ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery
        .of(context)
        .size
        .width;
    heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Center(
        child: SizedBox(
            height: widget.cardHeight ?? context.vspx() * 350,
            child: CardSwiper(
                controller: _cardSwiperController,
                cardsCount: cards(0, 0, 0, false).length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: widget.numberOfCardsDisplayed ?? 3,
                backCardOffset:
                Offset(0, (widget.cardHeight ?? context.vspx() * 350) / 18),
                padding: const EdgeInsets.all(24.0),
                onEnd: () {
                  setState(() {
                    numberNeedPractice = 0;
                    numberPracticed = 0;
                  });
                },
                cardBuilder: (context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,) {
                  if (index >= cards(index, 0, 0, false).length) index = 0;
                  double heightPercent =
                      verticalThresholdPercentage.abs() / heightScreen / 2;
                  double widthPercent =
                      horizontalThresholdPercentage.abs() / widthScreen / 2;
                  isGotIt = horizontalThresholdPercentage > 0
                      ? true
                      : horizontalThresholdPercentage < 0
                      ? false
                      : null;
                  return cards(
                      index, heightPercent, widthPercent, isGotIt)[index];
                })),
      ),
    );
  }
}
