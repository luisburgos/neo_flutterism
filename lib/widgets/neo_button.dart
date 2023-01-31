import 'package:flutter/material.dart';

import 'neo_border_container.dart';
import 'neo_text.dart';

class NeoButton extends StatelessWidget {
  const NeoButton(
    this.value, {
    Key? key,
    this.allCaps = true,
    this.width,
  }) : super(key: key);

  final String value;
  final bool allCaps;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return NeoBorderContainer(
      width: width,
      child: ElevatedButton(
        onPressed: () => {},
        child: NeoText(
          allCaps ? value.toUpperCase() : value,
        ),
      ),
    );
  }
}
