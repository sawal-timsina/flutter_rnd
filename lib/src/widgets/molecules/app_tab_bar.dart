import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';
import '../../models/optionItem/index.dart';

class AppTabBar extends StatelessWidget {
  final List<OptionItem> options;
  final ValueChanged<OptionItem>? onSelected;

  const AppTabBar({
    Key? key,
    required this.options,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        border: Border.all(color: AppColors.greyDark, width: 1),
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: TabBar(
        labelStyle: Theme.of(context).textTheme.subtitle2,
        labelPadding: const EdgeInsets.all(0),
        indicator: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        unselectedLabelColor: AppColors.black,
        tabs: <Widget>[
          for (var value in options)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: AppColors.greyDark,
                          width: 1,
                          style: BorderStyle.solid))),
              child: Center(
                child: Text(
                  value.title,
                ),
              ),
            )
        ],
        onTap: (e) {
          if (onSelected != null) {
            onSelected!(options[e]);
          }
        },
      ),
    );
  }
}
