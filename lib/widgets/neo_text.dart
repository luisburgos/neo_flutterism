import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeoText extends StatelessWidget {
  const NeoText(
      this.value, {
        Key? key,
        this.fontWeight = FontWeight.w700,
        this.fontSize = 14,
      }) : super(key: key);

  final String value;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: GoogleFonts.plusJakartaSans(
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
