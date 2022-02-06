import 'package:flutter/material.dart';
import 'package:watamuki/src/pages/home_pages/facility_detail.dart';
import 'package:watamuki/src/widgets/atoms/button.dart';

import 'home_navigator.dart';

class StampPage extends StatefulWidget {
  static const routeName = 'Stamp';

  const StampPage({Key? key}) : super(key: key);

  @override
  State<StampPage> createState() => _StampPageState();
}

class _StampPageState extends State<StampPage>
    with AutomaticKeepAliveClientMixin<StampPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    String title = StampPage.routeName;
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
