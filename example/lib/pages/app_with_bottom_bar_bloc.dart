import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neo_flutterism/neo_flutterism.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: PageA.route,
      initialBinding: BindingsBuilder(() {
        Get.put(
          BottomNavBarController(
            items: [
              BottomNavBarItem(
                index: 0,
                iconData: Icons.list,
              ),
              BottomNavBarItem(
                index: 1,
                iconData: Icons.flash_on_sharp,
              ),
              BottomNavBarItem(
                index: 2,
                iconData: Icons.person,
              ),
            ],
          ),
        );
      }),
      getPages: [
        GetPage(
          name: PageA.route,
          page: () => const PageA(),
        ),
        GetPage(
          name: PageB.route,
          page: () => const PageB(),
        ),
        GetPage(
          name: PageC.route,
          page: () => const PageC(),
        ),
      ],
    );
  }
}

class PageA extends StatelessWidget {
  static const String route = '/page-a';
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWithBottomBar(
      body: Helper(
        viewBuilder: (bottomNavBar) {
          return Center(
            child: Column(
              children: [
                const NeoText('Page A'),
                NeoText('${bottomNavBar.currentIndex}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PageB extends StatelessWidget {
  static const String route = '/page-b';
  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWithBottomBar(
      body: Helper(
        viewBuilder: (bottomNavBar) {
          return Center(
            child: Column(
              children: [
                const NeoText('Page 2'),
                NeoText('${bottomNavBar.currentIndex}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PageC extends StatelessWidget {
  static const String route = '/page-c';
  const PageC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWithBottomBar(
      body: Helper(
        viewBuilder: (bottomNavBar) {
          return Center(
            child: Column(
              children: [
                const NeoText('Page 3'),
                NeoText('${bottomNavBar.currentIndex}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BasePageWithBottomBar extends StatelessWidget {
  const BasePageWithBottomBar({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}

class Helper extends StatelessWidget {
  const Helper({
    Key? key,
    required this.viewBuilder,
  }) : super(key: key);

  final Widget Function(BottomNavBar) viewBuilder;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavBarController>();
    return Obx(() {
      final bottomNavBar = controller.bottomNavBar();
      return viewBuilder(bottomNavBar);
    });
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    Key? key,
    this.activeColor = Colors.red,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavBarController>();
    return Obx(() {
      final bottomNavBar = controller.bottomNavBar();
      return CustomBottomAppBar(
        items: bottomNavBar.items
            .map(
              (data) => NeoIconButton(
                icon: Icon(
                  data.iconData,
                  color: bottomNavBar.currentIndex == data.index
                      ? activeColor
                      : inactiveColor,
                ),
                onPressed: () => controller.setIndex(data.index),
              ),
            )
            .toList(),
      );
    });
  }
}

class BottomNavBarController extends GetxController {
  BottomNavBarController({
    required this.items,
  });

  final List<BottomNavBarItem> items;
  late Rx<BottomNavBar> bottomNavBar;

  @override
  void onInit() {
    bottomNavBar = Rx(
      BottomNavBar(
        currentIndex: 0,
        items: items,
      ),
    );
    super.onInit();
  }

  setIndex(int newIndex) {
    debugPrint('$runtimeType.setIndex($newIndex)');
    bottomNavBar.update((val) {
      debugPrint('$runtimeType.update($val)');
      val?.currentIndex = newIndex;
    });
  }
}

class BottomNavBarItem {
  BottomNavBarItem({
    required this.index,
    required this.iconData,
  });
  final int index;
  final IconData iconData;
}

class BottomNavBar {
  BottomNavBar({
    required this.currentIndex,
    required this.items,
  });
  int currentIndex;
  List<BottomNavBarItem> items;
}

const double defaultNavBarHeight = 60;
const double defaultNotchMargin = 5;
const double defaultBarElevation = 16;
const double defaultIconSize = 32;
const double defaultIconLabelSize = 10;

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final children = items
        .map(
          (item) => Flexible(
            child: item,
          ),
        )
        .toList();

    return BottomAppBar(
      notchMargin: defaultNotchMargin,
      elevation: defaultBarElevation,
      child: SizedBox(
        height: defaultNavBarHeight,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ),
      ),
    );
  }
}
