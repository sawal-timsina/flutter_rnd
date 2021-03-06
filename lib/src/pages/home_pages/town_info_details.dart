import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Column,
        Key,
        MainAxisAlignment,
        SizedBox,
        StatelessWidget,
        Text,
        Widget;

import '../../widgets/atoms/button.dart';

class TownInfoDetailPage extends StatelessWidget {
  static const routeName = 'town_info_details';

  const TownInfoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = routeName;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 8),
          Button(
            onPressed: () {},
            label: title,
          ),
        ],
      ),
    );
  }
}
