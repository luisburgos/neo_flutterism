import 'package:flutter/material.dart';

class TestPageTemplate extends StatelessWidget {
  const TestPageTemplate({
    Key? key,
    required this.label,
    required this.icon,
    required this.field,
    required this.card,
    required this.button,
  }) : super(key: key);

  final Widget label;
  final Widget icon;
  final Widget field;
  final Widget card;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              label,
              const Spacer(),
              icon,
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: field,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: card,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: button,
        ),
      ],
    );
  }
}
