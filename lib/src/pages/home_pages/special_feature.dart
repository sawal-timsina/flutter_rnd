import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Key,
        ListView,
        SizedBox,
        StatelessWidget,
        Text,
        Widget;

import '../../widgets/atoms/button.dart';
import 'facility_detail.dart';
import 'home_navigator.dart';
import 'town_info_details.dart';

class SpecialFeaturePage extends StatelessWidget {
  static const routeName = 'Special_feature';

  const SpecialFeaturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = routeName;

    return Center(
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInfoDetailPage.routeName);
            },
            label: TownInfoDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(FacilityDetailPage.routeName);
            },
            label: FacilityDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInfoDetailPage.routeName);
            },
            label: TownInfoDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(FacilityDetailPage.routeName);
            },
            label: FacilityDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInfoDetailPage.routeName);
            },
            label: TownInfoDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(FacilityDetailPage.routeName);
            },
            label: FacilityDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInfoDetailPage.routeName);
            },
            label: TownInfoDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(FacilityDetailPage.routeName);
            },
            label: FacilityDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInfoDetailPage.routeName);
            },
            label: TownInfoDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(FacilityDetailPage.routeName);
            },
            label: FacilityDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInfoDetailPage.routeName);
            },
            label: TownInfoDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(FacilityDetailPage.routeName);
            },
            label: FacilityDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInfoDetailPage.routeName);
            },
            label: TownInfoDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(FacilityDetailPage.routeName);
            },
            label: FacilityDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(TownInfoDetailPage.routeName);
            },
            label: TownInfoDetailPage.routeName,
          ),
          const SizedBox(height: 16),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(FacilityDetailPage.routeName);
            },
            label: FacilityDetailPage.routeName,
          ),
        ],
      ),
    );
  }
}
