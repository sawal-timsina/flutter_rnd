import 'package:flutter/material.dart';
import 'package:watamuki/src/pages/home_pages/town_info_details.dart';
import 'package:watamuki/src/widgets/atoms/button.dart';

import 'home_navigator.dart';

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
