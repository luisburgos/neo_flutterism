import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const dBorderRadius = 4.0;

ThemeData neoThemeData() => ThemeData(
  primarySwatch: Colors.blue,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dBorderRadius),
      ),
      minimumSize: const Size(0, 50),
      textStyle: GoogleFonts.plusJakartaSans(
        color: Colors.black,
      ),
      side: const BorderSide(
        width: 2,
        color: Colors.black,
      ),
    ),
  ),
);
