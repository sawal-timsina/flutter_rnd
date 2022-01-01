import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        Button(
          type: ButtonType.transparent,
          icon: const Icon(Icons.directions_bus, size: 24),
          label: "Bus pass",
          textStyle: Theme.of(context).textTheme.subtitle1,
          disableBorder: true,
          onPressed: () {},
        ),
        Button(
          type: ButtonType.transparent,
          label: "Route",
          textStyle: Theme.of(context).textTheme.subtitle1,
          disableBorder: true,
          onPressed: () {},
        ),
        Button(
          type: ButtonType.transparent,
          label: "Timetable",
          textStyle: Theme.of(context).textTheme.subtitle1,
          disableBorder: true,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(SizerUtil.width, 56);
}
