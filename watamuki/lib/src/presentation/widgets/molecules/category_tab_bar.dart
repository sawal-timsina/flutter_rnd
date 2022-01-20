import 'package:flutter/material.dart';
import 'package:watamuki/src/config/themes/colors.dart';
import 'package:watamuki/src/data/models/index.dart';

class CategoryTabBar<T> extends StatelessWidget {
  final List<T> tabs;
  final String? itemKey;
  final ValueChanged<T>? onTap;

  const CategoryTabBar({
    Key? key,
    required this.tabs,
    this.itemKey,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.greyDark))),
      child: DefaultTabController(
        length: tabs.length,
        child: TabBar(
          isScrollable: true,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: Theme.of(context).textTheme.subtitle1,
          unselectedLabelColor: AppColors.black,
          unselectedLabelStyle: Theme.of(context).textTheme.subtitle2,
          labelPadding: const EdgeInsets.symmetric(vertical: 16),
          onTap: (value) {
            onTap!(tabs[value]);
          },
          tabs: tabs.map((T e) {
            String title = "undefined";
            if (e is String) {
              title = e.toString();
            } else if (e is Indexable) {
              title = e[itemKey].toString();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(title),
            );
          }).toList(),
        ),
      ),
    );
  }
}
