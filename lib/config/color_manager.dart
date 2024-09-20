import 'package:flutter/material.dart';

abstract interface class ColorManager {
  //* Primary-Color
  static Color primary100 = HexColor("#F0F4FF");
  static Color primary90 = HexColor("#DFE3F1");
  static Color primary80 = HexColor("#D4DCFE");
  static Color primary70 = HexColor("#ADBFFF");
  static Color primary60 = HexColor("#85A0FF");
  static Color primary50 = HexColor("#647BE5");
  static Color primary40 = HexColor("#3E67D6");
  static Color primary35 = HexColor("#3054D1");
  static Color primary30 = HexColor("#3248C7");
  static Color primary20 = HexColor("#2F44B9");
  static Color primary10 = HexColor("#12206D");
  static Color primary0 = HexColor("#0B1446");

  //* Accent-Color
  static Color accent90 = HexColor("#FFE5B2");
  static Color accent60 = HexColor("#FFB629");
  static Color accent50 = HexColor("#FFA800");

  //* Neutral-Color
  static Color neural100 = HexColor("#FFFFFF");
  static Color neural95 = HexColor("#F3F7FF");
  static Color neural90 = HexColor("#E7EDF8");
  static Color neural80 = HexColor("#BEC9E4");
  static Color neural70 = HexColor("#A1A5BA");
  static Color neural60 = HexColor("#7B809D");
  static Color neural55 = HexColor("#626784");
  static Color neural50 = HexColor("#494E69");
  static Color neural40 = HexColor("#363949");
  static Color neural30 = HexColor("#272A35");
  static Color neural20 = HexColor("#191C29");
  static Color neural10 = HexColor("#0A0D1F");
  static Color neural0 = HexColor("#030512");

  //*Tertiary
  static Color tertiary = HexColor("#3C3C43");

  //* Semantic-Color
  static Color semanticRed100 = HexColor('#FFF1F1');
  static Color semanticRed80 = HexColor('#FFADB0');
  static Color semanticRed70 = HexColor('#EF6268');
  static Color semanticRed60 = HexColor('#F63E46');
  static Color semanticRed40 = HexColor('#BB111F');

  static Color semanticGreen100 = HexColor('#E3FFF3');
  static Color semanticGreen90 = HexColor('#BEF4DD');
  static Color semanticGreen50 = HexColor('#37DB96');
  static Color semanticGreen30 = HexColor('##1B9763');
  static Color semanticGreen20 = HexColor('#136C47');
  static Color semanticGreen10 = HexColor('#004126');

  static Color semanticYellow70 = HexColor('#FFF566');

  //* Blue-Color
  static Color blur0 = HexColor("#130086");
  static Color blur1 = HexColor("#677CF8");
  static Color blur2 = HexColor("#3965DE");

  static Color colorGradient1CreateAGroup = HexColor("#3864D0");
  static Color colorGradient2CreateAGroup = HexColor("#469BF6");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "ff$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
