import 'package:flutter/material.dart';
import 'package:watamuki/src/widgets/atoms/button.dart';

class FacilityDetailPage extends StatelessWidget {
  static const routeName = 'facility_detail';

  const FacilityDetailPage({Key? key}) : super(key: key);

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