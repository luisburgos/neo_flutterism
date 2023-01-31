import 'package:flutter/material.dart';

import 'neo_border_container.dart';

// https://stackoverflow.com/a/57237866
class NeoIconButton extends StatelessWidget {
  const NeoIconButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return NeoBorderContainer(
      width: 50,
      height: 50,
      hasHardShadow: true,
      child: ElevatedButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: () => {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) return Colors.blue;
            return null;
          }),
        ),
        child: icon,
      ),
    );
  }
}
