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
import 'home_navigator.dart';
import 'town_info_details.dart';

class TownInformationPage extends StatelessWidget {
  static const routeName = 'Town_information';

  const TownInformationPage({Key? key}) : super(key: key);

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
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInfoDetailPage.routeName);
            },
            label: title,
          ),
        ],
      ),
    );
  }
}
