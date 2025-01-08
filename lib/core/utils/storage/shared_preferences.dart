import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  SharedPreferencesManager._();
  static SharedPreferences? _object;
  static init() async {
    if (_object == null) {
      _object = await SharedPreferences.getInstance();
    } else {
      null;
    }
  }

  static storeBoolValue({required String key, required bool value}) async {
    await _object!.setBool(key, value);
  } 
  static storeStringValue({required String key, required String value}) async {
    await _object!.setString(key, value);
  }

  static storeIntValue({required String key, required int value}) async {
    await _object!.setInt(key, value);
  }

  static bool? getBoolValue({required String key}) {
    return _object!.getBool(key) ;
  } 

  static String getStringValue({required String key}) {
    return _object!.getString(key) ?? "No Value Found";
  }

  static int getIntValue({required String key}) {
    return _object!.getInt(key) ?? 0;
  }
}
