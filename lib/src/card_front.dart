import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../config/app_padding.dart';
import '../config/color_manager.dart';
import '../config/styles.dart';
import '../config/widget_factory.dart';
import '../config/function.dart';

class CardFront extends StatelessWidget {
  final String word;
  final String? example;
  final double? wordFontSize;
  final Color? wordColor;
  final String? frontNote;
  final String? frontAudioUrl;
  final AudioPlayer? audioPlayer;

  const CardFront(
      {super.key,
      required this.word,
      this.example,
      this.wordFontSize,
      this.wordColor,
      this.frontNote,
      this.frontAudioUrl,
      this.audioPlayer});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    formatWord(word),
                    style: AppTextStyle.textStyleHeadlineMedium18(
                      color: ColorManager.primary20,
                    ).copyWith(
                      fontSize: wordFontSize ?? 58,
                      height: 92 / 64,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  WidgetFactory.vPadding8,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p12,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s4),
                      color: ColorManager.primary90,
                    ),
                    child: Text(
                      example ?? '',
                      style: AppTextStyle.textStyleBodyRegular13(
                        color: ColorManager.neural50,
                      ).copyWith(
                        height: 19 / 13,
                      ),
                    ),
                  ),
                  WidgetFactory.vPadding36,
                  frontNote != null && frontNote != ''
                      ? Text(
                          'Note: $frontNote',
                          style: AppTextStyle.textStyleBodyRegular16(
                            color: ColorManager.neural20,
                          ).copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p12,
              left: AppPadding.p34,
              right: AppPadding.p34,
            ),
            child: IconButton(
                onPressed: () {
                  if (audioPlayer != null&&frontAudioUrl!=null&&frontAudioUrl!='') {
                    if (audioPlayer?.state == PlayerState.playing) {
                      audioPlayer?.stop().whenComplete(() {
                        audioPlayer?.play(UrlSource(frontAudioUrl!));
                      });
                    } else {
                      audioPlayer?.play(UrlSource(frontAudioUrl!));
                    }
                  }
                },
                icon: const Icon(Icons.volume_up_outlined)),
          ),
        ],
      ),
    );
  }
}
