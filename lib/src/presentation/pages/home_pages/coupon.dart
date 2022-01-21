import 'package:flutter/material.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';

import 'home_navigator.dart';

class CouponPage extends StatefulWidget {
  static const routeName = 'coupon';

  const CouponPage({Key? key}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage>
    with AutomaticKeepAliveClientMixin<CouponPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    String title = CouponPage.routeName;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(height: 8),
          Button(
            onPressed: () {
              if (title == "Facilities") {
                homeNavigator.currentState?.pushNamed("facility_detail");
              }
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
