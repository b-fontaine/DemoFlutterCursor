import 'package:demo_flutter_cursor/core/data/repositories/authentication_repository.dart';
import 'package:demo_flutter_cursor/core/data/repositories/device_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final logoutUseCaseProvider = Provider<LogoutUseCase>(
  (ref) => LogoutUseCase(
    authRepository: ref.read(authRepositoryProvider),
    deviceRepository: ref.read(deviceRepositoryProvider),
    logger: Logger(),
  ),
);

/// This use case is responsible for logging out a user
/// It will unregister the device from the notification service and logout the user
class LogoutUseCase {
  final AuthenticationRepository _authRepository;
  final DeviceRepository _deviceRepository;
  final Logger _logger;

  LogoutUseCase({
    required AuthenticationRepository authRepository,
    required DeviceRepository deviceRepository,
    Logger? logger,
  }) : _authRepository = authRepository,
       _deviceRepository = deviceRepository,
       _logger = logger ?? Logger();

  /// Logout the user and unregister the device
  Future<void> call(String userId) async {
    try {
      _deviceRepository.removeTokenUpdateListener();
      await _deviceRepository.unregister(userId);
      await _authRepository.logout();
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }
}
