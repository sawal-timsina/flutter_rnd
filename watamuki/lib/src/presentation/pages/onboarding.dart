import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:watamuki/src/presentation/providers/onboarding_provider.dart';

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    if (kDebugMode) {
      print({"onboarding"});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Onboarding',
              ),
              ElevatedButton(
                  onPressed: () async {
                    context.read<OnboardingProvider>().onboardingFinish();

                    // Navigator.pushReplacementNamed(context, "/");
                    // Navigator.pushReplacement(
                    //     context, MaterialPageRoute(builder: (_) => Home()));
                  },
                  child: const Text("Get started"))
            ],
          ),
        ),
      ),
    );
  }
}
