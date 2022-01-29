import 'dart:convert';

import 'package:watamuki/src/core/QueryProviders/utils/cache_manager.dart';
import 'package:watamuki/src/injector.dart';

class SharedPreferencesCacheManager extends CacheManager {
  @override
  void clear() {
    sharedPreferences.clear();
  }

  @override
  bool containsKey(String key) {
    return sharedPreferences.containsKey(key);
  }

  @override
  get(String key) {
    return jsonDecode(sharedPreferences.get(key) as String);
  }

  @override
  void remove(String key) {
    sharedPreferences.remove(key);
  }

  @override
  Future<bool> set(String key, value) {
    return sharedPreferences.setString(key, jsonEncode(value));
  }
}
