import 'package:accent_service_app/view/main_page/main_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return CurvedNavigationBar(
          // rippleColor: Colors.red,
          key: bottomNavigationKey,
          index: 0,
          height: 60.0,
          color: const Color(0xff74d3d9),
          buttonBackgroundColor: const Color(0xff74d3d9),

          backgroundColor: const Color(0xff1a1b1f),

          animationCurve: Curves.ease,
          animationDuration: const Duration(milliseconds: 500),

          items: const <Widget>[
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.book, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
          ],

          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          letIndexChange: (index) => true,
        );
      },
    );
  }
}
