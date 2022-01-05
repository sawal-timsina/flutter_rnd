import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;

class AuthProvider with ChangeNotifier {
  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  void setLoggedIn(bool loggedIn) {
    _loggedIn = loggedIn;
    notifyListeners();
  }

  bool _phoneVerified = false;

  bool get phoneVerified => _phoneVerified;

  void setPhoneVerified(bool phoneVerified) {
    _phoneVerified = phoneVerified;
    notifyListeners();
  }

  User? _user;

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  String _phoneNumber = "";

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}
