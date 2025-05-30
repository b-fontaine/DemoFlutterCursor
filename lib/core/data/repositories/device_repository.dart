import 'dart:convert';

import 'package:demo_flutter_cursor/core/data/api/device_api.dart';
import 'package:demo_flutter_cursor/core/data/api/dto/device/device_dto.dart';
import 'package:demo_flutter_cursor/core/data/storage/key_value_storage.dart';
import 'package:demo_flutter_cursor/core/domain/models/device/device.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final deviceRepositoryProvider = Provider<DeviceRepository>((ref) {
  final keyValueStorage = ref.watch(keyValueStorageProvider);
  return DeviceRepository(
    keyValueStorage: keyValueStorage,
    deviceApi: ref.watch(deviceApiProvider),
  );
});

const _devicePrefsKey = 'device';

typedef OnTokenRefreshCallback = void Function(Device device);

/// This repository is responsible for the device registration
/// You need to register the device in your backend to be able to send notifications
/// You can also unregister the device
/// The device is also stored in the shared preferences to prevent spamming the backend
/// The token is updated when the token is refreshed
/// Optionnaly you can also add the user id to the methods
class DeviceRepository {
  final DeviceApi _deviceApi;
  final KeyValueStorage _keyValueStorage;

  DeviceRepository({
    required DeviceApi deviceApi,
    required KeyValueStorage keyValueStorage,
  }) : _deviceApi = deviceApi,
       _keyValueStorage = keyValueStorage;

  Future<Device?> get() async {
    final deviceDto = await _getFromPrefs();
    if (deviceDto == null) {
      return null;
    }
    return Device.fromDTO(deviceDto);
  }

  Future<void> register(String userId) async {
    final device = await _getFromPrefs();
    final newDevice = await _deviceApi.get();
    if (device != null && device.token == newDevice.token) {
      return;
    }
    final response = await _deviceApi.register(userId, newDevice);
    await _saveInPrefs(response);
  }

  Future<void> unregister(String userId) async {
    final device = await _getFromPrefs();
    if (device == null) {
      return;
    }
    await _deviceApi.unregister(userId, device.installationId);
    await _removeFromPrefs();
  }

  void initTokenUpdate() {
    _deviceApi.onTokenRefresh((token) async {
      final device = await _getFromPrefs();
      if (device == null) {
        return;
      }
      final updatedDevice = device.copyWith(token: token);
      updateToken(updatedDevice.token);
    });
  }

  void removeTokenUpdateListener() {
    _deviceApi.removeOnTokenRefreshListener();
  }

  Future<void> updateToken(String token) async {
    final device = await _getFromPrefs();
    if (device == null) {
      return;
    }
    final updatedDevice = device.copyWith(token: token);
    await _deviceApi.update(updatedDevice);
    await _saveInPrefs(updatedDevice);
  }

  /// ------------------------------
  /// PRIVATES
  /// ------------------------------

  Future<void> _saveInPrefs(DeviceDTO device) async {
    final json = device.toJsonForPrefs();
    final data = jsonEncode(json);
    await _keyValueStorage.setString(_devicePrefsKey, data);
  }

  Future<DeviceDTO?> _getFromPrefs() async {
    final deviceJson = _keyValueStorage.getString(_devicePrefsKey);
    if (deviceJson != null) {
      final deviceMap = jsonDecode(deviceJson) as Map<String, dynamic>;
      return DeviceDTO.fromPrefs(deviceMap);
    }
    return null;
  }

  Future<void> _removeFromPrefs() async {
    await _keyValueStorage.remove(_devicePrefsKey);
  }
}
