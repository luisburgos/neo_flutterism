import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'neo_border_container.dart';

class NeoTextField extends StatelessWidget {
  const NeoTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeoBorderContainer(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'What are you looking for?',
            hintStyle: GoogleFonts.plusJakartaSans(),
          ),
        ),
      ),
    );
  }
}
