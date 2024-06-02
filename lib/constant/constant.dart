import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  static const Color bgSecondary = Color.fromARGB(255, 255, 255, 255);
  static const Color bgPrimary = Color(0xFFF8FAFC);
  // static const Color bgPrimary = Color.fromARGB(255, 255, 251, 245);
  static const Color textPrimary = Color.fromARGB(255, 0, 0, 0);
  static const Color textSecondary = Color.fromARGB(255, 116, 116, 116);
  static const Color bgWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color bgLightBgGreen = Color.fromARGB(255, 224, 252, 235);
  static const Color bgLightOrange = Color(0xFFFFF7ED);
  static const Color bgGreen =Color(0xFF032608);
    static const Color bgSecondaryGreen =Color.fromARGB(255, 0, 143, 21);

  static const Color bgOrange = Color.fromARGB(255, 255, 140, 0);
  static const Color bgRed = Color.fromARGB(255, 188, 59, 59);
    static const Color bgBlue =  Color.fromARGB(255, 0, 140, 255);

  static Widget textWithStyle(
      {required String text,
      required double size,
      String? fontFamily,
      FontStyle? fontStyle,
      required Color color,
      FontWeight? fontWeight = FontWeight.w500,
      double? fontSpacing,
      int? maxLine,
      TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: GoogleFonts.unbounded(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          letterSpacing: fontSpacing),
    );
  }
}
