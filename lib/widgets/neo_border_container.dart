import 'package:flutter/material.dart';

import 'constants.dart';

class NeoBorderContainer extends StatelessWidget {
  const NeoBorderContainer({
    Key? key,
    required this.child,
    this.height = 40,
    this.width,
    this.hasHardShadow = false,
  }) : super(key: key);

  final Widget child;
  final double height;
  final double? width;
  final bool hasHardShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: hasHardShadow
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(dBorderRadius),
              border: const Border(
                left: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                top: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                right: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                bottom: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black,
                  blurRadius: 0,
                  blurStyle: BlurStyle.solid,
                  offset: Offset(1.5, 2.5),
                ),
              ],
            )
          : null,
      child: child,
    );
  }
}
