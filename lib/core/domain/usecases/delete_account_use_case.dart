import 'package:demo_flutter_cursor/core/data/repositories/authentication_repository.dart';
import 'package:demo_flutter_cursor/core/data/repositories/device_repository.dart';
import 'package:demo_flutter_cursor/core/data/repositories/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final deleteAccountUseCaseProvider = Provider<DeleteAccountUseCase>(
  (ref) => DeleteAccountUseCase(
    authRepository: ref.read(authRepositoryProvider),
    userRepository: ref.read(userRepositoryProvider),
    deviceRepository: ref.read(deviceRepositoryProvider),
    logger: Logger(),
  ),
);

/// This use case is responsible for deleting a user account
/// It will delete the user account, unregister the device and logout the user
class DeleteAccountUseCase {
  final AuthenticationRepository _authRepository;
  final UserRepository _userRepository;
  final DeviceRepository _deviceRepository;
  final Logger _logger;

  DeleteAccountUseCase({
    required AuthenticationRepository authRepository,
    required UserRepository userRepository,
    required DeviceRepository deviceRepository,
    Logger? logger,
  }) : _authRepository = authRepository,
       _userRepository = userRepository,
       _deviceRepository = deviceRepository,
       _logger = logger ?? Logger();

  /// Delete the user account and logout
  Future<void> call(String userId) async {
    try {
      _deviceRepository.removeTokenUpdateListener();
      await _deviceRepository.unregister(userId);
      await _userRepository.delete();
      await _authRepository.logout();
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }
}
