import 'package:flutter/material.dart';

class HexColor {
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  static colorToHex(Color color) {
    var hex = color.value.toRadixString(16);
    if (hex.length == 8) {
      hex = hex.toString().substring(2, hex.length);
      hex = "#$hex";
      return hex;
    }
  }
}
