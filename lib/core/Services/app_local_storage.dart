import 'package:hive/hive.dart';

class AppLocalStorage {
  static late Box userBox;

  static init() {
    userBox = Hive.box('user');
  }

  static cashData(String key, dynamic value) {
    userBox.put(key, value);
  }

  static getcashData(String key) {
    return userBox.get(key);
  }
}
