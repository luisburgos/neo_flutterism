import 'package:flutter/material.dart';
import 'package:neo_flutterism/neo_flutterism.dart';
import 'package:neo_flutterism/widgets/neo_text_button.dart';

void main() {
  runApp(const MyApp());
}

//FIXME: Weird white space at the joints of container borders.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neobrutalism Test',
      debugShowCheckedModeBanner: false,
      theme: neoThemeData(),
      home: const TestPage(),
    );
  }
}

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _TestPageTemplate(
          label: const NeoText(
            "Hi, I'm Luis Burgos",
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
          icon: const NeoIconButton(
            icon: Icon(
              Icons.help,
              color: Colors.black,
            ),
          ),
          field: const NeoTextField(),
          card: NeoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
                  fit: BoxFit.cover,
                  height: 140,
                  width: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      NeoText(
                        'This is a title',
                        fontSize: 20,
                      ),
                      SizedBox(height: 6),
                      NeoText(
                        'This is a subtitle',
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          button: const NeoButton(
            'Click me',
            width: 200,
          ),
        ),
      ),
    );
  }
}

class _TestPageTemplate extends StatelessWidget {
  const _TestPageTemplate({
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
