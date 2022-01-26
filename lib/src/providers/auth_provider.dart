import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:watamuki/src/config/firebase/auth.dart';
import 'package:watamuki/src/models/user/user.dart';
import 'package:watamuki/src/services/index.dart';

class AuthProvider with ChangeNotifier {
  User? _dbUser;

  AuthProvider() : super() {
    _dbUser = null;
    firebaseAuth.authStateChanges().listen((auth.User? user) {
      if (user != null) {
        _user = user;
        _loggedIn = true;
        getAuthUser();
      } else {
        _phoneVerified = false;
        _phoneNumber = "";
        _loggedIn = false;
        _user = null;
        _dbUser = null;
      }
      notifyListeners();
    });
  }

  void getAuthUser() async {
    _dbUser = await userService.getAuthUser(null);
    notifyListeners();
  }

  User? get dbUser => _dbUser;

  bool _loggedIn = false;

  bool get loggedIn => _loggedIn;

  bool _phoneVerified = false;

  bool get phoneVerified => _phoneVerified;

  void setPhoneVerified(bool phoneVerified) {
    _phoneVerified = phoneVerified;
    notifyListeners();
  }

  auth.User? _user;

  auth.User? get user => _user;

  String _phoneNumber = "";

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    notifyListeners();
  }
}
