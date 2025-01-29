import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class TextDesign {
  TextStyle headings = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: MyColor.background,
  );
  TextStyle bodyText = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: MyColor.primary,
  );

  TextStyle buttonText = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: MyColor.secondary,
  );
}
