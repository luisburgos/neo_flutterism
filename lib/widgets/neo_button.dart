import 'package:flutter/material.dart';

import 'neo_border_container.dart';
import 'neo_text.dart';

class NeoButton extends StatelessWidget {
  const NeoButton({
    Key? key,
    this.value,
    this.allCaps = true,
    this.width,
    this.onPressed,
    this.backgroundColor,
    this.padding,
    this.child,
  }) : super(key: key);

  final String? value;
  final bool allCaps;
  final double? width;
  final Function()? onPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return NeoBorderContainer(
      width: width,
      hasHardShadow: true,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? Colors.blue, //TODO: Change to access NeoTheme.
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) return Colors.blue;
            return null;
          }),
        ),
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12,
              ),
          child: (child != null && value == null)
              ? child
              : NeoText(
                  allCaps ? value!.toUpperCase() : value!,
                ),
        ),
      ),
    );
  }
}
