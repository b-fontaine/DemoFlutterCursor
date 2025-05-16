import 'package:demo_flutter_cursor/core/domain/models/credentials/credentials.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _kTokenKey = "token";
const _kUserIdKey = "userId";

final securedStorageProvider = Provider<SecuredStorage>(
  (ref) => SecuredStorage.fromEnv(),
);

class SecuredStorage {
  final FlutterSecureStorage _storage;

  SecuredStorage({required FlutterSecureStorage storage}) : _storage = storage;

  factory SecuredStorage.fromEnv() =>
      SecuredStorage(storage: const FlutterSecureStorage());

  Future<void> write({required Credentials value}) async {
    await _storage.write(key: _kUserIdKey, value: value.id);
    await _storage.write(key: _kTokenKey, value: value.token);
  }

  Future<Credentials?> read() async {
    final userId = await _storage.read(key: _kUserIdKey);
    final token = await _storage.read(key: _kTokenKey);
    if (userId != null && token != null) {
      return Credentials(id: userId, token: token);
    }
    return null;
  }

  Future<void> clear() async {
    await _storage.delete(key: _kUserIdKey);
    await _storage.delete(key: _kTokenKey);
  }
}
