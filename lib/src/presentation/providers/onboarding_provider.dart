import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watamuki/src/injector.dart';

class OnboardingProvider with ChangeNotifier {
  SharedPreferences sharedPreferences = getIt.get<SharedPreferences>();
  late bool _shouldShowOnboardingPage;

  OnboardingProvider() : super() {
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
