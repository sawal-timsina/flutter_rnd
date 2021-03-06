import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Icon,
        Icons,
        Key,
        PreferredSizeWidget,
        Size,
        SizedBox,
        StatelessWidget,
        Text,
        Theme,
        Widget,
        Wrap,
        WrapCrossAlignment;

class PageHeader extends StatelessWidget implements PreferredSizeWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Icon(
            Icons.location_on_outlined,
            size: 48,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            "Watamuki",
            style: Theme.of(context).textTheme.headline1,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
