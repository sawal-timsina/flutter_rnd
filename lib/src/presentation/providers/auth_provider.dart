import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:watamuki/src/config/firebase/auth.dart';
import 'package:watamuki/src/data/models/user/user.dart';
import 'package:watamuki/src/data/repositories/user/user_repository.dart';
import 'package:watamuki/src/injector.dart';

class AuthProvider with ChangeNotifier {
  final UserRepository _userRepository = getIt.get<UserRepository>();
  late User? _dbUser;

  AuthProvider() : super() {
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
    final response = await _userRepository.getDbUser();
    _dbUser = response.data;
    notifyListeners();
  }

  User? get dbUser => _dbUser;

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

  auth.User? _user;

  auth.User? get user => _user;

  void setUser(auth.User? user) {
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
