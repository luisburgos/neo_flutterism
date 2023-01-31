import 'package:flutter/material.dart';

import 'constants.dart';

class NeoCard extends StatelessWidget {
  const NeoCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dBorderRadius),
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                left: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                right: BorderSide(
                  color: Colors.black,
                  width: 4,
                ),
                bottom: BorderSide(
                  color: Colors.black,
                  width: 5,
                ),
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
