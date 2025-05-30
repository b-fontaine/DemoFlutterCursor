import 'package:demo_flutter_cursor/core/data/storage/key_value_storage.dart';

class KeyValueStorageFake extends KeyValueStorage {
  final Map<String, String> _storage = {};

  @override
  Future<void> setString(String key, String value) async {
    _storage[key] = value;
  }

  @override
  bool? getBool(String key) {
    return _storage[key] == 'true';
  }

  @override
  int? getInt(String key) {
    return int.tryParse(_storage[key] ?? '');
  }

  @override
  String? getString(String key) {
    return _storage[key];
  }

  @override
  Future<void> init() {
    return Future.value();
  }

  @override
  Future<void> remove(String key) {
    _storage.remove(key);
    return Future.value();
  }

  @override
  Future<void> setBool(String key, bool value) {
    _storage[key] = value.toString();
    return Future.value();
  }

  @override
  Future<void> setInt(String key, int value) {
    _storage[key] = value.toString();
    return Future.value();
  }
}
