import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:watamuki/src/presentation/pages/home.dart';
import 'package:watamuki/src/presentation/providers/onboarding_provider.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';

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
