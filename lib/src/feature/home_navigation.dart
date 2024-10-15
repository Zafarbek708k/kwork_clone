import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/widgets/drawer.dart';

import '../core/widgets/advanced_drawer/advanced_drawer.dart';
import '../core/widgets/advanced_drawer/drawer_controller.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {


  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: AdvancedDrawerController(),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      backdropColor: context.appTheme.primary,
      drawer: const CustomMainDrawer(),
      child: Scaffold(
        key: HomeNavigation.scaffoldKey,
        body: widget.navigationShell,
        bottomNavigationBar:  Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.symmetric(vertical: BorderSide(color: Colors.black,width: 5))
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              selectedLabelStyle: context.appTextStyle.bodyLarge,
              unselectedLabelStyle: context.appTextStyle.bodyMedium,
              unselectedFontSize: 7,
              selectedFontSize: 10,
              unselectedItemColor: context.appTheme.secondary,
              selectedItemColor: Colors.blue,
              elevation: 0,
              backgroundColor: context.appTheme.primary,
              items:  const [
                BottomNavigationBarItem(icon: Icon(Icons.menu_open_rounded), label: "Catalog"),
                BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_outlined), label: "Chat"),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined), label: "Orders"),
                BottomNavigationBarItem(icon: Icon(Icons.notification_important_outlined), label: "Notification"),
                BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
              ],
              currentIndex: widget.navigationShell.currentIndex,
              onTap: (index) => _onItemTapped(index),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}

