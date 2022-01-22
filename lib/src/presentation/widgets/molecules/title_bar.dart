import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';
import 'package:watamuki/src/presentation/widgets/atoms/tag.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Tag(
            title: title,
            icon: icon,
            type: TagType.transparent,
            textStyle: Theme.of(context).textTheme.headline2,
            padding: const EdgeInsets.symmetric(horizontal: 0.1),
          ),
          Button(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            size: ButtonSize.medium,
            onPressed: () {},
            label: tr("Search from area"),
          ),
        ],
      ),
    );
  }
}
