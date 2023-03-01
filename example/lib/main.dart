import 'package:example/pages/app_with_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:neo_flutterism/neo_flutterism.dart';

import 'pages/expenses_tracker_page.dart';
import 'pages/personal_site_page.dart';

void main() {
  runApp(const GetApp());
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
      initialRoute: _HomePage.route,
      routes: {
        _HomePage.route: (_) => _HomePage(
              items: [
                _HomeItem(
                  'Personal Site',
                  route: PersonalSitePage.route,
                ),
                _HomeItem(
                  'Expenses Tracker',
                  route: ExpensesTrackerPage.route,
                ),
              ],
            ),
        PersonalSitePage.route: (_) => const PersonalSitePage(),
        ExpensesTrackerPage.route: (_) => const ExpensesTrackerPage(),
      },
    );
  }
}

class _HomeItem {
  final String name;
  final String route;

  _HomeItem(
    this.name, {
    required this.route,
  });
}

class _HomePage extends StatelessWidget {
  static const String route = '/';

  const _HomePage({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<_HomeItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Examples',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
            ),
          ),
          const Divider(thickness: 2),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _HomeListTile(
                data: items[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _HomeListTile extends StatelessWidget {
  const _HomeListTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final _HomeItem data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        data.name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(data.route);
      },
    );
  }
}
