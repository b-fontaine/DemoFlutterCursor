import 'package:demo_flutter_cursor/core/data/repositories/device_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final registerDeviceUseCaseProvider = Provider<RegisterDeviceUseCase>(
  (ref) => RegisterDeviceUseCase(
    deviceRepository: ref.read(deviceRepositoryProvider),
    logger: Logger(),
  ),
);

/// This use case is responsible for registering the user's device for notifications
/// It will register the device and initialize token updates
class RegisterDeviceUseCase {
  final DeviceRepository _deviceRepository;
  final Logger _logger;

  RegisterDeviceUseCase({
    required DeviceRepository deviceRepository,
    Logger? logger,
  }) : _deviceRepository = deviceRepository,
       _logger = logger ?? Logger();

  /// Register the device for the given user ID and initialize token updates
  Future<void> call(String? userId) async {
    if (userId == null) {
      return;
    }

    try {
      final _ = await _deviceRepository.register(userId);
      _deviceRepository.initTokenUpdate();
    } catch (err, stacktrace) {
      _logger.e(err, stackTrace: stacktrace);
      _logger.e('''
          ❌ Your device seems not to be registered.
          Check that you correctly setup a device registration API
          see: `lib/modules/notifications/api/device_api.dart`
        ''');
      rethrow;
    }
  }
}
