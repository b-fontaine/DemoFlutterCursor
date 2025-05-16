import 'package:demo_flutter_cursor/core/data/api/device_api.dart';
import 'package:demo_flutter_cursor/core/data/api/dto/device/device_dto.dart';

class FakeDeviceApi implements DeviceApi {
  OnTokenRefresh? refreshTokenCallback;

  @override
  Future<DeviceDTO> register(String userId, DeviceDTO device) async {
    await Future.delayed(const Duration(milliseconds: 100));
    return Future.value(device.copyWith(id: 'fake_id'));
  }

  @override
  Future<void> unregister(String userId, String deviceId) async {
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<DeviceDTO> get() {
    return Future.value(
      DeviceDTO(
        installationId: 'fake_installation_id',
        token: 'fake_token',
        operatingSystem: OperatingSystem.android,
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
      ),
    );
  }

  @override
  void onTokenRefresh(OnTokenRefresh onTokenRefresh) {
    refreshTokenCallback = onTokenRefresh;
  }

  @override
  Future<DeviceDTO> update(DeviceDTO device) {
    return Future.value(device.copyWith(lastUpdateDate: DateTime.now()));
  }

  @override
  void removeOnTokenRefreshListener() {
    refreshTokenCallback = null;
  }
}
