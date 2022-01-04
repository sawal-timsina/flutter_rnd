import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';

import 'facility_detail.dart';
import 'home_navigator.dart';

class FacilitiesPage extends StatefulWidget {
  static const routeName = 'facilities';

  const FacilitiesPage({Key? key}) : super(key: key);

  @override
  State<FacilitiesPage> createState() => _FacilitiesPageState();
}

class _FacilitiesPageState extends State<FacilitiesPage>
    with AutomaticKeepAliveClientMixin<FacilitiesPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    String title = FacilitiesPage.routeName;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 8),
          Button(
            onPressed: () {
              homeNavigator.currentState
                  ?.pushNamed(FacilityDetailPage.routeName);
            },
            label: title,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
