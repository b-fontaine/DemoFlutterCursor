import 'package:demo_flutter_cursor/core/domain/models/auth/authentication_mode.dart';
import 'package:demo_flutter_cursor/core/domain/models/user/user.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/delete_account_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/get_user_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/load_user_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/logout_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/register_device_use_case.dart';
import 'package:demo_flutter_cursor/core/domain/usecases/set_user_onboarded_use_case.dart';
import 'package:demo_flutter_cursor/core/initializer/onstart_service.dart';
import 'package:demo_flutter_cursor/core/ui/states/models/user_state.dart';
import 'package:demo_flutter_cursor/environnements.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserState>(
      (ref) => UserStateNotifier(
        loadUserUseCase: ref.read(loadUserUseCaseProvider),
        deleteAccountUseCase: ref.read(deleteAccountUseCaseProvider),
        logoutUseCase: ref.read(logoutUseCaseProvider),
        registerDeviceUseCase: ref.read(registerDeviceUseCaseProvider),
        getUserUseCase: ref.read(getUserUseCaseProvider),
        setUserOnboardedUseCase: ref.read(setUserOnboardedUseCaseProvider),
        mode: ref.read(environmentProvider).authenticationMode,
      ),
    );

/// This class is responsible for managing the state of the user over the app.
/// It will be used to know if the user is connected or not and to get the user
class UserStateNotifier extends StateNotifier<UserState>
    implements OnStartService {
  final LoadUserUseCase _loadUserUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  final LogoutUseCase _logoutUseCase;
  final RegisterDeviceUseCase _registerDeviceUseCase;
  final GetUserUseCase _getUserUseCase;
  final SetUserOnboardedUseCase _setUserOnboardedUseCase;
  final Logger _logger;

  /// The authentication mode of the app
  /// see [AuthenticationMode]
  final AuthenticationMode mode;

  UserStateNotifier({
    required LoadUserUseCase loadUserUseCase,
    required DeleteAccountUseCase deleteAccountUseCase,
    required LogoutUseCase logoutUseCase,
    required RegisterDeviceUseCase registerDeviceUseCase,
    required GetUserUseCase getUserUseCase,
    required SetUserOnboardedUseCase setUserOnboardedUseCase,
    Logger? logger,
    this.mode = AuthenticationMode.anonymous,
  }) : _loadUserUseCase = loadUserUseCase,
       _deleteAccountUseCase = deleteAccountUseCase,
       _logoutUseCase = logoutUseCase,
       _registerDeviceUseCase = registerDeviceUseCase,
       _getUserUseCase = getUserUseCase,
       _setUserOnboardedUseCase = setUserOnboardedUseCase,
       _logger = logger ?? Logger(),
       super(const UserState(user: User.loading()));

  @override
  Future<void> init() async {
    await _loadState();

    assert(state.user is! LoadingUserData, 'UserStateNotifier is not ready');
    await _registerDeviceUseCase(state.user.idOrNull);
  }

  /// This function is called when the user click on the signin button
  /// It will load the user state and register the device to the notification service
  /// It will also load the subscription state
  Future<void> onSignin() async {
    state = const UserState(user: User.loading());
    await _loadState();
    await _registerDeviceUseCase(state.user.idOrNull);
  }

  /// Set the user as onboarded in the database
  /// This function is called when the user has completed the onboarding
  Future<void> onOnboarded() async {
    try {
      final newUser = await _setUserOnboardedUseCase(state.user);
      state = state.copyWith(user: newUser);
    } catch (e) {
      _logger.e(e);
    }
  }

  /// This function is called when the user click on the logout button
  /// It will unregister the device from the notification service
  /// and logout the user
  Future<void> onLogout() async {
    final userId = state.user.idOrThrow;
    try {
      await _logoutUseCase(userId);
    } catch (e) {
      _logger.e(e);
    }
    state = const UserState(user: User.anonymous());
    if (mode == AuthenticationMode.anonymous) {
      await _loadState();
    }
  }

  /// Refresh the user
  Future<void> onUpdateAvatar() async {
    await refresh();
  }

  /// Refresh the user
  Future<void> refresh() async {
    try {
      final user = await _getUserUseCase(state.user.idOrThrow);
      state = state.copyWith(user: user ?? const User.anonymous());
    } catch (e) {
      _logger.e(e);
    }
  }

  /// Apple store and Google play stores requires you to be able to delete a user account on demand
  /// Here is the function to do it.
  /// It will delete the user account and logout the user
  Future<void> deleteAccount() async {
    try {
      final userId = state.user.idOrThrow;
      await _deleteAccountUseCase(userId);
    } catch (e) {
      _logger.e(e);
    }
    state = const UserState(user: User.anonymous());

    if (mode == AuthenticationMode.anonymous) {
      await _loadState();
    }
  }

  // -------------------------------
  // PRIVATES
  // -------------------------------

  /// Load the state of the user
  Future<void> _loadState() async {
    final user = await _loadUserUseCase();
    state = state.copyWith(user: user);
  }
}
