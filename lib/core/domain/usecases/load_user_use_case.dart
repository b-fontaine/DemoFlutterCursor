import 'package:demo_flutter_cursor/core/data/repositories/authentication_repository.dart';
import 'package:demo_flutter_cursor/core/data/repositories/user_repository.dart';
import 'package:demo_flutter_cursor/core/domain/models/auth/authentication_mode.dart';
import 'package:demo_flutter_cursor/core/domain/models/user/user.dart';
import 'package:demo_flutter_cursor/environnements.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final loadUserUseCaseProvider = Provider<LoadUserUseCase>(
  (ref) => LoadUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
    userRepository: ref.read(userRepositoryProvider),
    mode: ref.read(environmentProvider).authenticationMode,
    logger: Logger(),
  ),
);

/// This use case is responsible for loading the user state
/// based on the current authentication status and mode
class LoadUserUseCase {
  final AuthenticationRepository _authRepository;
  final UserRepository _userRepository;
  final AuthenticationMode mode;
  final Logger _logger;

  LoadUserUseCase({
    required AuthenticationRepository authRepository,
    required UserRepository userRepository,
    required this.mode,
    Logger? logger,
  }) : _authRepository = authRepository,
       _userRepository = userRepository,
       _logger = logger ?? Logger();

  /// Load the state of the user
  Future<User> call() async {
    try {
      final credentials = await _authRepository.get();

      if (credentials == null && mode == AuthenticationMode.anonymous) {
        _logger.i('Anonymous user mode activated, signup anonymously');
        return await _loadAnonymousState();
      } else if (credentials == null &&
          mode == AuthenticationMode.authRequired) {
        _logger.i('Authentification required, user is not connected');
        return const User.anonymous();
      } else if (credentials != null) {
        _logger.i('User is connected with id ${credentials.id}');
        // I like to save a User automatically when the user is authenticated
        // Using firestore you can create a trigger to do this with the same document ID as the credentials
        final user = await _userRepository.get(credentials.id);
        if (user == null) {
          throw Exception('''
User infos not found. If you are using firebase \r\n 
- Check that you have correctly installed firebase functions
If you are using supabase
- Check that you have properly run the setup script
        ''');
        }
        return user;
      }
    } catch (e, stacktrace) {
      _logger.e(e, stackTrace: stacktrace);
      if (kDebugMode) {
        // we automatically logout the user if an error occurs in debug mode
        // customize this behavior to fit your needs
        _authRepository.logout();
      }
      rethrow;
    }
    return const User.anonymous();
  }

  /// Load anonymous state for the user
  Future<User> _loadAnonymousState() async {
    await _authRepository.signupAnonymously();
    await Future.delayed(const Duration(seconds: 1));
    final credentials = await _authRepository.get();
    var user = await _userRepository.get(credentials!.id);

    // if the user is still null you certainly have an issue with your user creation trigger
    if (user == null) {
      user = User.anonymous(
        id: credentials.id,
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
        onboarded: false,
      );
      await _userRepository.create(user);
    }
    return user;
  }
}
