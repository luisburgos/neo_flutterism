import 'package:flutter/material.dart';

import 'neo_border_container.dart';

// https://stackoverflow.com/a/57237866
class NeoIconButton extends StatelessWidget {
  const NeoIconButton({
    Key? key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.overlayColor,
    this.hasHardShadow = true,
  }) : super(key: key);

  final Widget icon;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? overlayColor;
  final bool hasHardShadow;

  @override
  Widget build(BuildContext context) {
    return NeoBorderContainer(
      width: 50,
      height: 50,
      hasHardShadow: hasHardShadow,
      child: hasHardShadow
          ? ElevatedButton(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              onPressed: onPressed,
              style: ButtonStyle(
                shape: hasHardShadow
                    ? MaterialStateProperty.all(const RoundedRectangleBorder())
                    : null,
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                backgroundColor: MaterialStateProperty.all(
                  backgroundColor ??
                      Colors.blue, //TODO: Change to access NeoTheme.
                ),
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return overlayColor ?? Colors.blue;
                  }
                  return null;
                }),
              ),
              child: icon,
            )
          : TextButton(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              style: TextButton.styleFrom(
                elevation: 0,
                backgroundColor: backgroundColor,
                padding: const EdgeInsets.all(0),
              ),
              onPressed: onPressed,
              child: icon,
            ),
    );
  }
}
