import 'package:flutter/material.dart'
    show
        BuildContext,
        EdgeInsets,
        GestureTapCallback,
        Icon,
        IconData,
        Key,
        ListTile,
        Navigator,
        State,
        StatefulWidget,
        Text,
        Theme,
        Widget;

import '../../config/themes/colors.dart';

class DrawerItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback? onTap;

  const DrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        widget.onTap!();
      },
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      leading: Icon(
        widget.icon,
        size: 24.0,
        color: AppColors.black,
      ),
      title: Text(
        widget.title,
        style: Theme.of(context)
            .textTheme
            .subtitle2
            ?.copyWith(color: AppColors.black),
      ),
    );
  }
}
