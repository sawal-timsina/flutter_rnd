import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:watamuki/src/config/api/api.dart';
import 'package:watamuki/src/config/firebase/auth.dart' show firebaseAuth;
import 'package:watamuki/src/data/data_sources/remote/user/user_service.dart';
import 'package:watamuki/src/data/models/user_modal.dart';

class AuthProvider with ChangeNotifier {
  late UserModal? _dbUser;

  AuthProvider() : super() {
    firebaseAuth.authStateChanges().listen((User? user) {
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

  void getAuthUser() {
    kAPI.getService<UserService>().getAuthUser().then((res) {
      _dbUser = res.body?.data;
      _phoneVerified = (_dbUser?.isPhoneVerified)!;
      _phoneNumber = (_dbUser?.phone)!;
      notifyListeners();
    });
  }

  UserModal? get dbUser => _dbUser;

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
