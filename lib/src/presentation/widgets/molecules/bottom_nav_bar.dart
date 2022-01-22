import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/pages/home_pages/coupon.dart';
import 'package:watamuki/src/presentation/pages/home_pages/facilities.dart';
import 'package:watamuki/src/presentation/pages/home_pages/stamp.dart';
import 'package:watamuki/src/presentation/pages/home_pages/top.dart';

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

  BorderRadius radius = const BorderRadius.only(
      topRight: Radius.circular(24), topLeft: Radius.circular(24));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.09),
            offset: Offset(0, -8),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius,
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
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                label: tr(TopPage.routeName),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.local_activity_outlined),
                label: tr(CouponPage.routeName),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.local_police_outlined),
                label: tr(StampPage.routeName),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.grid_view),
                label: tr(FacilitiesPage.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
