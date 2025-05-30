import 'package:demo_flutter_cursor/core/initializer/onstart_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final keyValueStorageProvider = Provider<KeyValueStorage>(
  (ref) => SharedPreferencesProxy(),
);

abstract class KeyValueStorage extends OnStartService {
  Future<void> setString(String key, String value);
  String? getString(String key);
  Future<void> setBool(String key, bool value);
  bool? getBool(String key);
  Future<void> setInt(String key, int value);
  int? getInt(String key);
  Future<void> remove(String key);
}

class SharedPreferencesProxy implements KeyValueStorage {
  SharedPreferences? _sharedPreferences;

  @override
  Future<void> init() async {
    if (_sharedPreferences != null) {
      return;
    }
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences get _prefs {
    if (_sharedPreferences == null) {
      throw Exception('SharedPreferences not loaded');
    }
    return _sharedPreferences!;
  }

  @override
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  @override
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  @override
  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}
