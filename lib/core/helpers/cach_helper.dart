import 'dart:convert';
import 'package:dua_zekr/features/favorites/data/models/fav_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async =>
      await sharedPreferences!.setBool(key, value);

  static bool? getBoolean({required String key}) =>
      sharedPreferences!.getBool(key);

  static Future<bool> putString({
    required String key,
    required String value,
  }) async =>
      await sharedPreferences!.setString(key, value);

  static String? getString({required String key}) =>
      sharedPreferences!.getString(key);

  static Future<bool> remove({required String key}) async =>
      await sharedPreferences!.remove(key);

  static Future<bool> clear() async =>
      await sharedPreferences!.clear();
}
