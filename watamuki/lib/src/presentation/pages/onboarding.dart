import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key);

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

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
                    final SharedPreferences sharedPreferences = await _prefs;
                    sharedPreferences
                        .setBool('shouldShowOnboardingPage', false)
                        .then((_) =>
                            {Navigator.of(context).pushReplacementNamed("/")});
                  },
                  child: const Text("Get started"))
            ],
          ),
        ),
      ),
    );
  }
}
