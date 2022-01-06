import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function(int index) onTap;

  const BottomNavBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24), topLeft: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(0, -8),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24), topLeft: Radius.circular(24)),
        child: Padding(
          padding: defaultTargetPlatform == TargetPlatform.iOS
              ? const EdgeInsets.only(top: 16)
              : const EdgeInsets.symmetric(vertical: 16),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
              widget.onTap(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Top',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_activity_outlined),
                label: 'Coupon',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_police_outlined),
                label: 'Stamp',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: 'Facilities',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class _BottomNavBarState extends State<BottomNavBar> {
  HomePage _homePage = HomePage([TopPage.routeName], 0);

  @override
  void initState() {
    super.initState();
    widget.tabsChangeNotifier.addListener(() {
      print("bottom nav state changed");
      setState(() {
        _homePage = widget.tabsChangeNotifier.value;
      });
    });
  }
}
*/
