import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neo_flutterism/neo_flutterism.dart';

class PageHelper {
  static String routeForIndex(int index) {
    switch (index) {
      case 1:
        return PageB.route;
      case 2:
        return PageC.route;
      default:
        return PageA.route;
    }
  }

  static int indexForRoute(String? route) {
    switch (route) {
      case PageB.route:
        return 1;
      case PageC.route:
        return 2;
      default:
        return 0;
    }
  }
}

class GetApp extends StatelessWidget {
  const GetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: PageA.route,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(
          fenix: true,
          () => BottomNavBarController(
            initialIndex: PageHelper.indexForRoute(
              Get.currentRoute,
            ),
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
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: PageB.route,
          page: () => const PageB(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: PageC.route,
          page: () => const PageC(),
          transition: Transition.fadeIn,
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
      body: UseBottomBarHook(
        viewBuilder: (bottomNavBar, setIndex) {
          return Center(
            child: ReusableColumn(
              label: 'Page A',
              index: bottomNavBar.currentIndex,
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
      body: UseBottomBarHook(
        viewBuilder: (bottomNavBar, setIndex) {
          return Center(
            child: ReusableColumn(
              label: 'Page B',
              index: bottomNavBar.currentIndex,
              mainColor: Colors.green,
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
      body: UseBottomBarHook(
        viewBuilder: (bottomNavBar, setIndex) {
          return Center(
            child: ReusableColumn(
              label: 'Page C',
              index: bottomNavBar.currentIndex,
              mainColor: Colors.red,
            ),
          );
        },
      ),
    );
  }
}

class ReusableColumn extends StatelessWidget {
  const ReusableColumn({
    Key? key,
    required this.label,
    required this.index,
    this.mainColor,
  }) : super(key: key);

  final String label;
  final int index;
  final Color? mainColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NeoText(
          label,
          fontWeight: FontWeight.w900,
          fontSize: 24,
        ),
        const SizedBox(height: 12),
        NeoText('Current Index: $index'),
        const SizedBox(height: 30),
        NavigationControls(mainColor: mainColor),
      ],
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls({
    Key? key,
    this.mainColor,
  }) : super(key: key);

  final Color? mainColor;

  @override
  Widget build(BuildContext context) {
    return UseBottomBarHook(
      viewBuilder: (bottomNavBar, setIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NeoButton(
              'Go to A',
              onPressed: () => setIndex(0),
              backgroundColor: mainColor,
            ),
            const SizedBox(width: 20),
            NeoButton(
              'Go to B',
              onPressed: () => setIndex(1),
              backgroundColor: mainColor,
            ),
            const SizedBox(width: 20),
            NeoButton(
              'Go to C',
              onPressed: () => setIndex(2),
              backgroundColor: mainColor,
            ),
          ],
        );
      },
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

typedef SetIndex = Function(int);

class UseBottomBarHook extends StatelessWidget {
  const UseBottomBarHook({
    Key? key,
    required this.viewBuilder,
  }) : super(key: key);

  final Widget Function(
    BottomNavBar,
    SetIndex,
  ) viewBuilder;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavBarController>();
    return Obx(() {
      final bottomNavBar = controller.bottomNavBar();
      return viewBuilder(
        bottomNavBar,
        (newIndex) {
          controller.setIndex(newIndex);
        },
      );
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
    required this.initialIndex,
    required this.items,
  });

  final int initialIndex;
  final List<BottomNavBarItem> items;
  late Rx<BottomNavBar> bottomNavBar;

  @override
  void onInit() {
    final initial = BottomNavBar(
      currentIndex: initialIndex,
      items: items,
    );
    bottomNavBar = Rx(initial);
    debugPrint('$runtimeType.onInit($initial)');
    super.onInit();
  }

  setIndex(int newIndex) {
    debugPrint('$runtimeType.setIndex($newIndex)');
    bottomNavBar.update((val) {
      debugPrint('$runtimeType.update($val)');
      val?.currentIndex = newIndex;
    });
    Get.toNamed(PageHelper.routeForIndex(newIndex));
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

  @override
  String toString() => 'currentIndex: $currentIndex';
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
