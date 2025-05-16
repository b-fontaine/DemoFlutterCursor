import 'package:demo_flutter_cursor/core/data/repositories/user_repository.dart';
import 'package:demo_flutter_cursor/core/domain/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final setUserOnboardedUseCaseProvider = Provider<SetUserOnboardedUseCase>(
  (ref) => SetUserOnboardedUseCase(
    userRepository: ref.read(userRepositoryProvider),
    logger: Logger(),
  ),
);

/// This use case is responsible for setting a user as onboarded
class SetUserOnboardedUseCase {
  final UserRepository _userRepository;
  final Logger _logger;

  SetUserOnboardedUseCase({
    required UserRepository userRepository,
    Logger? logger,
  }) : _userRepository = userRepository,
       _logger = logger ?? Logger();

  /// Set the user as onboarded in the database
  Future<User> call(User user) async {
    try {
      return await _userRepository.setOnboarded(user);
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }
}
