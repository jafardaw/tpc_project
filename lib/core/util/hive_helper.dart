import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  static const String _authBoxName = 'auth_box';
  static const String _tokenKey = 'auth_token';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_authBoxName);
  }

  static Future<void> saveToken(String token) async {
    final box = Hive.box(_authBoxName);
    await box.put(_tokenKey, token);
    debugPrint('Token saved successfully');
  }

  static Future<String?> getToken() async {
    final box = Hive.box(_authBoxName);
    return box.get(_tokenKey);
  }

  static Future<void> deleteToken() async {
    final box = Hive.box(_authBoxName);
    await box.delete(_tokenKey);
    debugPrint('Token deleted successfully');
  }
}
