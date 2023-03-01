import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neo_flutterism/neo_flutterism.dart';

import '../widgets/page_template.dart';

class PersonalSitePage extends StatelessWidget {
  static const String route = '/personal-site';

  const PersonalSitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TestPageTemplate(
          label: const NeoText(
            "Hi, I'm Luis Burgos",
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
          icon: const NeoIconButton(
            icon: FaIcon(
              FontAwesomeIcons.bars,
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
                  _cardImage,
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

const _cardImage =
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?'
    'ixlib=rb-0.3.5&'
    'ixid=eyJhcHBfaWQiOjEyMDd9&'
    's=94a1e718d89ca60a6337a6008341ca50&'
    'auto=format&'
    'fit=crop&'
    'w=1950&'
    'q=80';
