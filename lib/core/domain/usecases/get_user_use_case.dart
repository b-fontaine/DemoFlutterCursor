import 'package:demo_flutter_cursor/core/data/repositories/user_repository.dart';
import 'package:demo_flutter_cursor/core/domain/models/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final getUserUseCaseProvider = Provider<GetUserUseCase>(
  (ref) => GetUserUseCase(
    userRepository: ref.read(userRepositoryProvider),
    logger: Logger(),
  ),
);

/// This use case is responsible for getting a user by their ID
class GetUserUseCase {
  final UserRepository _userRepository;
  final Logger _logger;

  GetUserUseCase({required UserRepository userRepository, Logger? logger})
    : _userRepository = userRepository,
      _logger = logger ?? Logger();

  /// Get user by ID
  Future<User?> call(String userId) async {
    try {
      return await _userRepository.get(userId);
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }
}
