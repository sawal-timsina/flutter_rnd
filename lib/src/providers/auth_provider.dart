import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:query_provider/providers/query_provider.dart';
import 'package:watamuki/src/config/firebase/auth.dart';
import 'package:watamuki/src/models/user/user.dart';
import 'package:watamuki/src/services/index.dart';

class AuthProvider with ChangeNotifier {
  User? _dbUser;
  final _userQuery =
      QueryProvider<User>("auth_user", userService.getAuthUser, select: (data) {
    return data["data"];
  }, fetchOnMount: false);

  AuthProvider() : super() {
    _dbUser = null;
    _userQuery.onSuccess = setAuthUser;
    firebaseAuth.authStateChanges().listen((auth.User? user) {
      if (user != null) {
        _user = user;
        _loggedIn = true;
        _userQuery.refetch();
      } else {
        _phoneVerified = false;
        _phoneNumber = "";
        _loggedIn = false;
        _user = null;
        _dbUser = null;
        _userQuery.clearCache();
      }
      notifyListeners();
    });
  }

  void setAuthUser(User user) async {
    _dbUser = user;
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
