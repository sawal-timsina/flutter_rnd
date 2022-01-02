import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';

import 'home_navigator.dart';

class SpecialFeaturePage extends StatelessWidget {
  static const routeName = 'special_feature';

  const SpecialFeaturePage({Key? key}) : super(key: key);

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
              homeNavigator.currentState?.pushNamed("facility_detail");
            },
            label: title,
          ),
        ],
      ),
    );
  }
}
