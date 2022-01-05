import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider with ChangeNotifier {
  SharedPreferences sharedPreferences;
  late bool _shouldShowOnboardingPage;

  OnboardingProvider(this.sharedPreferences) : super() {
    _shouldShowOnboardingPage =
        sharedPreferences.getBool('shouldShowOnboardingPage') ?? true;
  }

  bool get shouldShowOnboardingPage => _shouldShowOnboardingPage;

  void onboardingFinish() {
    sharedPreferences.setBool('shouldShowOnboardingPage', false);
    _shouldShowOnboardingPage = false;
    notifyListeners();
  }
}
