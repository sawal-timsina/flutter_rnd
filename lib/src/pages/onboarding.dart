import 'package:easy_localization/easy_localization.dart' show tr;
import 'package:flutter/material.dart'
    show
        BoxConstraints,
        BuildContext,
        Column,
        ConstrainedBox,
        Key,
        MainAxisAlignment,
        Navigator,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiMode, SystemUiOverlay;
import 'package:provider/provider.dart';

import '../providers/onboarding_provider.dart';
import '../widgets/atoms/button.dart';
import 'home.dart';

class Onboarding extends StatelessWidget {
  static const routeName = 'onboarding';

  Onboarding({Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              tr('Onboarding'),
            ),
            Button(
              onPressed: () async {
                context.read<OnboardingProvider>().onboardingFinish();
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              label: "Get started",
            )
          ],
        ),
      ),
    );
  }
}
