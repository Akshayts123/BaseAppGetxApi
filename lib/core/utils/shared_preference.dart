import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../di.dart';

 final prefs = getIt<SharedPreferences>();

Future setSharedPrefrence(key, data) async {
  prefs.setString(key, data);
  return data;
}

Future getSharedPrefrence(key) async {
  var value = prefs.getString(key);
  return value;
}
Future<void> setSharedPrefrenceBool(String key, bool value) async {
  prefs.setBool(key, value);
}

getSharedPrefrenceBool(key) async {
  var value = prefs.getBool(key);
  return value;
}

Future<int?> getSharedPrefrenceInt(key) async {
  var value = prefs.getInt(key);
  return value;
}
Future<int?> setSharedPrefrenceInt(key, data) async {
  prefs.setInt(key, data);
}
Future<double?> getSharedPrefrenceDouble(String key) async {
  var value = prefs.getDouble(key);
  return value;
}

Future<void> setSharedPrefrenceDouble(String key, double value) async {
  await prefs.setDouble(key, value);
}
Future<void> removeSharedPreference(String key) async {
  await prefs.remove(key);
}
Future<void> clearSharedPreferences() async {
  await prefs.clear();
}