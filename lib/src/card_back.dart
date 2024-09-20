import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../config/app_padding.dart';
import '../config/color_manager.dart';
import '../config/styles.dart';
import '../config/widget_factory.dart';

class CardBack extends StatelessWidget {
  final String meaning;
  final String? example;
  final double? meaningFontSize;
  final Color? meaningColor;
  final String? backNote;
  final String? backAudioUrl;
  final AudioPlayer? audioPlayer;

  const CardBack(
      {super.key,
      required this.meaning,
      this.example,
      this.meaningFontSize,
      this.meaningColor,
      this.backNote,
      this.backAudioUrl,
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
                    meaning,
                    style: AppTextStyle.textStyleHeadlineMedium18(
                      color: meaningColor ?? ColorManager.primary20,
                    ).copyWith(
                      fontSize: meaningFontSize ?? 58,
                      height: 92 / 64,
                      fontWeight: FontWeight.w500,
                    ),
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
                  backNote != null && backNote != ''
                      ? Text(
                          'Note: $backNote',
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
                onPressed: (){
                  if (audioPlayer != null&&backAudioUrl!=null&&backAudioUrl!='') {
                    if (audioPlayer?.state == PlayerState.playing) {
                      audioPlayer?.stop().whenComplete(() {
                        audioPlayer?.play(UrlSource(backAudioUrl!));
                      });
                    } else {
                      audioPlayer?.play(UrlSource(backAudioUrl!));
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
